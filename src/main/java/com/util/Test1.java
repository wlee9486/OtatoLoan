package com.util;

import java.sql.Connection;

public class Test1 {
    public static void main(String[] args) {
        Connection conn = DBConn.getConnection();
        if (conn == null) {
            System.out.println("DB 연결 실패");
            System.exit(0);
        }
        System.out.println("DB 연결 성공");
        DBConn.close();


    }
}
