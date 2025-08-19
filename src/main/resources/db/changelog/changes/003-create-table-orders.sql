--liquibase formatted sql

--changeset osipov:003-orders
CREATE TABLE orders (
                        id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                        user_id     UUID         NOT NULL,
                        status      VARCHAR(20)  DEFAULT 'NEW' NOT NULL,
                        created_at  TIMESTAMP    DEFAULT CURRENT_TIMESTAMP NOT NULL,
                        updated_at  TIMESTAMP,
                        CONSTRAINT fk_orders_user
                            FOREIGN KEY (user_id) REFERENCES users(id),
                        CONSTRAINT chk_orders_status
                            CHECK (status IN ('NEW','PAID','CANCELLED','COMPLETED'))
);

--changeset osipov:003-orders-indexes
CREATE INDEX idx_orders_user        ON orders(user_id);
CREATE INDEX idx_orders_status      ON orders(status);
CREATE INDEX idx_orders_created_at  ON orders(created_at);

--rollback DROP INDEX idx_orders_created_at; DROP INDEX idx_orders_status; DROP INDEX idx_orders_user; DROP TABLE orders;
