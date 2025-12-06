CREATE OR REPLACE FUNCTION fn_get_severity(
    p_disease_id IN NUMBER
) RETURN VARCHAR2
IS
    v_risk_level  VARCHAR2(10);
BEGIN
    SELECT UPPER(risk_level)
    INTO v_risk_level
    FROM diseases
    WHERE disease_id = p_disease_id;

    CASE v_risk_level
        WHEN 'HIGH' THEN RETURN 'HIGH';
        WHEN 'NORMAL' THEN RETURN 'NORMAL';
        ELSE RETURN 'UNKNOWN';
    END CASE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NOT_FOUND';

    WHEN OTHERS THEN
        RETURN 'ERROR';
END fn_get_severity;
/
