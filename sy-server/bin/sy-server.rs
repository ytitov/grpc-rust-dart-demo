//use std::sync::Arc;
use std::task::{Context, Poll};
use tonic::{
    transport::{NamedService, Server},
    Request, Response, Status,
};

use tower::Service;

use clap::Clap;

use sqlx::postgres::PgPool;

//use sy_server::manageusers::manage_users_server::{ManageUsersServer, ManageUsersService};
use sy_server::manageusers::ManageUsersService;
use sy_server::manageusers::manage_users_server::ManageUsersServer;

#[derive(Clap, Debug, Clone)]
#[clap(version = "0.1.0", author = "Yuri Titov <ytitov@gmail.com>")]
pub struct Opts {
    #[clap(
        short,
        long,
        about = "Database url to connect to",
        default_value = "postgres://postgres_user:postgres_pw@localhost:5432/default-db"
    )]
    pub db_url: String,
    #[clap(short, long, default_value = "10000", about = "The port to bind to")]
    pub port: String,
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let opts: Opts = Opts::parse();
    println!("OPTS: {:?}", &opts);
    //not sure what the difference is
    //let addr = "[::1]:10000".parse().unwrap();
    let addr = "[::]:10000".parse().unwrap();

    println!("Starting server at {:?}", &addr);

    // Create a connection pool
    let pool = PgPool::connect(&opts.db_url).await?;
    let pool2 = PgPool::connect(&opts.db_url).await?;
    let row: (i64,) = sqlx::query_as("SELECT $1")
        .bind(150_i64)
        .fetch_one(&pool)
        .await?;
    println!("postgres query result {:?}", &row);

    let svc = Svc { pg_pool: pool2, svc: ManageUsersServer::new(ManageUsersService { pg_pool: pool }) };

    Server::builder()
        .add_service(svc)
        .serve(addr)
        .await?;

    Ok(())
}

// this code is copy pasted from:
// https://gist.github.com/LucioFranco/9d5cab419797f54fc7b96bc409d8c6e8

#[derive(Debug, Clone)]
struct Svc<S> {
    svc: S,
    pg_pool: PgPool,
}

//impl<S, Req> Service<Req> for Svc<S>
impl<ManageUsersService, Req> Service<Req> for Svc<ManageUsersService>
where
    ManageUsersService: Service<Req> + Send + Clone + 'static,
    ManageUsersService::Future: Send + 'static,
    Req: Send + 'static,
{
    type Response = ManageUsersService::Response;
    type Error = ManageUsersService::Error;
    type Future = futures::future::BoxFuture<'static, Result<Self::Response, Self::Error>>;

    fn poll_ready(&mut self, cx: &mut Context<'_>) -> Poll<Result<(), Self::Error>> {
        self.svc.poll_ready(cx)
    }

    fn call(&mut self, req: Req) -> Self::Future {
        let mut svc: ManageUsersService = self.svc.clone();
        let pg_pool = self.pg_pool.clone();
        //let p = &self.svc.pg_pool;

        Box::pin(async move {
            // Do async work here....
            let row: Result<(i64,), sqlx::Error> = sqlx::query_as("SELECT $1")
                .bind(150_i64)
                .fetch_one(&pg_pool)
                .await;
            println!("postgres query inside middleware {:?}", &row);
            // very confused why this can't see pg_pool
            //println!("{:?}", &svc.pg_pool);

            svc.call(req).await
        })
    }
}

impl<S: NamedService> NamedService for Svc<S> {
    const NAME: &'static str = S::NAME;
}
