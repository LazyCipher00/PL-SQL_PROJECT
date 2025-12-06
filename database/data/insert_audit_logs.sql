-- ============================================
-- BATCH 5: INSERT 50 AUDIT LOGS
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 50 audit logs...');
END;
/

DECLARE
    v_operations VARCHAR2(20);
    v_tables VARCHAR2(50);
    v_users VARCHAR2(50);
    v_status VARCHAR2(20);
BEGIN
    FOR i IN 1..50 LOOP
        -- Determine operation type
        CASE MOD(i, 4)
            WHEN 0 THEN v_operations := 'INSERT';
            WHEN 1 THEN v_operations := 'UPDATE';
            WHEN 2 THEN v_operations := 'DELETE';
            WHEN 3 THEN v_operations := 'SELECT';
        END CASE;
        
        -- Determine table
        CASE MOD(i, 5)
            WHEN 0 THEN v_tables := 'FARMER';
            WHEN 1 THEN v_tables := 'DISEASES';
            WHEN 2 THEN v_tables := 'CROP_REPORT';
            WHEN 3 THEN v_tables := 'ALERT_LOG';
            WHEN 4 THEN v_tables := 'AUDIT_LOG';
        END CASE;
        
        -- Determine user
        CASE MOD(i, 3)
            WHEN 0 THEN v_users := 'SYSTEM';
            WHEN 1 THEN v_users := 'C##CROP_USER';
            WHEN 2 THEN v_users := 'ADMIN';
        END CASE;
        
        -- Status (90% success, 10% error)
        IF MOD(i, 10) = 0 THEN
            v_status := 'ERROR';
        ELSE
            v_status := 'SUCCESS';
        END IF;
        
        -- Insert audit log
        INSERT INTO audit_log (
            operation_type, table_name, user_name, status,
            error_message, operation_date
        ) VALUES (
            v_operations,
            v_tables,
            v_users,
            v_status,
            CASE WHEN v_status = 'ERROR' THEN 'ORA-' || LPAD(i, 5, '0') || ': Sample error message' ELSE NULL END,
            SYSDATE - MOD(i, 60)  -- Logs from last 60 days
        );
        
        -- Show progress
        IF MOD(i, 10) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('   Inserted ' || i || ' audit logs...');
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✅ BATCH 5 COMPLETE: 50 audit logs inserted');
END;
/