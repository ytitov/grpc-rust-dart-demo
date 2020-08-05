CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

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
  PRIMARY KEY(user_id)
);

CREATE TABLE user_groups (
  user_id uuid NOT NULL,
  group_id uuid NOT NULL,
  created_on timestamp with time zone NOT NULL DEFAULT now(),
  deleted_on timestamp with time zone,
  UNIQUE (user_id, group_id),
  FOREIGN KEY (group_id) REFERENCES groups(group_id),
  PRIMARY KEY(user_id)
);
