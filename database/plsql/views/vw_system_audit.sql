-- View: vw_system_audit
-- Purpose: System audit and operation tracking
-- Location: database/phase_vii_advanced/views/

CREATE OR REPLACE VIEW vw_system_audit AS
SELECT 
    audit_id,
    operation_type,
    table_name,
    user_name,
    status,
    error_message,
    operation_date,
    CASE 
        WHEN status = 'SUCCESS' THEN 'GREEN'
        WHEN status = 'NO_MATCH' THEN 'YELLOW'
        WHEN status = 'FAILED' THEN 'RED'
        ELSE 'BLUE'
    END AS status_color,
    ROUND((SYSDATE - operation_date) * 24 * 60) AS minutes_ago
FROM audit_log
ORDER BY audit_id DESC;