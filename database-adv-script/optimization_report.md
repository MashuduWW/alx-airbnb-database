# Report


Avoid **SELECT**, rather use fetch only required columns to reduce I/O.

Add indexes on JOIN and filter columns (guest_id, property_id, booking_id).

Combine name fields with || to reduce multiple output columns if full names are enough.

Use EXPLAIN ANALYZE to compare Total Runtime and whether Seq Scan changes to Index Scan.
