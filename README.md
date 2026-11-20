# Aircraft Maintenance Database

**CSCE 4355 — Database Administration | Team 17**

## Team Members

- Jacob Whittington
- Madison Dean

## Project Overview

The Aircraft Maintenance Database is a PostgreSQL project designed to organize and track aircraft maintenance records. It stores aircraft information, repair tickets, maintenance actions, and the parts used during repairs. The project also provides a way to demonstrate database administration concepts such as relationships, constraints, user roles, permissions, performance optimization, and backup & recovery.

## Project Objectives

- Maintain a record of aircraft and their identifying information.
- Track reported maintenance problems and the status of repair tickets.
- Record the maintenance actions performed for each ticket.
- Track the parts and quantities used in repairs.
- Improve query performance using indexes and extended statistics.
- Restrict database operations based on user roles.
- Create and restore database backups.

## Database Tables

| Table | Description |
| --- | --- |
| `aircraft` | Stores aircraft id, serial numbers, models, manufacturers, and status. |
| `repair_tickets` | Stores reported maintenance issues for each aircraft. |
| `parts` | Stores part numbers, names, and descriptions. |
| `repair_ticket_parts` | Connects parts to repair tickets and records quantities, costs, and install details. |
| `repair_actions` | Records actions performed on repair tickets, including who performed them and when. |

## Getting Started

Use these commands in your terminal:

### 1. Clone the repository

```bash
git clone https://github.com/jdubbb12/Aircraft_Maintenance_Database.git
```

### 2. Create the database

```bash
psql -U postgres -d postgres -f 00_create_database.sql
```

The database only needs to be created once.

### 3. Create the tables

```bash
psql -U postgres -d aircraft_maintenance_db -f 01_create_tables.sql
```

### 4. Create the roles

```bash
psql -U postgres -d aircraft_maintenance_db -f 02_create_roles.sql
```

### 5. Verify the database

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

### 6. Insert Sample Data

```bash
psql -U postgres -d aircraft_maintenance_db -f 03_insert_data.sql
```

### 7. Create Indexes and Extended Statistics

Indexes:
```bash
psql -U postgres -d aircraft_maintenance_db -f 04_create_indexes.sql
```
Extended Statistics:
```bash
psql -U postgres -d aircraft_maintenance_db -f 05_create_extended_statistics.sql
```

### 8. Run Queries

```bash
psql -U postgres -d aircraft_maintenance_db -f 06_search_queries.sql
```

### 9. Test Role Permissions

```bash
psql -U postgres -d aircraft_maintenance_db -f 07_testing_permissions.sql
```

## Database Roles and Permissions

The project design includes the roles:

| Role | Intended responsibility |
| --- | --- |
| `database_manager` | Database administration and management. |
| `aircraft_technician_manager` | Manage aircraft, parts, and maintenance records. |
| `aircraft_technician` | Record and update repair tickets and maintenance actions. |
| `backup_user` | Creates logical database backups. |
| `replication_user` | Creates physical database backups. |

## Performance Optimization

The project uses EXPLAIN ANALYZE to compare query performance before and after optimization.

Indexes were created on aircraft ID, repair ticket status, and a combination of aircraft ID and status.

Testing showed improvements in individual query execution times after indexing. Extended statistics were also used to improve PostgreSQL's row estimates.

## Backup and Recovery

The project includes logical backups, physical backups, WAL archiving, and restoration testing.

The backup scripts are written for Windows PowerShell.

### 1. Logical Backup

Run this in the PowerShell:

```powershell
.\08_logical_backup.ps1
```

This uses `pg_dump` to back up the aircraft maintenance database and `pg_dumpall` to back up PostgreSQL roles.

### 2. Physical Backup

Run:

```powershell
.\09_physical_backup.ps1
```

This uses `pg_basebackup` to create a physical backup.

### 3. Restore Backup

Run:

```powershell
.\10_restore_backup.ps1
```

This creates a separate database called `aircraft_maintenance_db_restore` and restores the logical backup using `pg_restore`.

The backup filename must match the file created by the logical backup script. The restore database must not already exist.

After restoring, the script checks the number of repair tickets to verify that the data was restored.

### 4. WAL Archiving

Open PowerShell as Administrator and run:

```powershell
.\11_setup_wal_archiving.ps1
```

This creates a WAL archive folder, updates PostgreSQL's configuration, and restarts PostgreSQL.

The PostgreSQL service must have permission to write to the archive folder. WAL archiving only needs to be configured once.

### 5. Verify WAL Archiving

Connect to PostgreSQL:

```powershell
psql -U postgres -d aircraft_maintenance_db
```

Run:

```sql
SHOW wal_level;
SHOW archive_mode;
SHOW archive_command;
```

To check if WAL files are being archived successfully, run:

```sql
SELECT archived_count, failed_count, last_archived_wal
FROM pg_stat_archiver;
```
### Backup Files

The backup files are stored locally and should not get uploaded to GitHub.

The `.gitignore` file includes:

```gitignore
*.dump
globals_*.sql
physical_backup/
```

## Project Files

SQL scripts will be added and updated as the project develops. Files included are:

- `00_create_database.sql` — creates the database.
- `01_create_tables.sql` — creates the five tables and their relationships.
- `02_create_roles.sql` — defines roles and privileges & creates passwords for backup_user and replication_user.
- `03_insert_data.sql` — inserts 10,000 rows of sample data
- `04_create_indexes.sql` — create indexes on aircraft id and status
- `05_create_extended_statistics.sql` — creates extended statistics for better performance using the composite index on aircraft id and status
- `06_search_queries.sql` — includes the queries used to test optimization
- `07_testing_permissions.sql` — includes test transactions to ensure permissions are correct
- `08_logical_backup.ps1` — creates logical backup
- `09_physical_backup.ps1` — creates physical backup
- `10_restore_backup.ps1` — creates the stored backup database
- `11_setup_wal_achiving.ps1` — creates a WAL archive folder, updates PostgreSQL's configuration, and restarts PostgreSQL