-- 1. INNER JOIN: Retrieve all bookings and the users who made them
SELECT 
    Booking.booking_id, 
    Booking.start_date, 
    Booking.end_date, 
    "User".first_name, 
    "User".last_name, 
    "User".email
FROM Booking
INNER JOIN "User" ON Booking.guest_id = "User".user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews (including properties without reviews)
SELECT 
    Property.name AS property_name, 
    Review.rating, 
    Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id
ORDER BY Property.name;

-- 3. FULL OUTER JOIN: Retrieve all users and bookings
-- Note: PostgreSQL supports FULL OUTER JOIN. 
-- In MySQL, would use a UNION of LEFT and RIGHT joins.
SELECT 
    "User".user_id, 
    "User".first_name, 
    Booking.booking_id, 
    Booking.status
FROM "User"
FULL OUTER JOIN Booking ON "User".user_id = Booking.guest_id;