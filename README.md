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
LEFT JOIN customer_account ca 
                     ON c.customer_id = ca.customer_id 
                    LEFT JOIN card_account cardAccount 
                   ON ca.customer_account_id = cardAccount.customer_account_id
                  AND cardAccount.card_id = c.card_id and cardAccount.customer_id = cu.customer_id 
                  AND cardAccount.status_tc = 1 aND cardAccount.account_sequence_no = 1
WHERE
 
  (cu.mobile_number1 = '8879699158' OR cu.mobile_number2 = '8879699158')
 
  AND cu.tenant_code = 'SBI'
 
  AND c.card_status IN ('1','0')
 
  AND c.green_pin != 'Y';
  
  



SELECT cd.card_id,
cm.cbs_customer_id,
cm.customer_full_name,
cd.card_status,
cm.customer_id,
cm.mobile_number1 as mobile_number,
cd.card_issuance_date,
cd.card_emboss_name,
cd.card_expiry_date,
cm.customer_first_name,
cd.proxy_number,
cm.customer_last_name,
cm.email,
cd.pan_encrypt,
cd.tenant_code,
cm.identity_proof_id, cd.status_change_date, cd.card_program_code,
cm.birth_date, cd.dek_alias
,cd.non_personalized_card FROM customer cm
INNER JOIN card cd
ON cd.customer_id = cm.customer_id WHERE cm.email = 'arvindp@fsstech.com' AND cm.tenant_code ='SBI' ORDER BY cd.proxy_number DESC OFFSET 0 ROWS FETCH FIRST 10 ROWS ONLY