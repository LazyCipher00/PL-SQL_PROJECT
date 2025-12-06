-- Procedure Testing Script
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== PROCEDURE TESTING ===');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test 1: prc_match_disease
    DBMS_OUTPUT.PUT_LINE('Test 1: prc_match_disease (Report 5)');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    prc_match_disease(5);
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test 2: prc_recheck_alert
    DBMS_OUTPUT.PUT_LINE('Test 2: prc_recheck_alert (Report 6)');
    DBMS_OUTPUT.PUT_LINE('--------------------------------------');
    prc_recheck_alert(6);
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test 3: prc_log_error
    DBMS_OUTPUT.PUT_LINE('Test 3: prc_log_error (Test error)');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    prc_log_error('TEST_TABLE', 'TEST_OPERATION', 'TEST_USER', 'This is a test error message');
    DBMS_OUTPUT.PUT_LINE('Error logged successfully');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Test 4: Package procedures
    DBMS_OUTPUT.PUT_LINE('Test 4: Package procedures');
    DBMS_OUTPUT.PUT_LINE('--------------------------');
    disease_pkg.process_disease_matching(7);
    disease_pkg.generate_daily_report();
    DBMS_OUTPUT.PUT_LINE('');
    
    DBMS_OUTPUT.PUT_LINE('=== PROCEDURE TESTS COMPLETED ===');
END;
/