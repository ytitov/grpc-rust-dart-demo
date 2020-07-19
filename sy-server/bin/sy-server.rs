use sy_server::{data, RouteGuideService, RouteGuideServer};
use std::sync::Arc;
use tonic::transport::Server;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    //not sure what the difference is
    //let addr = "[::1]:10000".parse().unwrap();
    let addr = "[::]:10000".parse().unwrap();

    println!("Starting server at {:?}", &addr);

    let route_guide = RouteGuideService {
        features: Arc::new(data::load()),
    };

    let svc = RouteGuideServer::new(route_guide);

    Server::builder().add_service(svc).serve(addr).await?;

    Ok(())
}
