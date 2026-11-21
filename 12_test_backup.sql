-- Check that all five tables were restored
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;

-- Check the number of records in each table
SELECT 'aircraft' AS table_name, COUNT(*) FROM aircraft
UNION ALL
SELECT 'repair_tickets', COUNT(*) FROM repair_tickets
UNION ALL
SELECT 'parts', COUNT(*) FROM parts
UNION ALL
SELECT 'repair_ticket_parts', COUNT(*) FROM repair_ticket_parts
UNION ALL
SELECT 'repair_actions', COUNT(*) FROM repair_actions;