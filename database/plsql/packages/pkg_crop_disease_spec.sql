-- Package Specification: pkg_crop_disease
-- Purpose: Public interface for crop disease system
-- Location: database/phase_vii_advanced/packages/

CREATE OR REPLACE PACKAGE pkg_crop_disease AS
    
    -- Disease severity function
    FUNCTION get_disease_severity(p_disease_id IN NUMBER) RETURN VARCHAR2;
    
    -- Main matching procedure
    PROCEDURE process_disease_matching(p_report_id IN NUMBER);
    
    -- Alert re-evaluation
    PROCEDURE re_evaluate_alert(p_report_id IN NUMBER);
    
    -- Error logging
    PROCEDURE log_system_error(
        p_table_name IN VARCHAR2,
        p_operation_type IN VARCHAR2,
        p_user_name IN VARCHAR2 DEFAULT USER,
        p_error_message IN VARCHAR2
    );
    
    -- Report generation
    PROCEDURE generate_daily_report(p_report_date IN DATE DEFAULT SYSDATE);
    
    -- Statistics function
    FUNCTION get_system_statistics RETURN SYS_REFCURSOR;
    
    -- Constants
    c_high_risk CONSTANT VARCHAR2(10) := 'HIGH';
    c_normal_risk CONSTANT VARCHAR2(10) := 'NORMAL';
    
END pkg_crop_disease;
/