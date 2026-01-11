-- Step 1: Measure performance BEFORE indexing
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE guest_id = 'some-uuid-here' AND start_date > '2025-01-01';

EXPLAIN ANALYZE 
SELECT * FROM Property 
WHERE price_per_night > 100 AND location = 'New York';

-- Step 2: Create Indexes for high-usage columns
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_booking_guest_id ON Booking(guest_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_property_price_per_night ON Property(price_per_night);

-- Step 3: Measure performance AFTER indexing
-- The scan type should change from 'Seq Scan' to 'Index Scan'
EXPLAIN ANALYZE 
SELECT * FROM Booking 
WHERE guest_id = 'some-uuid-here' AND start_date > '2025-01-01';

EXPLAIN ANALYZE 
SELECT * FROM Property 
WHERE price_per_night > 100 AND location = 'New York';