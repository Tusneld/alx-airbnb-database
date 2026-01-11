-- 1. Non-correlated Subquery: Properties with average rating > 4.0
SELECT name, location
FROM Property
WHERE property_id IN (
    SELECT property_id 
    FROM Review 
    GROUP BY property_id 
    HAVING AVG(rating) > 4.0
);

-- 2. Correlated Subquery: Users who have made more than 3 bookings
SELECT first_name, last_name, email
FROM "User" u
WHERE (
    SELECT COUNT(*) 
    FROM Booking b 
    WHERE b.guest_id = u.user_id
) > 3;