
-- =========================
-- STEP 1: Create Partitioned Table
-- =========================

-- Drop old table if it exists (for demo purposes only)
DROP TABLE IF EXISTS bookings CASCADE;

-- Create the parent table (partitioned by RANGE on check_in)
CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY,
    guest_id UUID NOT NULL,
    property_id UUID NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (check_in);

-- =========================
-- STEP 2: Create Partitions (e.g., yearly partitions)
-- =========================

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- =========================
-- STEP 3: Create Indexes on Partitions
-- =========================

CREATE INDEX idx_bookings_2023_guest_id ON bookings_2023 (guest_id);
CREATE INDEX idx_bookings_2024_guest_id ON bookings_2024 (guest_id);
CREATE INDEX idx_bookings_2025_guest_id ON bookings_2025 (guest_id);

-- =========================
-- STEP 4: Test Query Performance
-- =========================

-- Query that benefits from partition pruning
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE check_in BETWEEN '2025-05-01' AND '2025-05-31';



