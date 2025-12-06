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

                             