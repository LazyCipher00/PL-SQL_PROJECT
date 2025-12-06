-- View: vw_disease_statistics
-- Purpose: Disease analysis and statistics
-- Location: database/phase_vii_advanced/views/

CREATE OR REPLACE VIEW vw_disease_statistics AS
SELECT 
    d.disease_id,
    d.disease_name,
    d.crop_type,
    d.risk_level,
    COUNT(al.alert_id) AS total_occurrences,
    COUNT(DISTINCT cr.farmer_id) AS affected_farmers,
    COUNT(DISTINCT f.location) AS affected_locations,
    MIN(al.alert_date) AS first_detected,
    MAX(al.alert_date) AS last_detected,
    ROUND(AVG(CASE WHEN al.severity = 'HIGH' THEN 1 ELSE 0 END) * 100, 2) AS high_severity_percentage
FROM diseases d
LEFT JOIN alert_log al ON d.disease_id = al.disease_id
LEFT JOIN crop_report cr ON al.report_id = cr.report_id
LEFT JOIN farmer f ON cr.farmer_id = f.farmer_id
GROUP BY d.disease_id, d.disease_name, d.crop_type, d.risk_level
ORDER BY total_occurrences DESC;