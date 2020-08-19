use crate::preamble::*;
use crate::manageusers::GenericResult;

#[derive(sqlx::FromRow)]
pub struct User {
    pub user_id: Uuid,
    pub username: String,
}

impl User {
    pub async fn with_username(p: &PgPool, username: &str) -> Result<Self, sqlx::Error> {
        let r: User = query_as("SELECT user_id, username from users where username like $1")
            .bind(username)
            .fetch_one(p)
            .await?;
        Ok(r)
    }

    pub async fn create(p: &PgPool, username: &str) -> Result<Self, sqlx::Error> {
        let r = sqlx::query!("INSERT INTO users (username) VALUES ($1) RETURNING user_id, username", username)
            .fetch_one(p)
            .await?;
        Ok(User { user_id: r.user_id, username: r.username } )
    }

    pub async fn list_all(p: &PgPool) -> Result<Vec<Self>, sqlx::Error> {
        let r = sqlx::query_as!(User, "SELECT user_id, username FROM users WHERE deleted_on IS NULL").fetch_all(p).await?;

        Ok(r)
    }

    pub async fn delete_user(p: &PgPool, username: &str) -> Result<GenericResult, sqlx::Error> {
        // find user in db, set delted timestamp
        // TODO: This first query is not necessary
        let _r: User = sqlx::query_as("SELECT user_id, username FROM users WHERE username LIKE $1")
            .bind(username)
            .fetch_one(p).await?;

        // set delted_on timestamp to delete the user
        sqlx::query("UPDATE users SET deleted_on = NOW() WHERE username LIKE $1")
            .bind(username)
            .execute(p).await?;

        Ok(GenericResult{ success: true, message: format!("User {} deleted", username).into() })
    }

    pub async fn set_group(p: &PgPool, username: &str, group: &str) -> Result<GenericResult, sqlx::Error> {
        let userid = sqlx::query!("SELECT user_id FROM users WHERE username LIKE $1", username)
            .fetch_one(p).await?;

        let groupid = sqlx::query!("SELECT group_id FROM groups WHERE name LIKE $1", group)
            .fetch_one(p).await?;

        let usergrouprow = sqlx::query!("SELECT user_id FROM user_groups WHERE user_id=$1", userid.user_id)
            .fetch_one(p).await;

        match usergrouprow {
            Ok(_) => {
                // Row exists, do an UPDATE
                sqlx::query!("UPDATE user_groups SET group_id=$1 WHERE user_id=$2",
                    groupid.group_id, userid.user_id)
                    .execute(p).await?;
            },
            Err(err) => {
                // Row does not exist if err == RowNotFound
                if let sqlx::Error::RowNotFound = err {
                    // Row not found, do the INSERT
                    sqlx::query!("INSERT INTO user_groups VALUES ($1, $2)", userid.user_id, groupid.group_id)
                        .execute(p).await?;
                } else {
                    // Other database error, kick it upwards
                    return Err(err);
                }
            }
        }

        Ok(GenericResult{ success: true, message: format!("User {} assigned to group {}",
                username, group).into() })
    }

    pub async fn rename(p: &PgPool, oldusername: &str, newusername: &str) -> Result<GenericResult, sqlx::Error> {
        sqlx::query!("UPDATE users SET username=$1 WHERE username LIKE $2", newusername, oldusername)
            .execute(p).await?;

        Ok(GenericResult{ success: true, message: format!("Renamed user {} to {}", oldusername, newusername).into() })
    }
}
