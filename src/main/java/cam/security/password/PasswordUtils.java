package cam.security.password;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.crypto.bcrypt.BCrypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class PasswordUtils {
    static private PasswordUtils instance;

    private static  final String MD5="MD5";

    public static synchronized PasswordUtils getInstance()
    {
        if (instance == null) instance = new PasswordUtils();
        return instance;
    }

    public String hashPassword(String plainTextPassword) {
        if(StringUtils.isEmpty(plainTextPassword)){
            return BCrypt.hashpw(plainTextPassword, BCrypt.gensalt());
        }
        return BCrypt.hashpw("password", BCrypt.gensalt());
    }

    public String passwordHashed(String passwordToHash ){
        String generatedPassword = null;
        try {
            // Create MessageDigest instance for MD5
            MessageDigest md = MessageDigest.getInstance(MD5);
            //Add password bytes to digest
            md.update(passwordToHash.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //This bytes[] has bytes in decimal format;
            //Convert it to hexadecimal format
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++)
            {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            //Get complete hashed password in hex format
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        System.out.println(generatedPassword);
        return generatedPassword;
    }
}
