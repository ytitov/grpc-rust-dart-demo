use crate::preamble::*;
use crate::messages::BasicResponse;
use crate::models::user::User as User;

#[derive(sqlx::FromRow)]
pub struct Message {
    pub sender_id: Uuid,
    pub message_text: String,
    pub recipient_id: Uuid,
}

impl Message {
    pub async fn new_message(p: &PgPool, username: &str, message_text: &str, recipient_username: &str)
        -> Result<BasicResponse, sqlx::Error> {

            // need user_id and recipient_id
            // get them from usernames
            let sender_id = User::id_from_username(p, username).await?;
            let recipient_id = User::id_from_username(p, recipient_username).await?;

            sqlx::query!("INSERT INTO messages (sender_id, recipient_id, message_text) VALUES ($1, $2, $3) RETURNING message_id",
                        sender_id, recipient_id, message_text)
                .fetch_one(p).await?;

            Ok( BasicResponse{success: true, message: format!("Message sent")} )
    }

    /*
    pub async fn set_password(p: &PgPool, username: &str, pwd: &str) -> Result<GenericResult, sqlx::Error> {
        // get salt and hash 
        match gen_hash_and_salt(pwd) {
            Err(errstr) => Ok(GenericResult{success: false, message: format!("Could not set pwd: {}", errstr).into()}),

            Ok((hash, salt)) => { 
                sqlx::query!("UPDATE users SET hash=$1, salt=$2 WHERE username=$3", hash, salt, username)
                    .execute(p)
                    .await?;

                Ok(GenericResult{success: true, message: format!("User {} has new password: {}",
                        username, pwd).into()})
            }
        }
    }
    */
}
