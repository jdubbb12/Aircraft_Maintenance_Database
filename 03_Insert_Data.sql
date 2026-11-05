<--! Test aircraft data -->
INSERT INTO aircraft (tail_number, serial_number, model, manufacturer, status)
VALUES
('TEST-17001', 'TEST-C17-001', 'C-17 Globemaster III', 'Boeing', 'active'),
('TEST-17002', 'TEST-C17-002', 'C-17 Globemaster III', 'Boeing', 'maintenance'),
('TEST-05001', 'TEST-C5-001', 'C-5M Super Galaxy', 'Lockheed Martin', 'active'),
('TEST-05002', 'TEST-C5-002', 'C-5M Super Galaxy', 'Lockheed Martin', 'maintenance'),
('TEST-10001', 'TEST-KC10-001', 'KC-10 Extender', 'McDonnell Douglas', 'retired');


<--! Test repair data -->
INSERT INTO repair_tickets
(ticket_number, aircraft_id, reported_at, opened_by, priority, status, problem_description)
VALUES
('RT-001', 2, CURRENT_TIMESTAMP, 'John Smith', 'high', 'open',
'Engine oil pressure reading below normal operating range'),

('RT-002', 3, CURRENT_TIMESTAMP, 'Michael Davis', 'normal', 'open',
'Hydraulic fluid leak detected during preflight inspection'),

('RT-003', 4, CURRENT_TIMESTAMP, 'James Wilson', 'high', 'open',
'Landing gear indication malfunction'),

('RT-004', 5, CURRENT_TIMESTAMP, 'Robert Johnson', 'normal', 'open',
'Fuel quantity indicator displaying incorrect readings'),

('RT-005', 6, CURRENT_TIMESTAMP, 'David Miller', 'low', 'closed',
'Historical maintenance record for auxiliary power unit malfunction');


<--! Test aircraft part data -->
INSERT INTO parts (part_number, part_name, description)
VALUES
('PART-001', 'Engine Oil Filter',
'Replacement oil filter for aircraft engine lubrication system'),

('PART-002', 'Hydraulic Hose',
'Replacement hydraulic hose for aircraft hydraulic systems'),

('PART-003', 'Landing Gear Position Sensor',
'Sensor used to monitor landing gear position'),

('PART-004', 'Fuel Quantity Sensor',
'Sensor used to measure aircraft fuel levels'),

('PART-005', 'APU Starter',
'Starter component for the auxiliary power unit');


<--! Test repair ticket part data -->
INSERT INTO repair_ticket_parts
(ticket_id, part_id, quantity, unit_cost_at_use, installed_at, notes)
VALUES
(1, 1, 1, 150.00, CURRENT_TIMESTAMP,
'Engine oil filter replaced'),

(2, 2, 2, 275.00, CURRENT_TIMESTAMP,
'Two hydraulic hoses replaced'),

(3, 3, 1, 850.00, CURRENT_TIMESTAMP,
'Landing gear position sensor replaced'),

(4, 4, 1, 1200.00, CURRENT_TIMESTAMP,
'Fuel quantity sensor replaced'),

(5, 5, 1, 3200.00, CURRENT_TIMESTAMP,
'Historical APU starter replacement');


<--! Test maintenance data -->
INSERT INTO repair_actions
(ticket_id, action_at, performed_by, action_type, description)
VALUES
(1, CURRENT_TIMESTAMP, 'John Smith', 'Inspection',
'Inspected engine lubrication system and identified low oil pressure'),

(2, CURRENT_TIMESTAMP, 'Michael Davis', 'Repair',
'Replaced two leaking hydraulic hoses and inspected connections'),

(3, CURRENT_TIMESTAMP, 'James Wilson', 'Replacement',
'Replaced faulty landing gear position sensor'),

(4, CURRENT_TIMESTAMP, 'Robert Johnson', 'Replacement',
'Replaced malfunctioning fuel quantity sensor'),

(5, CURRENT_TIMESTAMP, 'David Miller', 'Repair',
'Replaced APU starter and completed historical maintenance documentation');