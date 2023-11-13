package com.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StoresDAO {
    private Connection conn = null;

    public StoresDAO(Connection conn) {
        this.conn = conn;
    }

    public List<StoresDTO> getAll(Double x, Double y) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<StoresDTO> list = new ArrayList<>();

        try {
            String sql = "select * from (select name, tel, zip, address, DISTNACE_WGS84(?, ?, y, x) AS DISTANCE, x, y " +
                    "FROM stores ORDER BY DISTANCE) TMP";

            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, y);
            pstmt.setDouble(2, x);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                StoresDTO dto = new StoresDTO();

                dto.setName(rs.getString("name"));
                dto.setTel(rs.getString("tel"));
                dto.setAddress(rs.getString("address"));
                dto.setZip(rs.getString("zip"));
                dto.setX(rs.getDouble("x"));
                dto.setY(rs.getDouble("y"));

                list.add(dto);
            }
            pstmt.close();
            rs.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public List<StoresDTO> getClosest(Double x, Double y) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<StoresDTO> list = new ArrayList<>();

        try {
            String sql = " select * from (select name, tel, zip, address, DISTNACE_WGS84(?, ?, y, x) AS DISTANCE\n" +
                    "FROM stores ORDER BY DISTANCE) TMP where rownum <6";

            pstmt = conn.prepareStatement(sql);
            pstmt.setDouble(1, y);
            pstmt.setDouble(2, x);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                StoresDTO dto = new StoresDTO();

                dto.setName(rs.getString("name"));
                dto.setTel(rs.getString("tel"));
                dto.setAddress(rs.getString("address"));
                dto.setZip(rs.getString("zip"));

                list.add(dto);
            }
            pstmt.close();
            rs.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;

    }

}
