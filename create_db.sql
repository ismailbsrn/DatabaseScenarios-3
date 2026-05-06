CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    transaction_date TIMESTAMP,
    amount NUMERIC(10, 2),
    status VARCHAR(20)
);

INSERT INTO transactions (customer_id, transaction_date, amount, status)
SELECT 
    floor(random() * 100000 + 1)::int,
    timestamp '2023-01-01 00:00:00' + random() * (timestamp '2026-01-01 00:00:00' - timestamp '2023-01-01 00:00:00'),
    (random() * 10000)::numeric(10, 2),
    (ARRAY['success', 'failed', 'pending', 'refunded'])[floor(random() * 4 + 1)]
FROM generate_series(1, 10000000);
