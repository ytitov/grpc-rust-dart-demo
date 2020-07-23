//tonic::include_proto!("manageusers");
use super::*;
use sqlx::postgres::PgPool;
mod manageusers;
use manageusers::manage_users_server::ManageUsers;
use manageusers::*;

#[derive(Debug)]
pub struct ManageUsersService {
    pub pg_pool: PgPool,
}

#[tonic::async_trait]
impl ManageUsers for ManageUsersService {
    // rename this to ListUsers
    type ListUsersStream = mpsc::Receiver<Result<User, Status>>;

    async fn create_user(&self, _r: Request<CreateUserParams>) -> Result<Response<User>, Status> {
        Ok(Response::new(User {
            email: String::from("whatever@aol.blah"),
            id: String::from("whatever string bro"),
        }))
    }

    async fn list_users(
        &self,
        _r: Request<EmptyParams>,
    ) -> Result<Response<Self::ListUsersStream>, Status> {
        unimplemented!()
    }
}
