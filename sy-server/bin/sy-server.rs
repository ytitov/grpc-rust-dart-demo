//use std::sync::Arc;

use clap::Clap;

use sqlx::postgres::PgPool;

//use sy_server::manageusers::manage_users_server::{ManageUsersServer, ManageUsersService};
use sy_server::manageusers::ManageUsersService;
use sy_server::manageusers::manage_users_server::ManageUsersServer;

use tonic::transport::Server;

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
    let row: (i64,) = sqlx::query_as("SELECT $1")
        .bind(150_i64)
        .fetch_one(&pool)
        .await?;
    println!("postgres query result {:?}", &row);

    Server::builder()
        .add_service(ManageUsersServer::new(ManageUsersService { pg_pool: pool }))
        .serve(addr)
        .await?;

    Ok(())
}
