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