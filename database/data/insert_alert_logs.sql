-- ============================================
-- BATCH 4: INSERT 100 ALERT LOGS
-- ============================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('Inserting 100 alert logs...');
END;
/

DECLARE
    v_report_id NUMBER;
    v_disease_id NUMBER;
    v_alert_status VARCHAR2(20);
    v_severity VARCHAR2(10);
BEGIN
    FOR i IN 1..100 LOOP
        -- Report ID matches crop report ID (1-100)
        v_report_id := i;
        
        -- Disease ID: Sometimes match, sometimes no match
        IF MOD(i, 7) = 0 THEN
            -- No match (15% of cases)
            v_disease_id := NULL;
            v_alert_status := 'NO_MATCH';
            v_severity := 'LOW';
        ELSE
            -- Match found (85% of cases)
            v_disease_id := MOD(i, 30) + 1;  -- Disease ID 1-30
            v_alert_status := 'MATCH_FOUND';
            
            -- Determine severity
            CASE MOD(i, 3)
                WHEN 0 THEN v_severity := 'HIGH';
                WHEN 1 THEN v_severity := 'MEDIUM';
                WHEN 2 THEN v_severity := 'LOW';
            END CASE;
        END IF;
        
        -- Insert alert log
        INSERT INTO alert_log (report_id, disease_id, alert_status, severity, alert_date)
        VALUES (
            v_report_id,
            v_disease_id,
            v_alert_status,
            v_severity,
            SYSDATE - MOD(i, 15) + 1  -- Alerts from last 15 days
        );
        
        -- Show progress
        IF MOD(i, 25) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('   Inserted ' || i || ' alert logs...');
        END IF;
    END LOOP;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('✅ BATCH 4 COMPLETE: 100 alert logs inserted');
END;
/