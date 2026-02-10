-- --------------------------------------------------------------------------------------------------------------------------
-- DDD SBI.1.15
-- --------------------------------------------------------------------------------------------------------------------------
alter table cms_card.card_benefit_token_primary add current_status_code varchar( 2 );
alter table cms_card.card_benefit_token_primary add provisioning_status_code varchar( 2 );

ALTER TABLE cms_card.mastercard_token_request_activation_methods ADD (temp_col VARCHAR2(4000));
UPDATE cms_card.mastercard_token_request_activation_methods SET temp_col = DBMS_LOB.SUBSTR(token_unique_reference, 4000, 1);
ALTER TABLE cms_card.mastercard_token_request_activation_methods DROP COLUMN token_unique_reference;
ALTER TABLE cms_card.mastercard_token_request_activation_methods RENAME COLUMN temp_col TO token_unique_reference;
