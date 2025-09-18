..

 DATASOURCE_HOST: "uatrac-scan.dcmsnonprod.bank.sbi"
  DATASOURCE_PORT: "6521"
  DATASOURCE_DB: "DCMSDB"
  DATASOURCE_SCHEMA_PREFIX: ""
  DATASOURCE_SCHEMA: "GO_CONNECT"
  DB_SSL_MODE: "disable"
  DATASOURCE_DRIVER: "oracle.jdbc.driver.OracleDriver"
  DATASOURCE_URL: "jdbc:oracle:thin:@uatrac-scan.dcmsnonprod.bank.sbi:6521/DCMSDB"
  DATASOURCE_USERNAME: "GO_CONNECT"
  DATASOURCE_PASSWORD: "zK402UAb"
  DATASOURCE_DIALECT: "org.hibernate.dialect.OracleDialect"
  
  
ALTER TABLE cms_program_cfg.hsm_key
MODIFY (
    cvkaindex   VARCHAR2(35),
    cvkaindex_confirm  VARCHAR2(35),
    cvkbindex    VARCHAR2(35),
    cvkbindex_confirm  VARCHAR2(35),
    ppk_key_index VARCHAR2(35),
    ppk_key_index_confirm VARCHAR2(35),
    single_length_pvv_key_index VARCHAR2(35),
    single_length_pvv_key_index_confirm VARCHAR2(35),
    double_length_pvv_key_index VARCHAR2(35),
    double_length_pvv_key_index_confirm VARCHAR2(35),
    single_length_pvk_key VARCHAR2(35),
    single_length_pvk_key_confirm VARCHAR2(35),
    double_length_pvk_key VARCHAR2(35),
    double_length_pvk_key_confirm VARCHAR2(35)
);
 
alter table cms_card_mgmt.green_pin_generation
add green_pin_otp_expiry_date timestamp(6);
commit;