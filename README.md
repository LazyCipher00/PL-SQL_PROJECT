# Crop Disease Alert System - Database Project

##  Project Overview
A comprehensive PL/SQL-based database system for managing crop disease detection and alert generation. The system enables farmers to report crop symptoms, automatically matches them with known diseases, and generates alerts for extension officers.



##  Student Information
| **Field** | **Details** |
|-----------|------------|
| **Student Name** | MUHAMMAD AHMAD |
| **Student ID** | 25776 |
| **Group** | C (Wednesday) |
| **Course** | PL/SQL Programming |
| **Lecturer** | ERIC MANIRAGUHA |
| **Project Type** | Database Management System |
| **Database** | Oracle 19c |



##  Project Objectives
1. Design and implement a relational database for crop disease management
2. Develop automated disease detection using PL/SQL logic
3. Create real-time alert generation system
4. Implement comprehensive error handling and audit logging
5. Provide analytical reporting capabilities



##  Project Structure

crop-disease-alert-db/
│
├── database/                          # Database Implementation
│   ├── creation/                      # Phase IV: Database Setup
│   │   ├── pdb_setup.sql              # PDB Configuration
│   │   ├── users_roles.sql            # User & Privileges
│   │   └── tablespaces.sql            # Tablespace Setup
│   │
│   ├── tables/                        # Table Definitions
│   │   ├── create_farmers.sql         # Farmer table
│   │   ├── create_crop_reports.sql    # Crop Report table
│   │   ├── create_diseases.sql        # Diseases table
│   │   ├── create_alert_log.sql       # Alert Log table
│   │   └── create_audit_log.sql       # Audit Log table
│   │
│   ├── data/                          # Phase V: Sample Data
│   │   ├── insert_farmers.sql         # 50 Farmer records
│   │   ├── insert_diseases.sql        # 30 Disease records
│   │   ├── insert_crop_reports.sql    # 100 Crop Report records
│   │   ├── insert_alert_logs.sql      # 100 Alert records
│   │   ├── insert_audit_logs.sql      # 50 Audit records
│   │   └── bulk_insert_verification.sql
│   │
│   ├── plsql/                         # Phase VI: PL/SQL Logic
│   │   ├── functions/
│   │   │   └── fn_get_severity.sql    # Severity calculation
│   │   │
│   │   ├── procedures/
│   │   │   ├── prc_match_disease.sql  # Main matching engine
│   │   │   ├── prc_recheck_alert.sql  # Manual re-evaluation
│   │   │   └── prc_log_error.sql      # Error handling
│   │   │
│   │   ├── packages/
│   │   │   ├── disease_pkg.spec.sql   # Package specification
│   │   │   └── disease_pkg.body.sql   # Package implementation
│   │   │
│   │   └── views/                     # Phase VII: Reporting Views
│   │       ├── vw_farmer_dashboard.sql
│   │       ├── vw_disease_statistics.sql
│   │       ├── vw_alert_monitoring.sql
│   │       └── vw_system_audit.sql
│   │
│   ├── triggers/                      # Automation
│   │   └── trg_auto_match.sql         # Automatic disease matching
│   │
│   ├── optimization/                  # Performance
│   │   ├── create_indexes.sql         # Performance indexes
│   │   └── analyze_tables.sql         # Statistics gathering
│   │
│   └── testing/                       # Testing Suite
│       ├── test_functions.sql
│       ├── test_procedures.sql
│       ├── test_triggers.sql
│       ├── test_views.sql
│       └── validation_queries.sql
│
├── documentation/                     # Project Documentation
│   ├── business_process.md            # BPMN Workflow
│   ├── er_diagram.png                 # Entity Relationship Diagram
│   ├── data_dictionary.md             # Table Specifications
│   └── assumptions.md                 # Project Assumptions
│
├── business_intelligence/             # Analytics & Reporting
│   ├── kpi_definitions.md            # Key Performance Indicators
│   ├── dashboard_mockups.png         # Dashboard Designs
│   └── analytical_queries.sql        # Business Intelligence Queries
│
├── screenshots/                       # Execution Proof
│   ├── phase_iv_tables/              # Table Creation
│   ├── phase_v_data/                 # Data Insertion
│   ├── phase_vi_plsql/               # PL/SQL Components
│   └── phase_vii_advanced/           # Advanced Features
│
├── presentation/                      # Presentation Materials
│   └── Crop_Disease_Alert_DB_Presentation.pptx
│
└── README.md                          # This File


