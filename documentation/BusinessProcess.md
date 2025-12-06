# BUSINESS PROCESS DOCUMENTATION
## Name: MUHAMMAD AHMAD
## ID: 25776

### Business Process Explanation:

The Crop Disease Alert Database supports the process of identifying crop diseases based on farmer-reported symptoms. Farmers report symptoms for their crops through a simple data entry channel handled by extension officers or digital systems. Once a report is submitted, the system validates the data and stores it. A PL/SQL trigger immediately calls a disease-matching function, which compares the reported symptoms with known disease keywords stored in the DISEASES table. Based on the match, the system automatically generates an alert that indicates whether a disease was detected and whether it is high-risk.

Extension officers review alerts to provide guidance to farmers. Administrators maintain the DISEASES database by adding new diseases or updating symptoms and treatments. The system also includes audit logging and operational restrictions to ensure data integrity and adherence to organizational rules. Analytics generated from accumulated reports support decision-making by highlighting disease trends, hotspots, and resource needs.
