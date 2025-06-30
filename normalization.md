### Normalization

The booking.total_price and payment.amount represent the same attribute which is regarded as redundancy.
As a plan of action one should consider removing booking.total_price.

All tables would now:

* Have atomic values (1NF)
* No partial dependencies (2NF)
* No transitive dependencies (3NF)

### Explanation
I	Verified atomicity of fields (1NF), checked for composite keys → N/A (2NF), removed total_price from Booking to eliminate transitive dependency (3NF), ensured foreign keys relate only to direct entities, not derived data.
