use tokio::sync::mpsc;
use tonic::{Request, Response, Status};

pub mod manageusers;

pub mod models;

pub mod preamble {
    pub use sqlx::{query_as, postgres::PgPool};
    pub use sqlx::types::*;
}

#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        assert_eq!(2 + 2, 4);
    }
}
