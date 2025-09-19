..

SELECT 
    cu.cbs_customer_id,
    cu.customer_id,
    cu.customer_full_name,
    cu.mobile_number1,
    cu.email,
    c.pan_encrypt,
    c.card_program_code,
    ca.cbs_account_number
FROM customer cu
JOIN card c 
    ON cu.customer_id = c.customer_id
JOIN customer_account ca 
    ON cu.customer_id = ca.customer_id
WHERE 
  (cu.mobile_number1 = '8879699158' OR cu.mobile_number2 = '8879699158')
  AND cu.tenant_code = 'SBI'
  AND c.card_status IN ('1','0')
  AND c.green_pin != 'Y'
  AND ca.account_sequence_no = 1;