-- 1. Total number of bookings made by each user
SELECT 
    guest_id, 
    COUNT(*) AS total_bookings
FROM Booking
GROUP BY guest_id;

-- 2. Ranking properties based on total bookings received using RANK()
SELECT 
    property_id, 
    COUNT(*) AS booking_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) as property_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) as property_row_num
FROM Booking
GROUP BY property_id;