-- Initial query to retrieve all bookings with user, property, and payment details
-- This query is designed to be analyzed for performance bottlenecks
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM Booking b
JOIN "User" u ON b.guest_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.status = 'confirmed' 
  AND b.start_date >= '2024-01-01';