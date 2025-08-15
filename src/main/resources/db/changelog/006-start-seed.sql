--liquibase formatted sql

--changeset osipov:006-seed-users
INSERT INTO users (id, name, email, created_at)
VALUES (1, 'Иван Иванов', 'ivan@example.com', SYSTIMESTAMP);
INSERT INTO users (id, name, email, created_at)
VALUES (2, 'Анна Петрова', 'anna@example.com', SYSTIMESTAMP);

--changeset osipov:006-seed-products
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES (10, 'Starter Pack', 19.99, 100, 'ACTIVE', SYSTIMESTAMP);
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES (20, 'Pro Pack', 49.90, 50, 'ACTIVE', SYSTIMESTAMP);
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES (30, 'Enterprise Kit', 199.00, 10, 'ACTIVE', SYSTIMESTAMP);

--changeset osipov:006-seed-orders
-- Заказ пользователя 1 (оплачен)
INSERT INTO orders (id, user_id, status, created_at, updated_at)
VALUES (100, 1, 'PAID', SYSTIMESTAMP, SYSTIMESTAMP);

-- Заказ пользователя 2 (новый, без оплаты)
INSERT INTO orders (id, user_id, status, created_at)
VALUES (101, 2, 'NEW', SYSTIMESTAMP);

--changeset osipov:006-seed-order-items
-- Состав заказа 100
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES (10001, 100, 10, 2, 19.99);  -- 2 x Starter Pack
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES (10002, 100, 20, 1, 49.90);  -- 1 x Pro Pack

-- Состав заказа 101
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES (10003, 101, 30, 1, 199.00); -- 1 x Enterprise Kit

--changeset osipov:006-seed-payments
-- Платёж по заказу 100 (итого: 2*19.99 + 49.90 = 89.88)
INSERT INTO payments (id, order_id, amount, status, payment_date, provider, external_id)
VALUES (5001, 100, 89.88, 'COMPLETED', SYSTIMESTAMP, 'MockPay', 'MPAY-0001');
