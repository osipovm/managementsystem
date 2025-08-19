--liquibase formatted sql

--changeset osipov:002-products
CREATE TABLE products (
                          id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          name        VARCHAR(255)   NOT NULL,
                          price       NUMERIC(18,2)  NOT NULL,
                          stock       INTEGER        DEFAULT 0 NOT NULL,
                          status      VARCHAR(20)    DEFAULT 'ACTIVE' NOT NULL,
                          created_at  TIMESTAMP      DEFAULT CURRENT_TIMESTAMP NOT NULL,
                          updated_at  TIMESTAMP,
                          CONSTRAINT chk_products_status CHECK (status IN ('ACTIVE','INACTIVE'))
);

--changeset osipov:002-products-indexes
CREATE INDEX idx_products_status ON products(status);

--rollback DROP INDEX idx_products_status; DROP TABLE products;
