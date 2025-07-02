PERFORMANCE REPORT

Before Partitioning:

Query scanned all rows from the full bookings table (sequential scan).

Execution time: ~500ms for large datasets

After Partitioning:

Query touches only bookings_2025 partition due to RANGE pruning.

Execution time: ~50-100ms depending on index use

Query plan shows: "Index Scan using idx_bookings_2025_guest_id"

Summary:

Reduced I/O significantly by scanning fewer rows

Optimized date-range filtering via automatic partition pruning

Easier to manage old data (e.g., dropping old partitions)
