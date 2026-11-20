-- Database Manager
CREATE ROLE database_manager;
ALTER ROLE database_manager WITH SUPERUSER;

-- Aircraft Technician Manager
CREATE ROLE aircraft_technician_manager;

GRANT SELECT, INSERT, UPDATE ON aircraft, repair_tickets, parts, repair_ticket_parts, repair_actions TO aircraft_technician_manager;

-- Aircraft Technician
CREATE ROLE aircraft_technician;

GRANT SELECT ON aircraft, parts TO aircraft_technician;

GRANT SELECT, INSERT, UPDATE ON repair_tickets, repair_ticket_parts, repair_actions TO aircraft_technician;

-- Sequence Permissions
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO aircraft_technician, aircraft_technician_manager;

-- Backup Role
CREATE ROLE backup_user LOGIN;

GRANT pg_read_all_data TO backup_user;

GRANT CONNECT ON DATABASE aircraft_maintenance_db TO backup_user;

\password backup_user

-- Replication Role
CREATE ROLE replication_user LOGIN REPLICATION;

\password replication_user
