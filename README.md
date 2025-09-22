UPDATE cms_card.customer set mobile_number1='+919922860405', email='shraddhas@fsstech.com'

where customer_id in (112111,112112,112113,112114,112115,112116,112117,112118,112119,112120);

commit;
 
 
 mkdir onboardfile (at the root level)
mkdir npfile (at the root level)
cd npfile
mkdir npInstantPPKCard
mkdir npCardBatchRequest
 
cd ..
 
mkdir test-bucket (at the root level)
cd test-bucket
mkdir CARD_MANAGEMENT
mkdir adminCardFiles
mkdir adminCardRequestFiles
mkdir adminCardTextFile
mkdir certificates
mkdir customerImageDrive
mkdir embossVendorInvoiceFiles
mkdir fileCertificates
mkdir file_encryption
mkdir npCardActivation
mkdir npCardBatchRequest
mkdir npInstantPPKCard
mkdir 22-09-2025
cd ..




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
  DATASOURCE_DBTYPE: "oracle"
  