package some_usefull_classes;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Password {
    private String password;

    public Password(String password) {
        this.password = hash(password);
    }

    public String getPassword() {
        return password;
    }

    public String hash(String s) {

        StringBuffer stringBuffer = new StringBuffer();

        try {

            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
            messageDigest.update(s.getBytes("UTF-8"));
            byte[] digest = messageDigest.digest();

            for (int i = 0; i < digest.length; i++) {
                stringBuffer.append(digest[i]);
            }


        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return stringBuffer.toString();
    }

    public boolean equals(Password password) {
        return this.password.equals(password.getPassword());
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
