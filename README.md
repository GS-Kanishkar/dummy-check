
CREATE OR REPLACE AND COMPILE JAVA SOURCE NAMED "AESGCMUtil" AS
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;
 
public class AESGCMUtil {
 
    private static final int GCM_TAG_LENGTH = 128; // bits
    private static final int IV_LENGTH = 12;       // bytes
 
    // Generate IV
    private static byte[] generateIV() {
        byte[] iv = new byte[IV_LENGTH];
        new SecureRandom().nextBytes(iv);
        return iv;
    }
 
    // Encrypt
    public static String encrypt(String plainText, String base64Key) throws Exception {
        byte[] secretKeyBytes = Base64.getDecoder().decode(base64Key);
        SecretKey secretKey = new SecretKeySpec(secretKeyBytes, "AES");
 
        byte[] iv = generateIV();
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec spec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);
 
        byte[] cipherText = cipher.doFinal(plainText.getBytes(StandardCharsets.UTF_8));
 
        // Concatenate IV + CipherText
        byte[] encryptedData = new byte[iv.length + cipherText.length];
        System.arraycopy(iv, 0, encryptedData, 0, iv.length);
        System.arraycopy(cipherText, 0, encryptedData, iv.length, cipherText.length);
 
        return Base64.getEncoder().encodeToString(encryptedData);
    }
 
    // Decrypt
    public static String decrypt(String cipherTextBase64, String base64Key) throws Exception {
        byte[] encryptedData = Base64.getDecoder().decode(cipherTextBase64);
        byte[] secretKeyBytes = Base64.getDecoder().decode(base64Key);
        SecretKeySpec secretKey = new SecretKeySpec(secretKeyBytes, "AES");
 
        int nonceSize = IV_LENGTH;
        if (encryptedData.length < nonceSize) {
            throw new IllegalArgumentException("Ciphertext too short");
        }
 
        // Extract IV
        byte[] iv = new byte[nonceSize];
        System.arraycopy(encryptedData, 0, iv, 0, nonceSize);
 
        // Extract cipher bytes
        byte[] cipherBytes = new byte[encryptedData.length - nonceSize];
        System.arraycopy(encryptedData, nonceSize, cipherBytes, 0, cipherBytes.length);
 
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        GCMParameterSpec spec = new GCMParameterSpec(GCM_TAG_LENGTH, iv);
        cipher.init(Cipher.DECRYPT_MODE, secretKey, spec);
 
        byte[] plainText = cipher.doFinal(cipherBytes);
        return new String(plainText, StandardCharsets.UTF_8);
    }
}
/
