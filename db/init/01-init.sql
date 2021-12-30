CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE application_meta(
  id UUID NOT NULL PRIMARY KEY DEFAULT gen_random_uuid(),
  key VARCHAR(256),
  value VARCHAR(256),
  UNIQUE (key)
);

