-- Monthly Report Generation Procedure
-- Location: database/phase_vii_advanced/analytics/

CREATE OR REPLACE PROCEDURE prc_generate_monthly_report(
    p_month IN NUMBER DEFAULT EXTRACT(MONTH FROM SYSDATE),
    p_year IN NUMBER DEFAULT EXTRACT(YEAR FROM SYSDATE)
) IS
    
    v_start_date DATE;
    v_end_date DATE;
    v_report_id NUMBER;
    
    CURSOR monthly_stats IS
        SELECT 
            d.crop_type,
            d.disease_name,
            COUNT(al.alert_id) AS alert_count,
            ROUND(AVG(CASE WHEN al.severity = 'HIGH' THEN 1 ELSE 0 END) * 100, 2) AS high_severity_pct,
            COUNT(DISTINCT f.location) AS affected_locations
        FROM alert_log al
        JOIN diseases d ON al.disease_id = d.disease_id
        JOIN crop_report cr ON al.report_id = cr.report_id
        JOIN farmer f ON cr.farmer_id = f.farmer_id
        WHERE EXTRACT(MONTH FROM al.alert_date) = p_month
          AND EXTRACT(YEAR FROM al.alert_date) = p_year
          AND al.alert_status = 'MATCH_FOUND'
        GROUP BY d.crop_type, d.disease_name
        ORDER BY alert_count DESC;
    
BEGIN
    -- Calculate date range
    v_start_date := TO_DATE('01-' || p_month || '-' || p_year, 'DD-MM-YYYY');
    v_end_date := LAST_DAY(v_start_date);
    
    -- Generate report header
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('MONTHLY DISEASE REPORT');
    DBMS_OUTPUT.PUT_LINE('Period: ' || TO_CHAR(v_start_date, 'Month YYYY'));
    DBMS_OUTPUT.PUT_LINE('Generated: ' || TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI'));
    DBMS_OUTPUT.PUT_LINE('==========================================');
    
    -- Display statistics
    FOR rec IN monthly_stats LOOP
        DBMS_OUTPUT.PUT_LINE(
            RPAD(rec.crop_type, 10) || ' | ' ||
            RPAD(rec.disease_name, 25) || ' | ' ||
            LPAD(rec.alert_count, 5) || ' alerts | ' ||
            LPAD(rec.high_severity_pct || '%', 8) || ' high | ' ||
            LPAD(rec.affected_locations, 3) || ' locations'
        );
    END LOOP;
    
    -- Log report generation
    INSERT INTO audit_log (operation_type, table_name, user_name, status, operation_date)
    VALUES ('MONTHLY_REPORT', 'SYSTEM', USER, 'SUCCESS', SYSDATE);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('==========================================');
    DBMS_OUTPUT.PUT_LINE('Report generated successfully.');
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        prc_log_error('SYSTEM', 'MONTHLY_REPORT', USER, SQLERRM);
        RAISE;
END prc_generate_monthly_report;
/