# Find PostgreSQL configuration file
$config = psql -U postgres -d postgres -tA -c "SHOW config_file;"

# Create WAL archive folder
New-Item -ItemType Directory -Force -Path "C:\wal_archive"

# Back up PostgreSQL configuration file
Copy-Item -Path $config -Destination "$config.backup"

# Add WAL settings
Add-Content -Path $config -Value @"

wal_level = replica
archive_mode = on
archive_command = 'copy "%p" "C:\\wal_archive\\%f"'

"@

# Restart PostgreSQL
Restart-Service postgresql-x64-18