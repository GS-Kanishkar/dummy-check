-- ---------------------------------------------------------------------------------------------------------------------------------
-- STEP-I: CMS_CARD
-- ---------------------------------------------------------------------------------------------------------------------------------

BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', true);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', true);
END;
/
SELECT DBMS_METADATA.GET_DDL('TABLE', table_name, owner) AS table_ddl
FROM all_tables
WHERE owner = 'CMS_CARD'
ORDER BY table_name;


-- ---------------------------------------------------------------------------------------------------------------------------------
-- STEP-II: CMS_CARD_MGMT
-- ---------------------------------------------------------------------------------------------------------------------------------

BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', true);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', true);
END;
/
SELECT DBMS_METADATA.GET_DDL('TABLE', table_name, owner) AS table_ddl
FROM all_tables
WHERE owner = 'CMS_CARD_MGMT'
ORDER BY table_name;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- STEP-III: CMS_PROGRAM_CFG
-- ---------------------------------------------------------------------------------------------------------------------------------

BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', true);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', true);
END;
/
SELECT DBMS_METADATA.GET_DDL('TABLE', table_name, owner) AS table_ddl
FROM all_tables
WHERE owner = 'CMS_PROGRAM_CFG'
ORDER BY table_name;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- STEP-VI: CMS_SUPPORT
-- ---------------------------------------------------------------------------------------------------------------------------------

BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', true);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', true);
END;
/
SELECT DBMS_METADATA.GET_DDL('TABLE', table_name, owner) AS table_ddl
FROM all_tables
WHERE owner = 'CMS_SUPPORT'
ORDER BY table_name;

-- ---------------------------------------------------------------------------------------------------------------------------------
-- STEP-V: CMS_USER_ADMIN
-- ---------------------------------------------------------------------------------------------------------------------------------

BEGIN
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', false);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', true);
    DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'PRETTY', true);
END;
/
SELECT DBMS_METADATA.GET_DDL('TABLE', table_name, owner) AS table_ddl
FROM all_tables
WHERE owner = 'CMS_USER_ADMIN'
ORDER BY table_name;