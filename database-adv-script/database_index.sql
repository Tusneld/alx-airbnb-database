-- Identify high-usage columns:
-- User Table: user_id (primary key), email (login/search)
-- Booking Table: guest_id, property_id (foreign keys), start_date (filtering)
-- Property Table: property_id (primary key), price_per_night (filtering/sorting)

-- Create indexes to improve JOIN and WHERE clause performance
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_booking_guest_id ON Booking(guest_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_property_price_per_night ON Property(price_per_night);