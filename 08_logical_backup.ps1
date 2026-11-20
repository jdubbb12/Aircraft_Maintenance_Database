# Creates a logical backup using pg_dump
$date = Get-Date -Format "yyyy-MM-dd"

pg_dump -U backup_user -d aircraft_maintenance_db -Fc -Z 6 -f "aircraft_maintenance_db_$date.dump"

# Backs up the roles
pg_dumpall -U postgres --globals-only -f "globals_$date.sql"