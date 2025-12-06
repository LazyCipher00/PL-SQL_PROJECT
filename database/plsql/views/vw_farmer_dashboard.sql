-- View: vw_farmer_dashboard
-- Purpose: Comprehensive farmer reporting view
-- Location: database/phase_vii_advanced/views/

CREATE OR REPLACE VIEW vw_farmer_dashboard AS
SELECT 
    f.farmer_id,
    f.full_name,
    f.location,
    f.phone,
    f.registration_date,
    COUNT(DISTINCT cr.report_id) AS total_reports,
    COUNT(DISTINCT al.alert_id) AS total_alerts,
    SUM(CASE WHEN al.alert_status = 'MATCH_FOUND' THEN 1 ELSE 0 END) AS matched_alerts,
    SUM(CASE WHEN al.alert_status = 'NO_MATCH' THEN 1 ELSE 0 END) AS unmatched_alerts,
    MAX(cr.report_date) AS last_report_date,
    MAX(al.alert_date) AS last_alert_date
FROM farmer f
LEFT JOIN crop_report cr ON f.farmer_id = cr.farmer_id
LEFT JOIN alert_log al ON cr.report_id = al.report_id
GROUP BY f.farmer_id, f.full_name, f.location, f.phone, f.registration_date
ORDER BY f.farmer_id;