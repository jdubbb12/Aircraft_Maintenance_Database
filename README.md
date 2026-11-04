# Aircraft Maintenance Database

**CSCE 4355 — Database Administration | Team 17**

## Team Members

- Jacob Whittington
- Madison Dean

## Project Overview

The Aircraft Maintenance Database is a PostgreSQL project designed to organize and track aircraft maintenance records. It stores aircraft information, repair tickets, maintenance actions, and the parts used during repairs. The project also provides a way to demonstrate database administration concepts such as relationships, constraints, user roles, and permissions.

## Project Objectives

- Maintain a record of aircraft and their identifying information.
- Track reported maintenance problems and the status of repair tickets.
- Record the maintenance actions performed for each ticket.
- Track the parts and quantities used in repairs.
- Apply PostgreSQL database administration techniques as the project develops.

## Database Tables

| Table | Description |
| --- | --- |
| `aircraft` | Stores aircraft id, serial numbers, models, manufacturers, and status. |
| `repair_tickets` | Stores reported maintenance issues for each aircraft. |
| `parts` | Stores part numbers, names, and descriptions. |
| `repair_ticket_parts` | Connects parts to repair tickets and records quantities, costs, and install details. |
| `repair_actions` | Records actions performed on repair tickets, including who performed them and when. |

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/jdubbb12/Aircraft_Maintenance_Database.git
```

### 2. Create the database

Connect to PostgreSQL using `psql`:

```bash
psql -U postgres -d postgres -f 00_create_database.sql
```

The database only needs to be created once.

### 3. Create the tables

Exit `psql` with `\q`, then run the table creation SQL file **if it is present in the repository**:

```bash
psql -U postgres -d aircraft_maintenance_db -f 01_create_tables.sql
```

### 4. Verify the database

Connect to the project database:

```bash
psql -U postgres -d aircraft_maintenance_db
```

List tables:

```sql
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
```

## Database Roles and Permissions

The project design includes the roles:

| Role | Intended responsibility |
| --- | --- |
| `database_manager` | Database administration and management. |
| `aircraft_technician_manager` | Manage aircraft, parts, and maintenance records. |
| `aircraft_technician` | Record and update repair tickets and maintenance actions. |

## Project Files

SQL scripts will be added and updated as the project develops. Files included are:

- `00_create_database.sql` — creates the database.
- `01_create_tables.sql` — creates the five tables and their relationships.
- `02_create_roles.sql` — defines roles and privileges.
