CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE messages (
  message_id uuid NOT NULL DEFAULT uuid_generate_v4(),
  sender_id uuid,
  recipient_id uuid,
  message_text VARCHAR,
  sent_on TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  read_on TIMESTAMP WITH TIME ZONE,
  PRIMARY KEY(message_id),
  FOREIGN KEY(sender_id) REFERENCES users(user_id),
  FOREIGN KEY(recipient_id) REFERENCES users(user_id)
)

CREATE TABLE tasks (
  task_id uuid NOT NULL DEFAULT uuid_generate_v4(),
  owner_id uuid NOT NULL,
  title CHARACTER VARYING(255),
  description VARCHAR,
  weight SMALLINT,
  created_on TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  due_on TIMESTAMP WITH TIME ZONE,
  FOREIGN KEY(owner_id) REFERENCES users(user_id),
  PRIMARY KEY(task_id)
);

CREATE TABLE completed_tasks (
  task_id uuid NOT NULL,
  completed_on TIMESTAMP WITH TIME ZONE,
  completed_by uuid,
  FOREIGN KEY(task_id) REFERENCES tasks(task_id),
  FOREIGN KEY(completed_by) REFERENCES users(user_id)
)

/*
 * to get assigned group, check task owner's group *AWKWARD
 * to get assigned user, search this table
 * if no assigned user, then it's a group task
 */
CREATE TABLE task_assignments (
  task_id uuid NOT NULL,
  assigned_to_user uuid,
  FOREIGN KEY (task_id) REFERENCES tasks(task_id),
  FOREIGN KEY (assigned_to_user) REFERENCES users(user_id),
)

CREATE TABLE groups (
  group_id uuid NOT NULL DEFAULT uuid_generate_v4(),
  name character varying(255) NOT NULL,
  created_on timestamp with time zone NOT NULL DEFAULT now(),
  deleted_on timestamp with time zone,
  UNIQUE (name),
  PRIMARY KEY(group_id)
);

CREATE TABLE users (
  user_id uuid NOT NULL DEFAULT uuid_generate_v4(),
  username character varying(255) NOT NULL,
  hash character varying(255),
  salt character varying(255),
  created_on timestamp with time zone NOT NULL DEFAULT now(),
  updated_on timestamp with time zone NOT NULL DEFAULT now(),
  deleted_on timestamp with time zone,
  UNIQUE (username),
  PRIMARY KEY(user_id)
);

CREATE TABLE user_groups (
  user_id uuid NOT NULL,
  group_id uuid NOT NULL,
  created_on timestamp with time zone NOT NULL DEFAULT now(),
  deleted_on timestamp with time zone,
  UNIQUE (user_id, group_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (group_id) REFERENCES groups(group_id)
);
