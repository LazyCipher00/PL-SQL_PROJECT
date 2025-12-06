/*
-- Tablespace configuration documentation
-- Note: Oracle XE has limited tablespace control
-- In production environment, you would use:

CREATE TABLESPACE crop_data
    DATAFILE 'crop_data01.dbf' SIZE 100M
    AUTOEXTEND ON NEXT 50M MAXSIZE 1G;

CREATE TABLESPACE crop_index
    DATAFILE 'crop_index01.dbf' SIZE 50M
    AUTOEXTEND ON NEXT 25M MAXSIZE 500M;

-- For XE, we use existing USERS tablespace
*/
SELECT 'Using default USERS tablespace for Oracle XE' AS configuration FROM dual;