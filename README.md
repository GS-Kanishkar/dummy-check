Gaurang Raut need to create a function in oracle db meghdoot
 
create or replace FUNCTION    cms_card.increment_pan_serial (
    p_code IN VARCHAR2
) RETURN NUMBER
IS
    current_value NUMBER;
    PRAGMA AUTONOMOUS_TRANSACTION; 
BEGIN
    -- Lock the row for update to prevent concurrent modifications
    SELECT current_serail_no
      INTO current_value
      FROM cms_card.pan_control
     WHERE program_master_code = p_code and approved_tc = 'A'
       FOR UPDATE;
 
    -- Increment and update in the same transaction
    UPDATE cms_card.pan_control
       SET current_serail_no = current_serail_no + 1
     WHERE program_master_code = p_code and approved_tc = 'A';
 
    -- Return new value
    COMMIT;
    RETURN current_value + 1;

  