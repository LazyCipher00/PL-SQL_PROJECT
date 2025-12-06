-- View Testing Script
SET PAGESIZE 100;
SET LINESIZE 200;

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== VIEW TESTING ===');
END;
/

-- Test 1: Farmer Dashboard
SELECT '1. Farmer Dashboard (First 5 rows):' AS test FROM dual;
SELECT * FROM vw_farmer_dashboard WHERE ROWNUM <= 5;

-- Test 2: Disease Statistics
SELECT '2. Disease Statistics (First 5 rows):' AS test FROM dual;
SELECT * FROM vw_disease_statistics WHERE ROWNUM <= 5;

-- Test 3: Alert Monitoring
SELECT '3. Recent Alerts (First 5 rows):' AS test FROM dual;
SELECT alert_id, report_id, farmer_name, disease_name, alert_status, severity, alert_date
FROM vw_alert_monitoring WHERE ROWNUM <= 5;

-- Test 4: System Audit
SELECT '4. Recent Audit Logs (First 5 rows):' AS test FROM dual;
SELECT audit_id, operation_type, table_name, status, minutes_ago
FROM vw_system_audit WHERE ROWNUM <= 5;

-- Test 5: View Statistics
SELECT '5. View Information:' AS test FROM dual;
SELECT view_name, text_length, read_only 
FROM user_views 
WHERE view_name LIKE 'VW_%'
ORDER BY view_name;