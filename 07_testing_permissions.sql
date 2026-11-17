-- Change to the aircraft_technician role
SET ROLE aircraft_technician;

-- Trying to change the status of an aircraft to 'maintenance'
UPDATE aircraft SET status = 'maintenance' WHERE aircraft_id = 2;

-- Updating a repair ticket
BEGIN;
UPDATE repair_tickets SET priority = 'high' WHERE ticket_id = 2;
ROLLBACK;

-- Inserting a new repair action
BEGIN;
INSERT INTO repair_actions (ticket_id, action_at, performed_by, action_type, description)
VALUES (1, CURRENT_TIMESTAMP, 'Test Technician', 'Inspection', 'Permission testing maintenance action');
ROLLBACK;

-- Trying to insert a new part
INSERT INTO parts (part_number, part_name, description)
VALUES ('TEST-999', 'Test Aircraft Part', 'Permission testing part');

RESET ROLE;

-- Change to the aircraft_technician_manager role
SET ROLE aircraft_technician_manager;

-- Trying to change the status of an aircraft to 'maintenance'
BEGIN;
UPDATE aircraft SET status = 'maintenance' WHERE aircraft_id = 2;
ROLLBACK;

-- Updating a part
BEGIN;
UPDATE parts SET description = 'Updated engine oil filter for aircraft maintenance' WHERE part_id = 1;
ROLLBACK;

-- Trying to delete a repair ticket
DELETE FROM repair_tickets WHERE ticket_id = 2;

-- Trying to insert a new part
BEGIN;
INSERT INTO parts (part_number, part_name, description)
VALUES ('TEST-999', 'Test Aircraft Part', 'Permission testing part');
ROLLBACK;