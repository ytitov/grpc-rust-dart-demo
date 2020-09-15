use tokio::sync::mpsc;
use tonic::{Request, Response, Status};

pub mod manageusers;
pub mod messages;

pub mod models;

pub mod auth;

pub mod preamble {
    pub use sqlx::{query_as, postgres::PgPool};
    pub use sqlx::types::*;
}

pub mod util {
    /// the tuple is: (hash, salt)
    pub fn gen_hash_and_salt(pw: &str) -> Result<(String, String), String> {
        use rand::prelude::*;
        let mut rng = rand::thread_rng();
        let _s: usize = rng.gen();
        let salt = format!("{}", _s);
        let pw_salt = format!("{}{}", &salt, &pw);
        match bcrypt::hash(&pw_salt, bcrypt::DEFAULT_COST) {
            Ok(hash) => Ok((hash, salt)),
            Err(e) => Err(e.to_string())
        }
    }

    pub fn verify_pw(hash: &str, salt: &str, pw: &str) -> Result<bool, String> {
        match bcrypt::verify(format!("{}{}", salt, pw), hash) {
            Ok(is_valid) => Ok(is_valid),
            Err(e) => Err(e.to_string())
        }
    }

#[cfg(test)]
    mod tests {
        #[test]
        fn password_hashing_and_checking() {
            use crate::util::*;
            let (hash, salt) = gen_hash_and_salt("barashka123").unwrap();
            let is_valid = verify_pw(&hash, &salt, "barashka123").unwrap();
            assert_eq!(true, is_valid);
        }
    }
}

