# High-Usage Columns
 USERS table:

 - user_id --> JOINs, WHERE

 - email --> WHERE (login)



 **BOOKINGS table:**

 - booking_id --> SELECT, JOIN

 - guest_id --> JOIN with users, WHERE

 - property_id --> JOIN with properties, WHERE


**PROPERTIES table:**

 - property_id --> JOIN, WHERE

 - location --> WHERE, ORDER BY

 - price_per_night --> ORDER BY, filtering



### CREATE INDEX STATEMENTS


**USERS Table**

CREATE INDEX idx_users_user_id ON users(user_id);

CREATE INDEX idx_users_email ON users(email);

 **BOOKINGS Table**

CREATE INDEX idx_bookings_booking_id ON bookings(booking_id);

CREATE INDEX idx_bookings_guest_id ON bookings(guest_id);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);

 **PROPERTIES Table**

CREATE INDEX idx_properties_property_id ON properties(property_id);

CREATE INDEX idx_properties_location ON properties(location);

CREATE INDEX idx_properties_price ON properties(price_per_night);


 PERFORMANCE ANALYSIS (BEFORE/AFTER INDEXING)


 Example: Analyze property search query

**EXPLAIN ANALYZE**

SELECT * FROM properties

WHERE location = 'Cape Town'

ORDER BY price_per_night ASC

LIMIT 10;

 Example: Analyze user bookings query

**EXPLAIN ANALYZE**

SELECT b.*

FROM bookings b

JOIN users u ON b.guest_id = u.user_id

WHERE u.email = '<jane@example.com>';

 Example: Analyze most booked properties

EXPLAIN ANALYZE

SELECT p.property_id, COUNT(b.booking_id) AS total_bookings

FROM properties p

LEFT JOIN bookings b ON p.property_id = b.property_id

GROUP BY p.property_id

ORDER BY total_bookings DESC

LIMIT 5;


 ## To measure performance:

Run each EXPLAIN ANALYZE before and after the CREATE INDEX statements.

Compare the execution time and query plan (e.g., Seq Scan vs Index Scan).