##  Entity Relationship Diagram

    FARMER (1) -----< (M) CROP_REPORT (1) -----< (1) ALERT_LOG
                                |
                                |
                                V
                            DISEASES (1) ----< ALERT_LOG (M)

    AUDIT_LOG (standalone) – logs system actions and errors


### Relationships:
1. **One-to-Many**: Farmer → Crop Reports (One farmer submits many reports)
2. **One-to-One**: Crop Report → Alert Log (Each report generates one alert)
3. **One-to-Many**: Diseases → Alert Log (One disease appears in many alerts)
4. **Standalone**: Audit Log (System-generated audit trail)



##  Database Schema

### Core Tables:
1. **FARMER** - Farmer information (50 records)
2. **DISEASES** - Disease database (30 records)
3. **CROP_REPORT** - Symptom reports (100 records)
4. **ALERT_LOG** - Generated alerts (100 records)
5. **AUDIT_LOG** - System audit trail (50+ records)

### Total Records: 330+ realistic records



##  PL/SQL Components

### **Functions:**
1. **`fn_get_severity()`** - Returns disease severity level based on risk_level

### **Procedures:**
1. **`prc_match_disease()`** - Main disease matching engine
2. **`prc_recheck_alert()`** - Manual alert re-evaluation
3. **`prc_log_error()`** - Centralized error logging

### **Package:**
1. **`disease_pkg`** - Organized package with all business logic

### **Trigger:**
1. **`trg_auto_match`** - Automatic disease matching on new reports

### **Views:**
1. **`vw_farmer_dashboard`** - Farmer reporting summary
2. **`vw_disease_statistics`** - Disease analysis
3. **`vw_alert_monitoring`** - Real-time alert tracking
4. **`vw_system_audit`** - System operation audit







##  Business Intelligence

### Key Performance Indicators:
- Alert Response Time: < 5 seconds
- Disease Match Accuracy: > 85%
- System Uptime: 99.5%
- High-Risk Alerts: < 30%



##  Technical Features

### Performance Optimization:
- Strategic indexes on frequently queried columns
- Regular statistics gathering
- Efficient view materialization

### Error Handling:
- Comprehensive audit logging
- Centralized error procedure
- Transaction rollback on failures

### Security:
- Principle of least privilege
- Audit trail for all operations
- Input validation and sanitization



##  Academic Compliance

### **Project Requirements Met:**
- ✅ Database design with proper normalization
- ✅ PL/SQL programming (functions, procedures, packages, triggers)
- ✅ Data manipulation (DML operations)
- ✅ Advanced features (views, indexes, optimization)
- ✅ Comprehensive testing and validation
- ✅ Professional documentation
- ✅ Realistic sample data



##  Acknowledgments

### Special Thanks:
- **Lecturer**: Eric Maniraguha for guidance and instruction
- **Oracle Corporation**: For providing database technology
- **Open Source Community**: For educational resources

### References:
- Oracle Database 19c Documentation
- PL/SQL Programming Best Practices
- Agricultural extension service models
- Disease detection algorithms

---

## **📞 Contact Information**

**Student:** Muhammad Ahmad  
**Email:** [ahmadmago61@gmail.com]  
**Student ID:** 25776  
**Group:** C (Wednesday)  
**Institution:** [ADVENTIST UNIVERSITY OF CENTRAL AFRICA]  
**Course:** PL/SQL Programming  
**Academic Year:** 2024-2025  



##  License

This project is for **academic purposes only** as part of PL/SQL coursework. All code and documentation are original work created for educational evaluation.

---

##  Verification

All components have been:
- ✅ Successfully compiled in Oracle Database
- ✅ Tested with sample data
- ✅ Validated for functionality
- ✅ Documented with screenshots
- ✅ Organized in professional structure


Last Updated: December 2024 
Oracle Database Version: 19c  
Project Duration: 2 Weeks  
Lines of Code: 1500*  
Database Objects: 20+