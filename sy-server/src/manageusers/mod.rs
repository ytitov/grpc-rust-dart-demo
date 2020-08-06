//tonic::include_proto!("manageusers");
use super::*;
use sqlx::postgres::PgPool;
pub mod manageusers;
use super::models;
pub use manageusers::manage_users_server::{ManageUsers, ManageUsersServer};
pub use manageusers::*;
use models::group::Group as GroupModel;

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
            Err(e) => {
                Err(Status::invalid_argument(format!("There was an error creating a user: {}", e)))
            }
        }
    }

    async fn create_group(&self, r: Request<CreateGroupParams>) -> Result<Response<Group>, Status> {
        let p: CreateGroupParams = r.into_inner();
        match GroupModel::create(&self.pg_pool, &p.name).await {
            Ok(created_group) => Ok(Response::new(Group {
                name: created_group.name,
                id: format!("{}", created_group.group_id),
            })),
            Err(e) => {
                Err(Status::invalid_argument(format!("There was an error creating a group: {}", e)))
            }
        }
    }

    async fn list_all_users(
        &self,
        _r: Request<EmptyParams>,
    ) -> Result<Response<Self::ListAllUsersStream>, Status> {
        unimplemented!()
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
