
-- Airbnb Sample Data Seed Script (PostgreSQL)

-- ========================================
-- USERS
-- ========================================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
  ('00000000-0000-0000-0000-000000000001', 'Alice', 'Walker', 'alice@example.com', 'hashed_pw1', '1234567890', 'host'),
  ('00000000-0000-0000-0000-000000000002', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '2345678901', 'guest'),
  ('00000000-0000-0000-0000-000000000003', 'Carol', 'Jones', 'carol@example.com', 'hashed_pw3', '3456789012', 'admin');

-- ========================================
-- PROPERTIES
-- ========================================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES 
  ('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 'Sunny Villa', 'A beautiful villa with sea view.', 'Zanzibar', 120.00),
  ('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Mountain Cabin', 'Cozy cabin in the mountains.', 'Arusha', 80.00);

-- ========================================
-- BOOKINGS
-- ========================================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
  ('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '2025-07-10', '2025-07-15', 600.00, 'confirmed'),
  ('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '2025-08-01', '2025-08-03', 160.00, 'pending');

-- ========================================
-- PAYMENTS
-- ========================================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES 
  ('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 600.00, 'credit_card');

-- ========================================
-- REVIEWS
-- ========================================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES 
  ('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 5, 'Amazing experience! Highly recommend.');

-- ========================================
-- MESSAGES
-- ========================================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES 
  ('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Hi, is the villa available in July?'),
  ('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Yes, it is available from July 10th.');
