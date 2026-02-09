
BEGIN
  FOR t IN (SELECT owner, table_name FROM all_tables WHERE owner like 'CMS_%') LOOP
    EXECUTE IMMEDIATE 'GRANT SELECT, INSERT, UPDATE, DELETE ON '||t.owner||'.' || t.table_name || ' TO DEV';
  END LOOP;
END;
/


BEGIN
  FOR t IN (SELECT owner, object_name FROM all_objects WHERE object_type = 'FUNCTION' and owner like 'CMS_%') LOOP
    EXECUTE IMMEDIATE 'GRANT EXECUTE ON '||t.owner||'.' || t.object_name || ' TO DEV';
  END LOOP;
END;
/


BEGIN
  FOR t IN (SELECT sequence_owner, sequence_name FROM dba_sequences where sequence_owner like 'CMS_%') LOOP
    EXECUTE IMMEDIATE 'GRANT SELECT ON '||t.sequence_owner||'.' || t.sequence_name || ' TO DEV';
  END LOOP;
END;
/