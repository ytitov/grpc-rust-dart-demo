/**
 * if recipient_id is null, then it's a group post
 */
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
);

CREATE TABLE tasks (
  task_id uuid NOT NULL DEFAULT uuid_generate_v4(),
  owner_id uuid NOT NULL,
  group_id uuid, -- allowing NULL so single users don't need a group
  assigned_user_id uuid, -- can be null if it's a group task
  title CHARACTER VARYING(255),
  description VARCHAR,
  weight SMALLINT,
  created_on TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  due_on TIMESTAMP WITH TIME ZONE,
  FOREIGN KEY(owner_id) REFERENCES users(user_id),
  FOREIGN KEY(assigned_user_id) REFERENCES users(user_id),
  FOREIGN KEY(group_id) REFERENCES groups(group_id),
  PRIMARY KEY(task_id)
);

CREATE TABLE completed_tasks (
  task_id uuid NOT NULL,
  completed_on TIMESTAMP WITH TIME ZONE,
  completed_by uuid,
  FOREIGN KEY(task_id) REFERENCES tasks(task_id),
  FOREIGN KEY(completed_by) REFERENCES users(user_id)
);
