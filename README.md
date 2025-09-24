UPDATE cms_card.card_limit_primary
SET
    atm_transaction_usage = 1,
    pos_transaction_usage = 1,
    ecom_transaction_usage = 0,
    nfc_transaction_usage = 0,
 
    atm_online_limit_per_day = 100,
    pos_online_limit_per_day = 100,
    ecom_online_limit_per_day = 100,
    nfc_online_limit_per_day = 100,
 
    atm_online_limit_per_transaction = 100,
    pos_online_limit_per_transaction = 100,
    ecom_online_limit_per_transaction = 100,
    nfc_online_limit_per_transaction = 100;