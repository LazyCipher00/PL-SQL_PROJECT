-- Package Body: pkg_crop_disease


CREATE OR REPLACE PACKAGE BODY pkg_crop_disease AS
    
    FUNCTION get_disease_severity(p_disease_id IN NUMBER) RETURN VARCHAR2 IS
        v_risk_level VARCHAR2(10);
    BEGIN
        SELECT risk_level INTO v_risk_level
        FROM diseases
        WHERE disease_id = p_disease_id;
        
        RETURN v_risk_level;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN RETURN 'UNKNOWN';
        WHEN OTHERS THEN RETURN 'ERROR';
    END get_disease_severity;
    
    PROCEDURE process_disease_matching(p_report_id IN NUMBER) IS
    BEGIN
        -- Call existing match_disease procedure
        prc_match_disease(p_report_id);
    END process_disease_matching;
    
    PROCEDURE re_evaluate_alert(p_report_id IN NUMBER) IS
    BEGIN
        -- Call existing recheck procedure
        prc_recheck_alert(p_report_id);
    END re_evaluate_alert;
    
    PROCEDURE log_system_error(
        p_table_name IN VARCHAR2,
        p_operation_type IN VARCHAR2,
        p_user_name IN VARCHAR2 DEFAULT USER,
        p_error_message IN VARCHAR2
    ) IS
    BEGIN
        -- Call existing error logging
        prc_log_error(p_table_name, p_operation_type, p_user_name, p_error_message);
    END log_system_error;
    
    PROCEDURE generate_daily_report(p_report_date IN DATE DEFAULT SYSDATE) IS
        v_report_date DATE := TRUNC(p_report_date);
        v_total_farmers NUMBER;
        v_total_alerts NUMBER;
    BEGIN
        -- Get statistics
        SELECT COUNT(*) INTO v_total_farmers FROM farmer;
        SELECT COUNT(*) INTO v_total_alerts FROM alert_log WHERE TRUNC(alert_date) = v_report_date;
        
        INSERT INTO audit_log (operation_type, table_name, user_name, status, operation_date)
        VALUES ('DAILY_REPORT', 'SYSTEM', USER, 'SUCCESS', SYSDATE);
        
        DBMS_OUTPUT.PUT_LINE('Daily report generated for: ' || TO_CHAR(v_report_date, 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Total farmers: ' || v_total_farmers);
        DBMS_OUTPUT.PUT_LINE('Total alerts today: ' || v_total_alerts);
        
        COMMIT;
    END generate_daily_report;
    
    FUNCTION get_system_statistics RETURN SYS_REFCURSOR IS
        v_cursor SYS_REFCURSOR;
    BEGIN
        OPEN v_cursor FOR
            SELECT 
                (SELECT COUNT(*) FROM farmer) AS total_farmers,
                (SELECT COUNT(*) FROM diseases) AS total_diseases,
                (SELECT COUNT(*) FROM crop_report) AS total_reports,
                (SELECT COUNT(*) FROM alert_log) AS total_alerts,
                (SELECT COUNT(*) FROM audit_log) AS audit_entries,
                (SELECT COUNT(*) FROM alert_log WHERE alert_status = 'MATCH_FOUND') AS matched_alerts,
                (SELECT COUNT(*) FROM alert_log WHERE alert_status = 'NO_MATCH') AS unmatched_alerts,
                SYSDATE AS current_timestamp
            FROM dual;
        
        RETURN v_cursor;
    END get_system_statistics;
    
END pkg_crop_disease;
/