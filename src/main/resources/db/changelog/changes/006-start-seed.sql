--liquibase formatted sql

--changeset osipov:006-seed-users
INSERT INTO users (id, name, email, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655440001', 'Иван Иванов', 'ivan@example.com', CURRENT_TIMESTAMP);
INSERT INTO users (id, name, email, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655440002', 'Анна Петрова', 'anna@example.com', CURRENT_TIMESTAMP);

--changeset osipov:006-seed-products
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655440010', 'Starter Pack', 19.99, 100, 'ACTIVE', CURRENT_TIMESTAMP);
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655440020', 'Pro Pack', 49.90, 50, 'ACTIVE', CURRENT_TIMESTAMP);
INSERT INTO products (id, name, price, stock, status, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655440030', 'Enterprise Kit', 199.00, 10, 'ACTIVE', CURRENT_TIMESTAMP);

--changeset osipov:006-seed-orders
-- Заказ пользователя Иван Иванов (оплачен)
INSERT INTO orders (id, user_id, status, created_at, updated_at)
VALUES ('550e8400-e29b-41d4-a716-446655441000', '550e8400-e29b-41d4-a716-446655440001', 'PAID', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Заказ пользователя Анна Петрова (новый, без оплаты)
INSERT INTO orders (id, user_id, status, created_at)
VALUES ('550e8400-e29b-41d4-a716-446655441001', '550e8400-e29b-41d4-a716-446655440002', 'NEW', CURRENT_TIMESTAMP);

--changeset osipov:006-seed-order-items
-- Состав заказа 100
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES ('550e8400-e29b-41d4-a716-446655442001', '550e8400-e29b-41d4-a716-446655441000', '550e8400-e29b-41d4-a716-446655440010', 2, 19.99);
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES ('550e8400-e29b-41d4-a716-446655442002', '550e8400-e29b-41d4-a716-446655441000', '550e8400-e29b-41d4-a716-446655440020', 1, 49.90);

-- Состав заказа 101
INSERT INTO order_items (id, order_id, product_id, quantity, price)
VALUES ('550e8400-e29b-41d4-a716-446655442003', '550e8400-e29b-41d4-a716-446655441001', '550e8400-e29b-41d4-a716-446655440030', 1, 199.00);

--changeset osipov:006-seed-payments
-- Платёж по заказу 100 (итого: 2*19.99 + 49.90 = 89.88)
INSERT INTO payments (id, order_id, amount, status, payment_date, provider, external_id)
VALUES ('550e8400-e29b-41d4-a716-446655445001', '550e8400-e29b-41d4-a716-446655441000', 89.88, 'COMPLETED', CURRENT_TIMESTAMP, 'MockPay', 'MPAY-0001');
