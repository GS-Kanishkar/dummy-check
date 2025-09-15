-- Encrypt Wrapper
CREATE OR REPLACE FUNCTION aes_gcm_encrypt(p_text VARCHAR2, p_key VARCHAR2)
RETURN VARCHAR2
AS LANGUAGE JAVA
NAME 'AESGCMUtil.encrypt(java.lang.String, java.lang.String) return java.lang.String';
/
 
-- Decrypt Wrapper
CREATE OR REPLACE FUNCTION aes_gcm_decrypt(p_cipher VARCHAR2, p_key VARCHAR2)
RETURN VARCHAR2
AS LANGUAGE JAVA
NAME 'AESGCMUtil.decrypt(java.lang.String, java.lang.String) return java.lang.String';
/