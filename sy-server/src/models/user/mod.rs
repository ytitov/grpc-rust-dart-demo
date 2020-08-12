use crate::preamble::*;
use crate::manageusers::GenericError;

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

    pub async fn delete_user(p: &PgPool, username: &str) -> Result<GenericError, sqlx::Error> {
        // find user in db, set delted timestamp
        // TODO: This first query is not necessary
        let _r: User = sqlx::query_as("SELECT user_id, username FROM users WHERE username LIKE $1")
            .bind(username)
            .fetch_one(p).await?;

        // set delted_on timestamp to delete the user
        sqlx::query("UPDATE users SET deleted_on = NOW() WHERE username LIKE $1")
            .bind(username)
            .execute(p).await?;

        Ok(GenericError{ success: true, message: format!("User {} deleted", username).into() })
    }

    pub async fn rename(p: &PgPool, oldusername: &str, newusername: &str) -> Result<GenericError, sqlx::Error> {
        // TODO: duplicate user name checking
        //sqlx::query("UPDATE users SET username
        unimplemented!()
    }
}
