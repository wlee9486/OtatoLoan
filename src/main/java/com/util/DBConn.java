package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
    private static Connection dbConn = null;

    public static Connection getConnection() {
        if (dbConn == null) {
            try {
                String url = "jdbc:oracle:thin:@localhost:1521:XE";
                String user = "system";
                String pwd = "oracle";

                Class.forName("oracle.jdbc.OracleDriver");

                dbConn = DriverManager.getConnection(url, user, pwd);


            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return dbConn;
    }

    public static void close() {
        if (dbConn == null) {
            return;
        }
        try {
            if (!dbConn.isClosed()) {
                dbConn.close();
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        dbConn = null;
    }

    public static void main(String[] args) {
        getConnection();
    }

}
