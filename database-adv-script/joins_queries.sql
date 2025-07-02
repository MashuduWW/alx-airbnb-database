
-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users ON bookings.guest_id = users.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.property_id,
    properties.title,
    properties.location,
    reviews.review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;

-- FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    bookings.booking_id,
    bookings.property_id,
    bookings.check_in,
    bookings.check_out
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.guest_id;
