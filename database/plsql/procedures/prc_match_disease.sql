CREATE OR REPLACE PROCEDURE prc_match_disease(
    p_report_id IN NUMBER
)
IS
    -- Report Info
    v_crop_type     VARCHAR2(50);
    v_symptoms      VARCHAR2(500);

    -- Best match tracking
    v_best_disease_id   NUMBER := NULL;
    v_best_score        NUMBER := 0;

    -- Severity
    v_severity          VARCHAR2(20);

    -- Cursor for all diseases
    CURSOR disease_cur IS
        SELECT disease_id, disease_name, UPPER(symptom_keywords) AS symptom_keywords,
               UPPER(crop_type) AS crop_type
        FROM diseases;
BEGIN
    -- Fetch Report
    SELECT UPPER(crop_type), UPPER(symptoms)
    INTO v_crop_type, v_symptoms
    FROM crop_report
    WHERE report_id = p_report_id;

    -- Loop Diseases
    FOR d IN disease_cur LOOP
        DECLARE
            v_score        NUMBER := 0;
            v_keyword      VARCHAR2(200);
        BEGIN
            -- Crop match (50)
            IF d.crop_type = v_crop_type THEN
                v_score := v_score + 50;
            END IF;

            -- Keyword matching - multiple keywords
            FOR keyword IN (
                SELECT TRIM(REGEXP_SUBSTR(d.symptom_keywords, '[^,]+', 1, LEVEL)) AS kw
                FROM dual
                CONNECT BY REGEXP_SUBSTR(d.symptom_keywords, '[^,]+', 1, LEVEL) IS NOT NULL
            ) LOOP
                IF v_symptoms LIKE '%' || keyword.kw || '%' THEN
                    v_score := v_score + 10; -- 10 points per matched keyword
                END IF;
            END LOOP;

            -- Store best match
            IF v_score > v_best_score THEN
                v_best_score := v_score;
                v_best_disease_id := d.disease_id;
            END IF;
        END;
    END LOOP;

    -- Apply Result
    IF v_best_disease_id IS NOT NULL THEN
        v_severity := fn_get_severity(v_best_disease_id);

        INSERT INTO alert_log(report_id, disease_id, alert_status, severity, alert_date)
        VALUES (p_report_id, v_best_disease_id, 'MATCH_FOUND', v_severity, SYSDATE);

        INSERT INTO audit_log(operation_type, table_name, user_name, status, operation_date)
        VALUES ('DISEASE_MATCH', 'CROP_REPORT', USER, 'SUCCESS', SYSDATE);

    ELSE
        INSERT INTO alert_log(report_id, alert_status, severity, alert_date)
        VALUES (p_report_id, 'NO_MATCH', 'LOW', SYSDATE);

        INSERT INTO audit_log(operation_type, table_name, user_name, status, error_message, operation_date)
        VALUES ('DISEASE_MATCH', 'CROP_REPORT', USER, 'NO_MATCH', 'No disease matched', SYSDATE);
    END IF;

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Report ID ' || p_report_id || ' not found');

    WHEN OTHERS THEN
        ROLLBACK;
        prc_log_error('CROP_REPORT', 'DISEASE_MATCH', USER,
            'Report ID: ' || p_report_id || ' | Error: ' || SQLERRM);
        RAISE;
END prc_match_disease;
/
