# Creates a physical backup of the PostgreSQL data directory

pg_basebackup -h localhost -U replication_user -D physical_backup -Ft -z -Xs -P