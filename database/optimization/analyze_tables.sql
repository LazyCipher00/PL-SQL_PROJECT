-- Table Statistics Analysis
-- Location: database/phase_vii_advanced/optimization/

BEGIN
    -- Gather statistics for all tables
    DBMS_STATS.GATHER_TABLE_STATS(ownname => USER, tabname => 'FARMER', estimate_percent => 20);
    DBMS_STATS.GATHER_TABLE_STATS(ownname => USER, tabname => 'DISEASES', estimate_percent => 20);
    DBMS_STATS.GATHER_TABLE_STATS(ownname => USER, tabname => 'CROP_REPORT', estimate_percent => 20);
    DBMS_STATS.GATHER_TABLE_STATS(ownname => USER, tabname => 'ALERT_LOG', estimate_percent => 20);
    DBMS_STATS.GATHER_TABLE_STATS(ownname => USER, tabname => 'AUDIT_LOG', estimate_percent => 20);
    
    DBMS_OUTPUT.PUT_LINE('Table statistics updated successfully.');
END;
/