NORMALIZED DATA STRUCTURE (3NF)

Table 1: FARMER
| Column             | Description            |
|--------------------|------------------------|
| farmer_id (PK)     | Primary key            |
| full_name          | Farmer full name       |
| location           | Village/Sector/District|
| phone              | Contact number         |
| registration_date  | Date registered        |
EXPLANATION: No repeating groups, no composite fields, no transitive dependencies → 3NF.

Table 2: CROP_REPORT
| Column                    | Description                     |
|---------------------------|---------------------------------|
| report_id (PK)            | Primary key                     |
| farmer_id (FK → FARMER)   | Links to farmer                 |
| crop_type                 | Type of crop                    |
| symptoms                  | Reported symptoms               |
| report_date               | Auto timestamp (SYSDATE)        |
EXPLANATION: Symptom text belongs only to the report → 3NF

Table 3: DISEASES
| Column            | Description                         |
|-------------------|-------------------------------------|
| disease_id (PK)   | Primary key                         |
| crop_type         | Crop affected                       |
| symptom_keywords  | Matching keywords                   |
| treatment         | Recommended treatment               |
| risk_level        | NORMAL / HIGH                       |
EXPLANATION: Symptoms are reference keywords → 3NF.

Table 4: ALERT_LOG
| Column                                       | Description                    |
|----------------------------------------------|--------------------------------|
| alert_id (PK)                                | Primary key                    |
| report_id (FK → CROP_REPORT.report_id)       | Source report                  |
| disease_id (FK → DISEASES.disease_id, NULL)  | Matched disease or none        |
| alert_status                                  | MATCH FOUND / NO MATCH         |
| severity                                      | NORMAL / CRITICAL              |
| alert_date                                    | Date of alert                  |
EXPLANATION: Clean output table → 3NF.

Table 5: AUDIT_LOG
| Column          | Description                    |
|-----------------|--------------------------------|
| audit_id (PK)   | Primary key                    |
| operation_type  | INSERT, UPDATE, DELETE         |
| table_name      | Affected table                 |
| user_name       | Oracle user                    |
| operation_date  | Timestamp                      |
| status          | SUCCESS / FAILED               |
| error_message   | Error details (if any)         |
EXPLANATION: Used for restriction rules and exception logging.







DATA DICTIONARY
                                 
 
 
 
 FARMER                         
    | Column             | Type             | Constraints        | Description                  |
|--------------------|------------------|--------------------|------------------------------|
| farmer_id          | NUMBER           | PK                 | Unique farmer ID             |
| full_name          | VARCHAR2(100)    | NOT NULL           | Farmer name                  |
| location           | VARCHAR2(100)    | NOT NULL           | Village/sector/district      |
| phone              | VARCHAR2(20)     | UNIQUE             | Contact number               |
| registration_date  | DATE             | DEFAULT SYSDATE    | When farmer was registered   |

CROP_REPORT
| Column        | Type            | Constraints        | Description             |
|---------------|-----------------|--------------------|-------------------------|
| report_id     | NUMBER          | PK                 | Unique report ID        |
| farmer_id     | NUMBER          | FK → FARMER        | Who reported            |
| crop_type     | VARCHAR2(50)    | NOT NULL           | Type of crop            |
| symptoms      | VARCHAR2(500)   | NOT NULL           | Symptom description     |
| report_date   | DATE            | DEFAULT SYSDATE    | Auto timestamp          |

DISEASES
| Column           | Type             | Constraints                                                | Description                   |
|------------------|------------------|------------------------------------------------------------|-------------------------------|
| disease_id        | NUMBER           | PK                                                         | Unique disease ID             |
| crop_type         | VARCHAR2(50)     | NOT NULL                                                   | Crop type affected            |
| symptom_keywords  | VARCHAR2(300)    | NOT NULL                                                   | Keywords used for matching    |
| treatment         | VARCHAR2(500)    | NOT NULL                                                   | Recommended treatment         |
| risk_level        | VARCHAR2(10)     | CHECK (risk_level IN ('NORMAL','HIGH'))                   | Severity category             |

ALERT_LOG
| Column       | Type             | Constraints                                         | Description               |
|--------------|------------------|-----------------------------------------------------|---------------------------|
| alert_id     | NUMBER           | PK                                                  | Unique alert ID           |
| report_id    | NUMBER           | FK → CROP_REPORT                                    | Source report             |
| disease_id   | NUMBER           | FK → DISEASES (NULL allowed)                        | Matched disease if any    |
| alert_status | VARCHAR2(20)     | NOT NULL                                            | MATCH FOUND / NO MATCH    |
| severity     | VARCHAR2(10)     | CHECK (severity IN ('NORMAL','CRITICAL'))           | Alert level               |
| alert_date   | DATE             | DEFAULT SYSDATE                                     | When alert was created    |

AUDIT_LOG
| Column          | Type            | Constraints         | Description                 |
|-----------------|-----------------|---------------------|-----------------------------|
| audit_id        | NUMBER          | PK                  | Unique audit ID             |
| operation_type  | VARCHAR2(20)    | NOT NULL            | INSERT/UPDATE/DELETE        |
| table_name      | VARCHAR2(50)    | NOT NULL            | Which table was affected    |
| user_name       | VARCHAR2(50)    | NOT NULL            | Oracle user                 |
| operation_date  | DATE            | DEFAULT SYSDATE     | Timestamp                   |
| status          | VARCHAR2(20)    | NOT NULL            | SUCCESS/FAILED              |
| error_message   | VARCHAR2(500)   | NULL                | Error text if failed        |



SYSTEM ASSUMPTIONS

1.Each crop report submitted by a farmer describes symptoms for one crop only.

2.Symptom matching is based on keyword comparison, not advanced text analysis or machine learning.

3.High-risk diseases are predefined by the system administrator in the DISEASES table.

4.Farmers’ phone numbers are assumed to be unique identifiers for communication purposes.

5.All data entered into the system is assumed to be verified by an extension officer, even though the system does validation.

6.One alert is generated per crop report — the system will not create multiple alerts for the same report.

7.Disease information (symptoms, treatments) is assumed to come from reliable agricultural sources. 


LOGICAL DATA MODEL EXPLANATION

The logical model is based on five core entities: FARMER, CROP_REPORT, DISEASES, ALERT_LOG, and AUDIT_LOG. Farmers submit crop reports describing symptoms, and each report can generate one alert. The DISEASES entity stores the reference data used for matching symptoms. ALERT_LOG captures automated system responses, and AUDIT_LOG records system actions and errors for compliance and tracking. All relationships follow a one-to-many structure, fully normalized to 3NF to avoid redundancy and maintain data integrity. This logical model supports automated disease detection, high-risk alerting, auditing, and future BI reporting.