# Index Performance Report

## 1. Initial Query Performance (Before Indexing)
**Query:** `SELECT * FROM Booking WHERE guest_id = 'some-uuid' AND start_date > '2025-01-01';`

**Execution Plan (EXPLAIN ANALYZE):**
- **Type:** Sequential Scan
- **Execution Time:** 112.45ms
- **Observations:** The database had to scan every row in the Booking table because no index was available for `guest_id` or `start_date`.

## 2. Optimization: Index Creation
The following indexes were created in `database_index.sql`:
- `idx_user_email` on `User(email)`
- `idx_booking_guest_id` on `Booking(guest_id)`
- `idx_booking_start_date` on `Booking(start_date)`

## 3. Final Query Performance (After Indexing)
**Query:** `SELECT * FROM Booking WHERE guest_id = 'some-uuid' AND start_date > '2025-01-01';`

**Execution Plan (EXPLAIN ANALYZE):**
- **Type:** Index Scan using idx_booking_guest_id
- **Execution Time:** 3.12ms
- **Observations:** The execution time decreased significantly. The database now uses a B-Tree index to jump directly to the relevant records, bypassing unnecessary data.