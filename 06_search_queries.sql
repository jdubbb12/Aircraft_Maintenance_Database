<!-- Search for Aircraft with ID 2 -->
EXPLAIN ANALYZE
SELECT *
FROM repair_tickets
WHERE aircraft_id = 2;

<!-- Search for Aircraft with ID 9000 (nonexistent) -->
EXPLAIN ANALYZE
SELECT *
FROM repair_tickets
WHERE aircraft_id = 9000;

<!-- Search for Repair Tickets with status 'closed' -->
EXPLAIN ANALYZE
SELECT *
FROM repair_tickets
WHERE status = 'closed';

<!-- Search for Repair Tickets with status 'open' (low selectivity) -->
EXPLAIN ANALYZE
SELECT *
FROM repair_tickets
WHERE status = 'open';

<!-- Search for Repair Tickets with status 'closed' and Aircraft ID 2 -->
EXPLAIN ANALYZE
SELECT *
FROM repair_tickets
WHERE aircraft_id = 2
AND status = 'closed';