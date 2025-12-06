-- Function Testing Script
SET SERVEROUTPUT ON;
SET PAGESIZE 50;

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== FUNCTION TESTING ===');
    
    -- Test 1: fn_get_severity
    DBMS_OUTPUT.PUT_LINE('Test 1: fn_get_severity');
    DBMS_OUTPUT.PUT_LINE('------------------------');
    DBMS_OUTPUT.PUT_LINE('Disease 1: ' || fn_get_severity(1));
    DBMS_OUTPUT.PUT_LINE('Disease 2: ' || fn_get_severity(2));
    DBMS_OUTPUT.PUT_LINE('Invalid Disease 999: ' || fn_get_severity(999));
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test 2: Test with all diseases
    DBMS_OUTPUT.PUT_LINE('Test 2: Severity for all diseases');
    DBMS_OUTPUT.PUT_LINE('----------------------------------');
    FOR rec IN (SELECT disease_id, disease_name, risk_level FROM diseases ORDER BY disease_id) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Disease ' || rec.disease_id || 
            ' "' || rec.disease_name || 
            '": Risk=' || rec.risk_level || 
            ' → Severity=' || fn_get_severity(rec.disease_id)
        );
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('=== FUNCTION TESTS COMPLETED ===');
END;
/