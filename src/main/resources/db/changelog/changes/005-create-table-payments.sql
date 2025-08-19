--liquibase formatted sql

--changeset osipov:005-payments
CREATE TABLE payments (
                          id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          order_id     UUID           NOT NULL,
                          amount       NUMERIC(18,2)  NOT NULL,
                          status       VARCHAR(20)    DEFAULT 'PENDING' NOT NULL,
                          payment_date TIMESTAMP,
                          provider     VARCHAR(64),
                          external_id  VARCHAR(128),
                          CONSTRAINT fk_pay_order
                              FOREIGN KEY (order_id) REFERENCES orders(id),
                          CONSTRAINT uk_pay_external_id UNIQUE (external_id),
                          CONSTRAINT chk_pay_status
                              CHECK (status IN ('PENDING','COMPLETED','FAILED'))
);

--changeset osipov:005-payments-indexes
CREATE INDEX idx_pay_order  ON payments(order_id);
CREATE INDEX idx_pay_status ON payments(status);

--rollback DROP INDEX idx_pay_status; DROP INDEX idx_pay_order; DROP TABLE payments;
