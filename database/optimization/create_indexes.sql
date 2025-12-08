-- Performance Indexes


-- Index for alert log date queries
CREATE INDEX idx_alert_log_date ON alert_log(alert_date);

-- Index for crop report farmer lookups
CREATE INDEX idx_crop_report_farmer_date ON crop_report(farmer_id, report_date);

-- Index for disease matching (crop_type + symptoms keywords)
CREATE INDEX idx_diseases_crop_symptoms ON diseases(crop_type, symptom_keywords);

-- Index for audit log operations
CREATE INDEX idx_audit_log_operations ON audit_log(operation_type, status, operation_date);

-- Index for foreign key performance
CREATE INDEX idx_alert_log_disease_fk ON alert_log(disease_id);
CREATE INDEX idx_crop_report_farmer_fk ON crop_report(farmer_id);

-- Function-based index for case-insensitive searches
CREATE INDEX idx_diseases_upper_crop ON diseases(UPPER(crop_type));