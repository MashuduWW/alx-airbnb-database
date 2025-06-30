Insert Users

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES 
  ('uuid-user-1', 'Alice', 'Johnson', 'alice@example.com', 'hashedpass1', '1234567890', 'host', CURRENT_TIMESTAMP),
  ('uuid-user-2', 'Bob', 'Smith', 'bob@example.com', 'hashedpass2', '0987654321', 'guest', CURRENT_TIMESTAMP),
  ('uuid-user-3', 'Clara', 'Lee', 'clara@example.com', 'hashedpass3', '1122334455', 'guest', CURRENT_TIMESTAMP),
  ('uuid-user-4', 'David', 'Nguyen', 'david@example.com', 'hashedpass4', NULL, 'host', CURRENT_TIMESTAMP);

Insert Properties

INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES 
  ('uuid-prop-1', 'uuid-user-1', 'Seaside Villa', 'A cozy villa by the sea.', 'Cape Town', 1200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('uuid-prop-2', 'uuid-user-4', 'Urban Loft', 'Modern loft in the city center.', 'Johannesburg', 950.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

Insert Bookings

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, status, created_at)
VALUES 
  ('uuid-book-1', 'uuid-prop-1', 'uuid-user-2', '2025-07-01', '2025-07-05', 'confirmed', CURRENT_TIMESTAMP),
  ('uuid-book-2', 'uuid-prop-2', 'uuid-user-3', '2025-07-10', '2025-07-12', 'pending', CURRENT_TIMESTAMP);

Insert Payments

INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES 
  ('uuid-pay-1', 'uuid-book-1', 4800.00, CURRENT_TIMESTAMP, 'credit_card');
Only the confirmed booking has a payment.

Insert Reviews

INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES 
  ('uuid-rev-1', 'uuid-prop-1', 'uuid-user-2', 5, 'Fantastic view and location!', CURRENT_TIMESTAMP),
  ('uuid-rev-2', 'uuid-prop-2', 'uuid-user-3', 4, 'Great stay, but a bit noisy.', CURRENT_TIMESTAMP);

Insert Messages

INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES 
  ('uuid-msg-1', 'uuid-user-2', 'uuid-user-1', 'Hi Alice, is the villa available on the 1st?', CURRENT_TIMESTAMP),
  ('uuid-msg-2', 'uuid-user-1', 'uuid-user-2', 'Yes, it is available for those dates.', CURRENT_TIMESTAMP);

