pub mod messages;
use super::*;
pub use messages::messages_server::*;
pub use messages::*;
use models::message::Message;
use sqlx::postgres::PgPool;

#[derive(Debug)]
pub struct MessagesService {
    pub pg_pool: PgPool,
}

impl MessagesService {
    pub fn test() {
        println!("test");
    }
}

#[tonic::async_trait]
impl Messages for MessagesService {
    async fn new_message(
        &self,
        request: Request<NewMessageParms>,
    ) -> Result<Response<BasicResponse>, Status> {
        let parms = request.into_inner();

        // Send the message
        match Message::new_message(
            &self.pg_pool,
            &parms.username,
            &parms.message_text,
            &parms.recipient_username,
        )
        .await
        {
            Ok(goodresponse) => Ok(Response::new(goodresponse)),
            Err(badresponse) => Err(Status::internal(badresponse.to_string())),
        }
    }
}
