-- Trigger Testing Script
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== TRIGGER TESTING ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Count alerts before test
    DECLARE
        v_before_count NUMBER;
        v_after_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_before_count FROM alert_log;
        DBMS_OUTPUT.PUT_LINE('Alerts before trigger test: ' || v_before_count);
        DBMS_OUTPUT.PUT_LINE('');
        
        -- Test 1: Insert new crop report (trg_auto_match should fire)
        DBMS_OUTPUT.PUT_LINE('Test 1: Insert new crop report');
        DBMS_OUTPUT.PUT_LINE('-------------------------------');
        INSERT INTO crop_report (farmer_id, crop_type, symptoms)
        VALUES (10, 'Maize', 'Yellow leaves with brown spots, stunted growth');
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('New report inserted - trigger should have fired');
        DBMS_OUTPUT.PUT_LINE('');
        
        -- Test 2: Insert another report
        DBMS_OUTPUT.PUT_LINE('Test 2: Insert another report');
        DBMS_OUTPUT.PUT_LINE('-----------------------------');
        INSERT INTO crop_report (farmer_id, crop_type, symptoms)
        VALUES (15, 'Tomato', 'Wilting plants, yellow spots on leaves');
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Second report inserted');
        DBMS_OUTPUT.PUT_LINE('');
        
        -- Check results
        SELECT COUNT(*) INTO v_after_count FROM alert_log;
        DBMS_OUTPUT.PUT_LINE('Alerts after trigger test: ' || v_after_count);
        DBMS_OUTPUT.PUT_LINE('New alerts created: ' || (v_after_count - v_before_count));
        
        -- Show the new alerts
        DBMS_OUTPUT.PUT_LINE('');
        DBMS_OUTPUT.PUT_LINE('Newly created alerts:');
        FOR rec IN (
            SELECT * FROM alert_log 
            WHERE alert_id > (SELECT MAX(alert_id) - 10 FROM alert_log)
            ORDER BY alert_id DESC
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Alert ' || rec.alert_id || 
                ' - Report ' || rec.report_id || 
                ' - Status: ' || rec.alert_status || 
                ' - Severity: ' || rec.severity
            );
        END LOOP;
    END;
    
    DBMS_OUTPUT.PUT_LINE('');
    DBMS_OUTPUT.PUT_LINE('=== TRIGGER TESTS COMPLETED ===');
END;
/