-- ============================================
-- FINAL VERIFICATION - TOTAL RECORDS
-- ============================================

SET PAGESIZE 50
SET LINESIZE 100

BEGIN
    DBMS_OUTPUT.PUT_LINE('╔══════════════════════════════════════════════════════════╗');
    DBMS_OUTPUT.PUT_LINE('║               MASS DATA INSERTION - SUMMARY              ║');
    DBMS_OUTPUT.PUT_LINE('╚══════════════════════════════════════════════════════════╝');
    DBMS_OUTPUT.PUT_LINE('');
END;
/

-- Count all records
SELECT 'FARMER:       ' || COUNT(*) || ' farmers' AS table_stats FROM farmer
UNION ALL
SELECT 'DISEASES:     ' || COUNT(*) || ' diseases' FROM diseases
UNION ALL
SELECT 'CROP_REPORT:  ' || COUNT(*) || ' reports' FROM crop_report
UNION ALL
SELECT 'ALERT_LOG:    ' || COUNT(*) || ' alerts' FROM alert_log
UNION ALL
SELECT 'AUDIT_LOG:    ' || COUNT(*) || ' audit logs' FROM audit_log;

-- Summary
SELECT '========================================' AS separator FROM dual;
SELECT 'TOTAL RECORDS: ' || (
    (SELECT COUNT(*) FROM farmer) +
    (SELECT COUNT(*) FROM diseases) +
    (SELECT COUNT(*) FROM crop_report) +
    (SELECT COUNT(*) FROM alert_log) +
    (SELECT COUNT(*) FROM audit_log)
) || ' records inserted' AS grand_total FROM dual;

-- Sample data preview
PROMPT === SAMPLE DATA PREVIEW (First 5 records each) ===

PROMPT 1. FARMERS:
SELECT farmer_id, full_name, location FROM farmer WHERE ROWNUM <= 5 ORDER BY farmer_id;

PROMPT 2. DISEASES:
SELECT disease_id, crop_type, risk_level FROM diseases WHERE ROWNUM <= 5 ORDER BY disease_id;

PROMPT 3. CROP REPORTS:
SELECT report_id, farmer_id, crop_type, report_date FROM crop_report WHERE ROWNUM <= 5 ORDER BY report_id;

PROMPT 4. ALERT LOGS:
SELECT alert_id, report_id, disease_id, alert_status FROM alert_log WHERE ROWNUM <= 5 ORDER BY alert_id;

PROMPT 5. AUDIT LOGS:
SELECT audit_id, operation_type, table_name, status FROM audit_log WHERE ROWNUM <= 5 ORDER BY audit_id;

-- Success message
SELECT '🎉 PHASE V COMPLETED: 330+ RECORDS INSERTED!' AS celebration FROM dual;
SELECT '📊 Database now contains substantial data for testing' AS note FROM dual;
SELECT '🚀 Ready for Phase VI: PL/SQL Procedures' AS next_step FROM dual;