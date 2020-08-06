//tonic::include_proto!("manageusers");
use super::*;
use sqlx::postgres::PgPool;
pub mod manageusers;
use super::user;
pub use manageusers::manage_users_server::{ManageUsers, ManageUsersServer};
pub use manageusers::*;

#[derive(Debug)]
pub struct ManageUsersService {
    pub pg_pool: PgPool,
}

#[tonic::async_trait]
impl ManageUsers for ManageUsersService {
    // rename this to ListUsers
    type ListUsersStream = mpsc::Receiver<Result<User, Status>>;

    async fn create_user(&self, _r: Request<CreateUserParams>) -> Result<Response<User>, Status> {
        let p: CreateUserParams = _r.into_inner();
        use user::User as UserModel;
        match UserModel::create(&self.pg_pool, &p.email).await {
            Ok(created_user) => Ok(Response::new(User {
                email: created_user.username,
                id: format!("{}", created_user.user_id),
            })),
            Err(e) => {
                panic!("error {}", e);
            }
        }
    }

    async fn list_users(
        &self,
        _r: Request<EmptyParams>,
    ) -> Result<Response<Self::ListUsersStream>, Status> {
        unimplemented!()
    }
}
