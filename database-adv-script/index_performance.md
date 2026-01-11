# Index Performance Report

## 1. High-Usage Columns Identified
The following columns were identified as high-usage based on their frequent appearance in `JOIN`, `WHERE`, and `ORDER BY` clauses:
- **User Table:** `user_id` (Primary Key used in Joins), `email` (Login queries).
- **Booking Table:** `booking_id`, `property_id`, `guest_id`, `start_date`.
- **Property Table:** `property_id`, `location`, `price_per_night`.

## 2. SQL Commands for Indexing
```sql
CREATE INDEX idx_user_email ON "User"(email);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(price_per_night);