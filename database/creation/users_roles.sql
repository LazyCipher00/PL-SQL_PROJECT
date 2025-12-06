-- Create project user
CREATE USER crop_user IDENTIFIED BY ahmad;

-- Grant basic privileges
GRANT CONNECT, RESOURCE TO crop_user;

-- Grant specific privileges needed for project
GRANT CREATE SESSION, CREATE TABLE TO crop_user;
GRANT CREATE TRIGGER, CREATE PROCEDURE TO crop_user;
GRANT CREATE VIEW, CREATE SEQUENCE TO crop_user;
GRANT CREATE TYPE, CREATE SYNONYM TO crop_user;

-- Allow data dictionary access for debugging
GRANT SELECT ANY DICTIONARY TO crop_user;

-- Verify
SELECT 'User CROP_USER created successfully' AS status FROM dual;