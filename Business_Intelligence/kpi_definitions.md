# Key Performance Indicators (KPIs)
# Crop Disease Alert System

## 1. Operational KPIs

### 1.1 Alert Response Time
- **Definition**: Time between crop report submission and alert generation
- **Target**: < 5 seconds
- **Formula**: AVG(alert_date - report_date)
- **Data Source**: CROP_REPORT, ALERT_LOG

### 1.2 Disease Match Accuracy
- **Definition**: Percentage of reports correctly matched to diseases
- **Target**: > 85%
- **Formula**: (MATCH_FOUND alerts / Total alerts) * 100
- **Data Source**: ALERT_LOG

### 1.3 System Uptime
- **Definition**: Percentage of time system is operational
- **Target**: 99.5%
- **Formula**: (Total time - Downtime) / Total time * 100
- **Data Source**: AUDIT_LOG

## 2. Agricultural KPIs

### 2.1 Disease Prevalence Rate
- **Definition**: Number of disease occurrences per crop type
- **Target**: Monitor for spikes
- **Formula**: COUNT(alerts) per crop_type per time_period
- **Data Source**: DISEASES, ALERT_LOG

### 2.2 High-Risk Alert Percentage
- **Definition**: Percentage of alerts with HIGH severity
- **Target**: < 30% (lower is better)
- **Formula**: (HIGH severity alerts / Total alerts) * 100
- **Data Source**: ALERT_LOG

### 2.3 Farmer Engagement Rate
- **Definition**: Percentage of farmers submitting reports
- **Target**: > 60%
- **Formula**: (Farmers with reports / Total farmers) * 100
- **Data Source**: FARMER, CROP_REPORT

## 3. Technical KPIs

### 3.1 Database Performance
- **Query Response Time**: < 100ms for 95% of queries
- **Table Size Growth**: < 10% monthly
- **Index Efficiency**: > 90% index usage

### 3.2 Error Rate
- **Definition**: Percentage of failed operations
- **Target**: < 1%
- **Formula**: (FAILED operations / Total operations) * 100
- **Data Source**: AUDIT_LOG

## 4. Compliance KPIs

### 4.1 Data Completeness
- **Target**: 100% required fields populated
- **Monitoring**: Daily validation checks

### 4.2 Audit Trail Coverage
- **Target**: 100% of critical operations logged
- **Monitoring**: Review AUDIT_LOG coverage