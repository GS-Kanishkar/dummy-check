UPDATE cms_card.card
SET card_manufacturer_code = NULL
WHERE ROWID IN (
    SELECT ROWID
    FROM (
        SELECT ROWID
        FROM cms_card.card
        WHERE card_issuance_date = TRUNC(SYSDATE)
        ORDER BY card_id DESC
    )
    WHERE ROWNUM <= 10000
);
 
commit;