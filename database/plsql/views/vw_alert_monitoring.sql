-- View: vw_alert_monitoring


CREATE OR REPLACE VIEW vw_alert_monitoring AS
SELECT 
    al.alert_id,
    al.report_id,
    cr.farmer_id,
    f.full_name AS farmer_name,
    f.location,
    d.disease_name,
    al.alert_status,
    al.severity,
    al.alert_date,
    cr.crop_type,
    cr.symptoms,
    d.treatment AS recommended_treatment,
    CASE 
        WHEN al.alert_date >= SYSDATE - 1 THEN 'RECENT'
        WHEN al.alert_date >= SYSDATE - 7 THEN 'WEEK_OLD'
        ELSE 'HISTORICAL'
    END AS alert_age
FROM alert_log al
JOIN crop_report cr ON al.report_id = cr.report_id
JOIN farmer f ON cr.farmer_id = f.farmer_id
LEFT JOIN diseases d ON al.disease_id = d.disease_id
ORDER BY al.alert_date DESC;