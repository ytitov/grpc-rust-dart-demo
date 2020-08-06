use crate::preamble::*;
#[derive(sqlx::FromRow)]
pub struct Group {
    pub group_id: Uuid,
    pub name: String,
}

impl Group {
    pub async fn fetch_all(p: &PgPool) -> Result<Vec<Self>, sqlx::Error> {
        let r: Vec<Group> = query_as("SELECT * from groups")
            .fetch_all(p)
            .await?;
        Ok(r)
    }

    pub async fn create(p: &PgPool, name: &str) -> Result<Self, sqlx::Error> {
        let r = sqlx::query!("INSERT INTO groups (name) VALUES ($1) RETURNING group_id, name", name)
            .fetch_one(p)
            .await?;
        Ok(Group { group_id: r.group_id, name: r.name } )
    }
}
