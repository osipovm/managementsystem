--liquibase formatted sql

--changeset osipov:004-order-items
CREATE TABLE order_items (
                             id           UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             order_id     UUID           NOT NULL,
                             product_id   UUID           NOT NULL,
                             quantity     INTEGER        NOT NULL,
                             price        NUMERIC(18,2)  NOT NULL, -- цена за единицу на момент покупки
                             total_price  NUMERIC(18,2)  GENERATED ALWAYS AS (quantity * price) STORED,
                             CONSTRAINT fk_items_order
                                 FOREIGN KEY (order_id)  REFERENCES orders(id),
                             CONSTRAINT fk_items_product
                                 FOREIGN KEY (product_id) REFERENCES products(id),
                             CONSTRAINT chk_items_qty
                                 CHECK (quantity > 0)
);

--changeset osipov:004-order-items-indexes
CREATE INDEX idx_items_order   ON order_items(order_id);
CREATE INDEX idx_items_product ON order_items(product_id);

--rollback DROP INDEX idx_items_product; DROP INDEX idx_items_order; DROP TABLE order_items;
