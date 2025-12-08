-- ============================================
--  INSERT 100 CROP REPORTS
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 100 crop reports...');
END;
/

-- We'll use a loop to insert 100 reports
DECLARE
    v_farmer_id NUMBER;
    v_crop_type VARCHAR2(50);
    v_symptoms VARCHAR2(500);
BEGIN
    FOR i IN 1..100 LOOP
        -- Cycle through farmer IDs 1-50
        v_farmer_id := MOD(i, 50) + 1;
        
        -- Assign crop type based on farmer ID pattern
        CASE MOD(i, 10)
            WHEN 0 THEN v_crop_type := 'Maize';
            WHEN 1 THEN v_crop_type := 'Rice';
            WHEN 2 THEN v_crop_type := 'Cassava';
            WHEN 3 THEN v_crop_type := 'Banana';
            WHEN 4 THEN v_crop_type := 'Coffee';
            WHEN 5 THEN v_crop_type := 'Tomato';
            WHEN 6 THEN v_crop_type := 'Yam';
            WHEN 7 THEN v_crop_type := 'Sorghum';
            WHEN 8 THEN v_crop_type := 'Bean';
            WHEN 9 THEN v_crop_type := 'Cabbage';
        END CASE;
        
        -- Create realistic symptoms
        CASE MOD(i, 5)
            WHEN 0 THEN v_symptoms := 'Leaves showing yellow stripes and stunted growth';
            WHEN 1 THEN v_symptoms := 'Plants wilting during daytime, poor flowering';
            WHEN 2 THEN v_symptoms := 'Brown spots appearing on leaves and stems';
            WHEN 3 THEN v_symptoms := 'White powdery substance covering plant surfaces';
            WHEN 4 THEN v_symptoms := 'Roots rotting, foul smell from soil';
        END CASE;
        
        -- Insert the report
        INSERT INTO crop_report (farmer_id, crop_type, symptoms, report_date)
        VALUES (
            v_farmer_id,
            v_crop_type,
            v_symptoms || ' - Report #' || i,
            SYSDATE - MOD(i, 30)  -- Reports from last 30 days
        );
        
        -- Show progress every 20 records
        IF MOD(i, 20) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('   Inserted ' || i || ' reports...');
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('3 COMPLETE: 100 crop reports inserted');
END;
/