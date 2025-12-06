                    NORMALIZED DATA STRUCTURE (3NF)
Table 1: FARMER

farmer_id (PK)
full_name
location
phone
registration_date

EXPLANATION: No repeating groups, no composite fields, no transitive dependencies → 3NF.

Table 2: CROP_REPORT

report_id (PK)
farmer_id (FK → FARMER.farmer_id)
crop_type
symptoms
report_date (default SYSDATE)

EXPLANATION: Symptom text belongs only to the report → 3NF.

Table 3: DISEASES

disease_id (PK)
crop_type
symptom_keywords
treatment
risk_level (“NORMAL”/“HIGH”)

EXPLANATION: Symptoms are reference keywords → 3NF.

 Table 4: ALERT_LOG

alert_id (PK)
report_id (FK → CROP_REPORT.report_id)
disease_id (FK → DISEASES.disease_id, NULL if no match)
alert_status (“MATCH FOUND”, “NO MATCH”)
severity (“NORMAL”, “CRITICAL”)
alert_date

EXPLANATION: Clean output table → 3NF.

Table 5: AUDIT_LOG

audit_id (PK)
operation_type
table_name
user_name
operation_date
status
error_message

 EXPLANATION: Used for restriction rules + exceptions logging.