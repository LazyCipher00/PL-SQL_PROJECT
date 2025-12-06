-- Data Validation Queries
SET PAGESIZE 50;

-- 1. Data completeness check
SELECT '1. Data Count Verification:' AS check_type FROM dual;
SELECT 'Farmers: ' || COUNT(*) FROM farmer
UNION ALL
SELECT 'Diseases: ' || COUNT(*) FROM diseases
UNION ALL
SELECT 'Crop Reports: ' || COUNT(*) FROM crop_report
UNION ALL
SELECT 'Alert Logs: ' || COUNT(*) FROM alert_log
UNION ALL
SELECT 'Audit Logs: ' || COUNT(*) FROM audit_log;

-- 2. Foreign key relationship validation
SELECT '2. Foreign Key Validation:' AS check_type FROM dual;
SELECT 'Orphan crop reports: ' || COUNT(*) 
FROM crop_report cr 
WHERE NOT EXISTS (SELECT 1 FROM farmer f WHERE f.farmer_id = cr.farmer_id)
UNION ALL
SELECT 'Orphan alert logs: ' || COUNT(*) 
FROM alert_log al 
WHERE al.disease_id IS NOT NULL 
AND NOT EXISTS (SELECT 1 FROM diseases d WHERE d.disease_id = al.disease_id);

-- 3. Data quality checks
SELECT '3. Data Quality Checks:' AS check_type FROM dual;
SELECT 'Farmers without phone: ' || COUNT(*) FROM farmer WHERE phone IS NULL
UNION ALL
SELECT 'Diseases without name: ' || COUNT(*) FROM diseases WHERE disease_name IS NULL
UNION ALL
SELECT 'Reports without symptoms: ' || COUNT(*) FROM crop_report WHERE symptoms IS NULL;

-- 4. Business rule validation
SELECT '4. Business Rule Validation:' AS check_type FROM dual;
SELECT 'Invalid risk levels: ' || COUNT(*) 
FROM diseases 
WHERE risk_level NOT IN ('NORMAL', 'HIGH') AND risk_level IS NOT NULL
UNION ALL
SELECT 'Invalid alert status: ' || COUNT(*) 
FROM alert_log 
WHERE alert_status NOT IN ('MATCH_FOUND', 'NO_MATCH');

-- 5. System health check
SELECT '5. System Health Check:' AS check_type FROM dual;
SELECT 'Failed operations: ' || COUNT(*) FROM audit_log WHERE status = 'FAILED'
UNION ALL
SELECT 'Recent errors (last 24h): ' || COUNT(*) 
FROM audit_log 
WHERE status = 'FAILED' AND operation_date >= SYSDATE - 1
UNION ALL
SELECT 'Unmatched alerts: ' || COUNT(*) FROM alert_log WHERE alert_status = 'NO_MATCH';