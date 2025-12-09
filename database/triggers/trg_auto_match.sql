CREATE OR REPLACE TRIGGER trg_auto_match
AFTER INSERT ON crop_report
FOR EACH ROW
DECLARE
    v_report_id NUMBER;
BEGIN
    v_report_id := :NEW.report_id;

    -- Call the procedure to match disease
    prc_match_disease(v_report_id);

EXCEPTION
    WHEN OTHERS THEN
        -- Log any error that occurs
        prc_log_error('CROP_REPORT', 'TRG_AUTO_MATCH', USER,
                      'Trigger failed for report ' || v_report_id || ' | ' || SQLERRM);
END trg_auto_match;
/
