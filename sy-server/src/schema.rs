table! {
    groups (group_id) {
        group_id -> Uuid,
        name -> Varchar,
        created_on -> Timestamptz,
        deleted_on -> Nullable<Timestamptz>,
    }
}

table! {
    user_groups (user_id) {
        user_id -> Uuid,
        group_id -> Uuid,
        created_on -> Timestamptz,
        deleted_on -> Nullable<Timestamptz>,
    }
}

table! {
    users (user_id) {
        user_id -> Uuid,
        username -> Varchar,
        hash -> Nullable<Varchar>,
        salt -> Nullable<Varchar>,
        created_on -> Timestamptz,
        updated_on -> Timestamptz,
        deleted_on -> Nullable<Timestamptz>,
    }
}

joinable!(user_groups -> groups (group_id));

allow_tables_to_appear_in_same_query!(
    groups,
    user_groups,
    users,
);
