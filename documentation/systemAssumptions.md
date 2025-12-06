# SYSTEM ASSUMPTIONS

1.Each crop report submitted by a farmer describes symptoms for one crop only.

2.Symptom matching is based on keyword comparison, not advanced text analysis or machine learning.

3.High-risk diseases are predefined by the system administrator in the DISEASES table.

4.Farmers’ phone numbers are assumed to be unique identifiers for communication purposes.

5.All data entered into the system is assumed to be verified by an extension officer, even though the system does validation.

6.One alert is generated per crop report — the system will not create multiple alerts for the same report.

7.Disease information (symptoms, treatments) is assumed to come from reliable agricultural sources. 