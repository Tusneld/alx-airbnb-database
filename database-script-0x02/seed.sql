-- DATA SCAPE: SAMPLE DATA SEEDING (DML)

-- 1. Insert Users (Hosts and Guests)
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
('550e8400-e29b-41d4-a716-446655440000', 'Tusnelde', 'Endjala', 'tusnelde.host@example.com', 'secure_hash_1', '+1234567890', 'host'),
('550e8400-e29b-41d4-a716-446655440001', 'Laina', 'Ryan', 'laina.guest@example.com', 'secure_hash_2', '+0987654321', 'guest'),
('550e8400-e29b-41d4-a716-446655440002', 'Alina', 'Sheya', 'alina.admin@example.com', 'secure_hash_3', '+1122334455', 'admin');

-- 2. Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES 
('6ba7b810-9dad-11d1-80b4-00c04fd430c1', '550e8400-e29b-41d4-a716-446655440000', 'Luxury Penthouse', 'A stunning penthouse with city views.', 'New York, NY', 450.00),
('6ba7b810-9dad-11d1-80b4-00c04fd430c2', '550e8400-e29b-41d4-a716-446655440000', 'Cozy Beach Hut', 'Steps away from the ocean.', 'Malibu, CA', 150.00);

-- 3. Insert Bookings
INSERT INTO Booking (booking_id, property_id, guest_id, start_date, end_date, total_price, status)
VALUES 
('7da7b810-9dad-11d1-80b4-00c04fd430d1', '6ba7b810-9dad-11d1-80b4-00c04fd430c1', '550e8400-e29b-41d4-a716-446655440001', '2026-05-01', '2026-05-05', 1800.00, 'confirmed'),
('7da7b810-9dad-11d1-80b4-00c04fd430d2', '6ba7b810-9dad-11d1-80b4-00c04fd430c2', '550e8400-e29b-41d4-a716-446655440001', '2026-06-10', '2026-06-12', 300.00, 'pending');

-- 4. Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method, status)
VALUES 
('8ea7b810-9dad-11d1-80b4-00c04fd430e1', '7da7b810-9dad-11d1-80b4-00c04fd430d1', 1800.00, 'credit_card', 'completed');

-- 5. Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
('9fa7b810-9dad-11d1-80b4-00c04fd430f1', '6ba7b810-9dad-11d1-80b4-00c04fd430c1', '550e8400-e29b-41d4-a716-446655440001', 5, 'Absolutely breath-taking view! Highly recommended.');