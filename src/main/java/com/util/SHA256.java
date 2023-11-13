package com.util;

import java.security.MessageDigest;

// 입력값 해싱 - email인증을 위함
public class SHA256 {

    public static String getSHA256(String userEmail) {

        StringBuffer result = new StringBuffer();

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            // salting
            byte[] salt = "Otato is Bigtato".getBytes();
            md.reset();
            md.update(salt);
            byte[] chars = md.digest(userEmail.getBytes("UTF-8"));

            // chars -> 16진수 String
            for(int i=0; i<chars.length; i++) {

                String hex = Integer.toHexString(0xff & chars[i]);

                if(hex.length() == 1)
                    result.append("0");
                result.append(hex);

            }

        }catch(Exception e) {
            System.out.println(e.toString());
        }
        return result.toString();
    }

}

