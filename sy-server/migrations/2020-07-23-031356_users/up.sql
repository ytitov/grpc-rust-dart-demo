CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE "Groups" (
  "groupId" uuid NOT NULL DEFAULT uuid_generate_v4(),
  name character varying(255) NOT NULL,
  "createdOn" timestamp with time zone NOT NULL DEFAULT now(),
  "deletedOn" timestamp with time zone,
  UNIQUE (name),
  PRIMARY KEY("groupId")
);

CREATE TABLE "Users" (
  "userId" uuid NOT NULL DEFAULT uuid_generate_v4(),
  username character varying(255) NOT NULL,
  "isActive" boolean DEFAULT true NOT NULL,
  hash character varying(255),
  salt character varying(255),
  "createdOn" timestamp with time zone NOT NULL DEFAULT now(),
  "updatedOn" timestamp with time zone NOT NULL,
  "deletedOn" timestamp with time zone,
  PRIMARY KEY("userId")
);

CREATE TABLE "UserGroups" (
  "userId" uuid NOT NULL,
  "groupId" uuid NOT NULL,
  "createdOn" timestamp with time zone NOT NULL DEFAULT now(),
  "deletedOn" timestamp with time zone,
  UNIQUE ("userId", "groupId"),
  FOREIGN KEY ("groupId") REFERENCES "Groups"("groupId"),
  PRIMARY KEY("userId")
);
