# Restores the database from a logical backup
$date = Get-Date -Format "yyyy-MM-dd"

createdb -U postgres aircraft_maintenance_db_restore

pg_restore -U postgres -d aircraft_maintenance_db_restore --no-owner "aircraft_maintenance_db_$date.dump"

psql -U postgres -d aircraft_maintenance_db_restore -c "SELECT count(*) FROM repair_tickets;"