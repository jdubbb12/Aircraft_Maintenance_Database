<!-- Create indexes for aircraft id -->
CREATE INDEX idx_repair_tickets_aircraft
ON repair_tickets(aircraft_id);

<!-- Create indexes for repair ticket status -->
CREATE INDEX idx_repair_tickets_status
ON repair_tickets(status);

<!-- Creates composite index for aircraft id and repair ticket status -->
CREATE INDEX idx_repair_tickets_aircraft_status
ON repair_tickets(aircraft_id, status);