/*
-- PDB setup for Container Database (CDB)
-- For Oracle XE non-CDB, this is not applicable

CREATE PLUGGABLE DATABASE cropdb
    ADMIN USER cropadmin IDENTIFIED BY "Admin123"
    FILE_NAME_CONVERT = ('pdbseed', 'cropdb');

ALTER PLUGGABLE DATABASE cropdb OPEN;
ALTER SESSION SET CONTAINER = cropdb;


*/
SELECT 'Oracle XE detected - using default database configuration' AS note FROM dual;