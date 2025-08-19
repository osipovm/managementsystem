--liquibase formatted sql

--changeset osipov:001-users
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
                       id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       name       VARCHAR(255)   NOT NULL,
                       email      VARCHAR(320)   NOT NULL,
                       created_at TIMESTAMP      DEFAULT CURRENT_TIMESTAMP NOT NULL,
                       CONSTRAINT uk_users_email UNIQUE (email)
);

--rollback DROP TABLE users;