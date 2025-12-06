-- Procedure: prc_log_error
-- Purpose: Centralized error logging to audit_log
-- Author: Your Name
-- Date: DD-MON-YYYY

CREATE OR REPLACE PROCEDURE prc_log_error(
    p_table_name IN VARCHAR2,
    p_operation_type IN VARCHAR2,
    p_user_name IN VARCHAR2 DEFAULT USER,
    p_error_message IN VARCHAR2
)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT INTO audit_log (
        operation_type,
        table_name,
        user_name,
        status,
        error_message,
        operation_date
    ) VALUES (
        p_operation_type,
        p_table_name,
        p_user_name,
        'FAILED',
        p_error_message,
        SYSDATE
    );
    
    COMMIT;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
END prc_log_error;
/