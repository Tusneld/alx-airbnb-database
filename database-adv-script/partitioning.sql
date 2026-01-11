-- Step 1: Create the Booking table with Partitioning by Range on start_date
CREATE TABLE Booking (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    guest_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(12, 2) NOT NULL,
    status booking_status DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

-- Step 2: Create specific partitions for different timeframes
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: Test a query on the partitioned table
-- This will now perform 'Partition Pruning', only searching the relevant sub-table
EXPLAIN ANALYZE
SELECT * FROM Booking 
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';