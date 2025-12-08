-- ============================================
--  INSERT 50 FARMERS
-- ============================================

SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 50 farmers with Rwandan and Nigerian names...');
END;
/

-- Rwandan Names
INSERT INTO farmer (full_name, location, phone) VALUES ('Jean de Dieu Uwimana', 'Kigali', '0781234501');
INSERT INTO farmer (full_name, location, phone) VALUES ('Marie Claire Mukamana', 'Northern Province', '0781234502');
INSERT INTO farmer (full_name, location, phone) VALUES ('Emmanuel Habimana', 'Southern Province', '0781234503');
INSERT INTO farmer (full_name, location, phone) VALUES ('Ange Ingabire', 'Eastern Province', '0781234504');
INSERT INTO farmer (full_name, location, phone) VALUES ('Pacifique Niyonsenga', 'Western Province', '0781234505');
INSERT INTO farmer (full_name, location, phone) VALUES ('Aline Uwase', 'Kigali', '0781234506');
INSERT INTO farmer (full_name, location, phone) VALUES ('Eric Nkurunziza', 'Northern Province', '0781234507');
INSERT INTO farmer (full_name, location, phone) VALUES ('Chantal Mutesi', 'Southern Province', '0781234508');
INSERT INTO farmer (full_name, location, phone) VALUES ('Fabrice Ndayisaba', 'Eastern Province', '0781234509');
INSERT INTO farmer (full_name, location, phone) VALUES ('Gloria Mukamusoni', 'Western Province', '0781234510');

-- Nigerian Yoruba Names
INSERT INTO farmer (full_name, location, phone) VALUES ('Adebola Johnson', 'Lagos State', '0801234501');
INSERT INTO farmer (full_name, location, phone) VALUES ('Folake Adewale', 'Oyo State', '0801234502');
INSERT INTO farmer (full_name, location, phone) VALUES ('Chinedu Okoro', 'Imo State', '0801234503');
INSERT INTO farmer (full_name, location, phone) VALUES ('Ngozi Eze', 'Enugu State', '0801234504');
INSERT INTO farmer (full_name, location, phone) VALUES ('Oluwaseun Balogun', 'Ogun State', '0801234505');
INSERT INTO farmer (full_name, location, phone) VALUES ('Chiamaka Nwachukwu', 'Anambra State', '0801234506');
INSERT INTO farmer (full_name, location, phone) VALUES ('Emeka Okafor', 'Delta State', '0801234507');
INSERT INTO farmer (full_name, location, phone) VALUES ('Aisha Bello', 'Kano State', '0801234508');
INSERT INTO farmer (full_name, location, phone) VALUES ('Yusuf Abdullahi', 'Kaduna State', '0801234509');
INSERT INTO farmer (full_name, location, phone) VALUES ('Fatima Shehu', 'Katsina State', '0801234510');

-- Nigerian Hausa Names
INSERT INTO farmer (full_name, location, phone) VALUES ('Ibrahim Musa', 'Sokoto State', '0811234501');
INSERT INTO farmer (full_name, location, phone) VALUES ('Hauwa Adamu', 'Zamfara State', '0811234502');
INSERT INTO farmer (full_name, location, phone) VALUES ('Sani Mohammed', 'Jigawa State', '0811234503');
INSERT INTO farmer (full_name, location, phone) VALUES ('Amina Lawal', 'Kebbi State', '0811234504');
INSERT INTO farmer (full_name, location, phone) VALUES ('Bello Ibrahim', 'Bauchi State', '0811234505');
INSERT INTO farmer (full_name, location, phone) VALUES ('Zainab Usman', 'Gombe State', '0811234506');
INSERT INTO farmer (full_name, location, phone) VALUES ('Kabiru Sani', 'Yobe State', '0811234507');
INSERT INTO farmer (full_name, location, phone) VALUES ('Mariam Abubakar', 'Borno State', '0811234508');
INSERT INTO farmer (full_name, location, phone) VALUES ('Aliyu Ahmed', 'Plateau State', '0811234509');
INSERT INTO farmer (full_name, location, phone) VALUES ('Halima Yusuf', 'Nasarawa State', '0811234510');

-- More Mixed African Names
INSERT INTO farmer (full_name, location, phone) VALUES ('Kwame Nkrumah', 'Ashanti Region', '0241234501');
INSERT INTO farmer (full_name, location, phone) VALUES ('Ama Serwaa', 'Eastern Region', '0241234502');
INSERT INTO farmer (full_name, location, phone) VALUES ('Kofi Mensah', 'Western Region', '0241234503');
INSERT INTO farmer (full_name, location, phone) VALUES ('Abena Konadu', 'Central Region', '0241234504');
INSERT INTO farmer (full_name, location, phone) VALUES ('Yaw Boateng', 'Volta Region', '0241234505');
INSERT INTO farmer (full_name, location, phone) VALUES ('Akosua Agyeman', 'Northern Region', '0241234506');
INSERT INTO farmer (full_name, location, phone) VALUES ('Esi Fremah', 'Brong-Ahafo', '0241234507');
INSERT INTO farmer (full_name, location, phone) VALUES ('Kojo Asante', 'Upper East', '0241234508');
INSERT INTO farmer (full_name, location, phone) VALUES ('Adwoa Safo', 'Upper West', '0241234509');
INSERT INTO farmer (full_name, location, phone) VALUES ('Kwabena Osei', 'Greater Accra', '0241234510');

-- Tanzanian Names
INSERT INTO farmer (full_name, location, phone) VALUES ('Juma Mohamed', 'Dar es Salaam', '0751234501');
INSERT INTO farmer (full_name, location, phone) VALUES ('Neema Charles', 'Arusha', '0751234502');
INSERT INTO farmer (full_name, location, phone) VALUES ('Rajabu Mwinyi', 'Zanzibar', '0751234503');
INSERT INTO farmer (full_name, location, phone) VALUES ('Fatuma Hassan', 'Mwanza', '0751234504');
INSERT INTO farmer (full_name, location, phone) VALUES ('Salum Juma', 'Tanga', '0751234505');
INSERT INTO farmer (full_name, location, phone) VALUES ('Asha Rashid', 'Morogoro', '0751234506');
INSERT INTO farmer (full_name, location, phone) VALUES ('Omar Said', 'Dodoma', '0751234507');
INSERT INTO farmer (full_name, location, phone) VALUES ('Zahara Ali', 'Mbeya', '0751234508');
INSERT INTO farmer (full_name, location, phone) VALUES ('Hamisi Rajab', 'Singida', '0751234509');
INSERT INTO farmer (full_name, location, phone) VALUES ('Rehema Kondo', 'Iringa', '0751234510');

COMMIT;
SELECT ' COMPLETE: 50 farmers inserted' AS status FROM dual;