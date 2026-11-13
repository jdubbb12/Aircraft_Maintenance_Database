<!-- Create extended statistics for aircraft id and repair ticket status -->
CREATE STATISTICS stats_repair_tickets_aircraft_status
(dependencies, mcv)
ON aircraft_id, status
FROM repair_tickets;