table! {
    Groups (groupId) {
        groupId -> Uuid,
        name -> Varchar,
        createdOn -> Timestamptz,
        deletedOn -> Nullable<Timestamptz>,
    }
}

table! {
    UserGroups (userId) {
        userId -> Uuid,
        groupId -> Uuid,
        createdOn -> Timestamptz,
        deletedOn -> Nullable<Timestamptz>,
    }
}

table! {
    Users (userId) {
        userId -> Uuid,
        username -> Varchar,
        isActive -> Bool,
        hash -> Nullable<Varchar>,
        salt -> Nullable<Varchar>,
        createdOn -> Timestamptz,
        updatedOn -> Timestamptz,
        deletedOn -> Nullable<Timestamptz>,
    }
}

joinable!(UserGroups -> Groups (groupId));

allow_tables_to_appear_in_same_query!(
    Groups,
    UserGroups,
    Users,
);
