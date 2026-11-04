CREATE ROLE database_manager;
ALTER ROLE database_manager WITH SUPERUSER;

CREATE ROLE aircraft_technician_manager; 
GRANT INSERT, UPDATE ON aircraft, repair_tickets, parts, repair_ticket_parts, repair_actions TO aircraft_technician_manager; 

CREATE ROLE aircraft_technician;
GRANT INSERT, UPDATE ON repair_tickets, repair_ticket_parts, repair_actions TO aircraft_technician;
