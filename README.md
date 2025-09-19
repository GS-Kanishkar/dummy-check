curl --location 'https://devcms.np.fssblaze.com/sbi/javaconnect/connectiondetails/save' \
--header 'Content-Type: application/json' \
--data '{
    "tenantCode":"SBI",
    "productCode":"CMS001",
    "connectionName":"BASE24-CLASSIC-D1",
    "networkCode":"SWT0005",
    "host":"10.0.54.36",
    "port":9002,
    "connectionMode":"C",
    "isLoginRequired":"Y",
    "isAutoLoginRequired":"Y",
    "isEchoRequired":"N",
    "echoFreq":0,
    "echoRetryAttempts":0,
    "dmlBy":"Abdul"
}'

















curl --location 'https://devcms.np.fssblaze.com/sbi/javaconnect/connectiondetails/save' \
--header 'Content-Type: application/json' \
--data '{
   "tenantCode":"SBI",
   "productCode":"CMS001",
   "connectionName":"BASE24-CLASSIC-D2",
   "networkCode":"SWT0005",
   "host":"10.0.54.36",
   "port":9004,
   "connectionMode":"C",
   "isLoginRequired":"Y",
   "isAutoLoginRequired":"Y",
   "isEchoRequired":"N",
   "echoFreq":0,
   "echoRetryAttempts":0,
   "dmlBy":"Abdul"
}'

 