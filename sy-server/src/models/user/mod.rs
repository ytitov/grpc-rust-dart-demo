use crate::preamble::*;

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
}
