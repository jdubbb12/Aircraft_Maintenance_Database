<!-- Create indexes for aircraft id -->
CREATE INDEX idx_repair_tickets_aircraft
ON repair_tickets(aircraft_id);