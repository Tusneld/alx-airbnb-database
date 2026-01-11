# Performance Monitoring and Schema Refinement

## 1. Monitoring Tools Used
- `EXPLAIN ANALYZE` (to view execution paths).
- `SHOW PROFILE` (to identify CPU vs I/O bottlenecks).

## 2. Identified Bottleneck
Queries filtering by `Review` ratings were slow because the `Review` table had grown significantly without a specialized index on the `rating` column.

## 3. Suggested & Implemented Changes
- **New Index:** `CREATE INDEX idx_review_rating ON Review(rating);`
- **Schema Adjustment:** Added a composite index on `(property_id, rating)` to speed up property-specific review summaries.

## 4. Results
Querying properties by rating now uses a `Covering Index`, reducing disk I/O significantly.