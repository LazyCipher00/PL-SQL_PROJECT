-- Test Script for PL/SQL Components
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('=== Testing PL/SQL Components ===');
    
    -- Test 1: Function
    DBMS_OUTPUT.PUT_LINE('1. Testing fn_get_severity:');
    DBMS_OUTPUT.PUT_LINE('   Disease 1: ' || fn_get_severity(1));
    DBMS_OUTPUT.PUT_LINE('   Disease 999: ' || fn_get_severity(999));
    
    -- Test 2: Manual match
    DBMS_OUTPUT.PUT_LINE('2. Testing prc_match_disease (Report 3):');
    prc_match_disease(3);
    
    -- Test 3: Recheck
    DBMS_OUTPUT.PUT_LINE('3. Testing prc_recheck_alert (Report 4):');
    prc_recheck_alert(4);
    
    -- Test 4: Trigger
    DBMS_OUTPUT.PUT_LINE('4. Testing trigger with new report:');
    INSERT INTO crop_report (farmer_id, crop_type, symptoms)
    VALUES (10, 'Maize', 'Yellow leaves with brown spots');
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('=== All tests completed ===');
END;
/