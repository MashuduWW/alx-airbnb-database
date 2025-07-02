
-- =========================
-- INITIAL QUERY: Retrieve all bookings with user, property, and payment details
-- =========================

SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.guest_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- =========================
-- EXPLAIN ANALYZE: Analyze query performance before optimization
-- =========================

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.title,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.guest_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;

-- =========================
-- RECOMMENDED INDEXES (if not already created)
-- =========================

-- These indexes support JOIN operations and filtering
CREATE INDEX IF NOT EXISTS idx_bookings_guest_id ON bookings(guest_id);
CREATE INDEX IF NOT EXISTS idx_bookings_property_id ON bookings(property_id);
CREATE INDEX IF NOT EXISTS idx_payments_booking_id ON payments(booking_id);
CREATE INDEX IF NOT EXISTS idx_users_user_id ON users(user_id);
CREATE INDEX IF NOT EXISTS idx_properties_property_id ON properties(property_id);

-- =========================
-- REFACTORED QUERY: Optimize by selecting only necessary fields and using indexed columns
-- =========================

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.check_in,
    b.check_out,
    u.first_name || ' ' || u.last_name AS guest_name,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.guest_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
