-- Business Intelligence Analytical Queries
SET PAGESIZE 100;
SET LINESIZE 150;

-- 1. Monthly Disease Trends
SELECT '1. MONTHLY DISEASE TRENDS' AS report_title FROM dual;
SELECT 
    TO_CHAR(alert_date, 'YYYY-MM') AS month,
    d.crop_type,
    d.disease_name,
    COUNT(*) AS occurrence_count,
    ROUND(AVG(CASE WHEN al.severity = 'HIGH' THEN 1 ELSE 0 END) * 100, 2) AS high_severity_pct
FROM alert_log al
JOIN diseases d ON al.disease_id = d.disease_id
WHERE al.alert_status = 'MATCH_FOUND'
    AND al.alert_date >= ADD_MONTHS(SYSDATE, -6)
GROUP BY TO_CHAR(alert_date, 'YYYY-MM'), d.crop_type, d.disease_name
ORDER BY month DESC, occurrence_count DESC;

-- 2. Regional Disease Hotspots
SELECT '2. REGIONAL DISEASE HOTSPOTS' AS report_title FROM dual;
SELECT 
    f.location,
    d.crop_type,
    d.disease_name,
    COUNT(*) AS total_cases,
    COUNT(DISTINCT f.farmer_id) AS affected_farmers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY f.location), 2) AS location_percentage
FROM alert_log al
JOIN crop_report cr ON al.report_id = cr.report_id
JOIN farmer f ON cr.farmer_id = f.farmer_id
JOIN diseases d ON al.disease_id = d.disease_id
WHERE al.alert_status = 'MATCH_FOUND'
    AND al.alert_date >= SYSDATE - 90
GROUP BY f.location, d.crop_type, d.disease_name
ORDER BY total_cases DESC;

-- 3. Farmer Reporting Patterns
SELECT '3. FARMER REPORTING PATTERNS' AS report_title FROM dual;
SELECT 
    CASE 
        WHEN report_count >= 10 THEN 'High (10+ reports)'
        WHEN report_count >= 5 THEN 'Medium (5-9 reports)'
        WHEN report_count >= 1 THEN 'Low (1-4 reports)'
        ELSE 'Inactive'
    END AS activity_level,
    COUNT(*) AS farmer_count,
    ROUND(AVG(report_count), 2) AS avg_reports,
    SUM(report_count) AS total_reports
FROM (
    SELECT 
        f.farmer_id,
        COUNT(cr.report_id) AS report_count
    FROM farmer f
    LEFT JOIN crop_report cr ON f.farmer_id = cr.farmer_id
    GROUP BY f.farmer_id
)
GROUP BY 
    CASE 
        WHEN report_count >= 10 THEN 'High (10+ reports)'
        WHEN report_count >= 5 THEN 'Medium (5-9 reports)'
        WHEN report_count >= 1 THEN 'Low (1-4 reports)'
        ELSE 'Inactive'
    END
ORDER BY farmer_count DESC;

-- 4. System Performance Metrics
SELECT '4. SYSTEM PERFORMANCE METRICS' AS report_title FROM dual;
SELECT 
    TO_CHAR(operation_date, 'YYYY-MM-DD') AS operation_day,
    operation_type,
    status,
    COUNT(*) AS operation_count,
    ROUND(AVG(CASE WHEN error_message IS NOT NULL THEN 1 ELSE 0 END) * 100, 2) AS error_rate_pct
FROM audit_log
WHERE operation_date >= SYSDATE - 30
GROUP BY TO_CHAR(operation_date, 'YYYY-MM-DD'), operation_type, status
ORDER BY operation_day DESC, operation_type;

-- 5. Disease Severity Analysis
SELECT '5. DISEASE SEVERITY ANALYSIS' AS report_title FROM dual;
SELECT 
    d.disease_name,
    d.crop_type,
    d.risk_level AS expected_risk,
    al.severity AS actual_severity,
    COUNT(*) AS occurrence_count,
    MIN(al.alert_date) AS first_occurrence,
    MAX(al.alert_date) AS last_occurrence
FROM alert_log al
JOIN diseases d ON al.disease_id = d.disease_id
WHERE al.alert_status = 'MATCH_FOUND'
GROUP BY d.disease_name, d.crop_type, d.risk_level, al.severity
ORDER BY occurrence_count DESC;

-- 6. Time-based Analysis
SELECT '6. TIME-BASED ANALYSIS (Last 7 Days)' AS report_title FROM dual;
SELECT 
    TO_CHAR(al.alert_date, 'DY') AS day_of_week,
    EXTRACT(HOUR FROM al.alert_date) AS hour_of_day,
    COUNT(*) AS alert_count,
    ROUND(AVG(CASE WHEN al.severity = 'HIGH' THEN 1 ELSE 0 END) * 100, 2) AS high_severity_pct
FROM alert_log al
WHERE al.alert_date >= SYSDATE - 7
GROUP BY TO_CHAR(al.alert_date, 'DY'), EXTRACT(HOUR FROM al.alert_date)
ORDER BY day_of_week, hour_of_day;