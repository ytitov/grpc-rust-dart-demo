//tonic::include_proto!("manageusers");
use super::*;
use sqlx::postgres::PgPool;
pub mod manageusers;
use super::models;
pub use manageusers::manage_users_server::{ManageUsers, ManageUsersServer};
pub use manageusers::*;
use models::group::Group as GroupModel;
use models::user::User as UserModel;

#[derive(Debug)]
pub struct ManageUsersService {
    pub pg_pool: PgPool,
}

#[tonic::async_trait]
impl ManageUsers for ManageUsersService {
    // rename this to ListUsers
    //type ListUsersStream = mpsc::Receiver<Result<User, Status>>;
    type ListAllUsersStream = mpsc::Receiver<Result<User, Status>>;
    type ListAllGroupsStream = mpsc::Receiver<Result<Group, Status>>;

    async fn create_user(&self, _r: Request<CreateUserParams>) -> Result<Response<User>, Status> {
        let p: CreateUserParams = _r.into_inner();
        use models::user::User as UserModel;
        match UserModel::create(&self.pg_pool, &p.username).await {
            Ok(created_user) => Ok(Response::new(User {
                username: created_user.username,
                id: format!("{}", created_user.user_id),
            })),
            Err(e) => Err(Status::invalid_argument(format!(
                        "There was an error creating a user: {}",
                        e
            ))),
        }
    }

    async fn create_group(&self, r: Request<CreateGroupParams>) -> Result<Response<Group>, Status> {
        let p: CreateGroupParams = r.into_inner();
        match GroupModel::create(&self.pg_pool, &p.name).await {
            Ok(created_group) => Ok(Response::new(Group {
                name: created_group.name,
                id: format!("{}", created_group.group_id),
            })),
            Err(e) => Err(Status::invalid_argument(format!(
                        "There was an error creating a group: {}",
                        e
            ))),
        }
    }

    async fn delete_user(&self, r: Request<WhichUser>) -> Result<Response<GenericError>, Status> {
        let reqparms: WhichUser = r.into_inner();

        // try to delete a user
        let genericerror = match UserModel::delete_user(&self.pg_pool, &reqparms.username).await {
            Ok(msg) => msg,
            Err(e) => GenericError{ success: false, message: format!("Failed to delete user: {}", e).into() },
        };

        Ok(Response::new(genericerror))
    }

    async fn list_all_users(
        &self,
        _r: Request<EmptyParams>,
    ) -> Result<Response<Self::ListAllUsersStream>, Status> {
        let (mut tx, rx) = mpsc::channel(4);

        // fetch userlist from DB
        let userlist = match UserModel::list_all(&self.pg_pool).await {
            Ok(list) => list,
            Err(_) => vec![], // error returns empty list?
        };

        // send the userlist
        tokio::spawn(async move {
            for user in userlist {
                tx.send(Ok(User {
                    username: user.username,
                    id: user.user_id.to_string(),
                }))
                .await
                    .unwrap();
                }
        });

        Ok(Response::new(rx))
    }

    async fn list_all_groups(
        &self,
        _r: Request<EmptyParams>,
    ) -> Result<Response<Self::ListAllGroupsStream>, Status> {
        let (mut tx, rx) = mpsc::channel(4);
        let features = match GroupModel::fetch_all(&self.pg_pool).await {
            Ok(list) => list,
            // swallows error and returns empty list
            Err(_) => vec![],
        };

        tokio::spawn(async move {
            for feature in features {
                tx.send(Ok(Group {
                    id: format!("{}", feature.group_id),
                    name: feature.name,
                }))
                .await
                    .unwrap();
                }
        });
        Ok(Response::new(rx))
    }
}
