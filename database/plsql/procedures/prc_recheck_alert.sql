CREATE OR REPLACE PROCEDURE prc_recheck_alert(
    p_report_id IN NUMBER
)
IS
    v_old_disease_id   NUMBER;
    v_old_status       VARCHAR2(20);
    v_old_exists       NUMBER;
BEGIN
    -- Validate report exists
    DECLARE v_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_exists
        FROM crop_report
        WHERE report_id = p_report_id;

        IF v_exists = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Report ID ' || p_report_id || ' does not exist');
        END IF;
    END;

    -- Check if old alert exists
    SELECT COUNT(*) INTO v_old_exists
    FROM alert_log
    WHERE report_id = p_report_id;

    IF v_old_exists > 0 THEN
        SELECT disease_id, alert_status
        INTO v_old_disease_id, v_old_status
        FROM alert_log
        WHERE report_id = p_report_id;

        DELETE FROM alert_log WHERE report_id = p_report_id;
    END IF;

    -- Re-run match
    prc_match_disease(p_report_id);

    -- Log recheck
    INSERT INTO audit_log(
        operation_type, table_name, user_name, status, error_message, operation_date
    ) VALUES (
        'RECHECK_ALERT',
        'ALERT_LOG',
        USER,
        'SUCCESS',
        'Old disease: ' || NVL(v_old_disease_id, -1) ||
        ' -> New match applied',
        SYSDATE
    );

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        prc_log_error('ALERT_LOG', 'RECHECK_ALERT', USER,
            'Report ID: ' || p_report_id || ' | Error: ' || SQLERRM);
        RAISE;
END prc_recheck_alert;
/
