package com.scoreshared.scaffold;

import java.security.MessageDigest;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class BarragemMd5PasswordEncoder extends Md5PasswordEncoder {

    @Override
    public String encodePassword(String rawPass, Object salt) {
        byte[] defaultBytes = rawPass.getBytes();
        MessageDigest algorithm = getMessageDigest();
        algorithm.reset();
        algorithm.update(defaultBytes);
        byte messageDigest[] = algorithm.digest();

        StringBuffer hexString = new StringBuffer();
        for (int i = 0; i < messageDigest.length; i++) {
            hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
        }
        return hexString.toString();
    }
}
