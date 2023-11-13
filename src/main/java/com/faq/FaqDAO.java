package com.faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FaqDAO {

    private Connection conn = null;

    public FaqDAO(Connection conn) {
        this.conn = conn;
    }

    public int getDataCount(String fTag) {

        int totalDataCount = 0;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select nvl(count(*),0) from faq where ftag = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, fTag);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                totalDataCount = rs.getInt(1);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return totalDataCount;

    }

    public List<FaqDTO> getList(String fTag) {

        List<FaqDTO> lists = new ArrayList<FaqDTO>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select fnum, ftag, fsubject, fcontent ";
            sql += "from faq where ftag = ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, fTag);


            rs = pstmt.executeQuery();

            while (rs.next()) {

                FaqDTO dto = new FaqDTO();

                dto.setfNum(rs.getInt("fNum"));
                dto.setfTag(rs.getString("fTag"));
                dto.setfSubject(rs.getString("fSubject"));
                dto.setfContent(rs.getString("fContent"));

                lists.add(dto);

            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return lists;
    }

    public FaqDTO getReadData(int num) {

        FaqDTO dto = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select fnum, ftag, fsubject, fcontent from faq where fnum=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {

                dto = new FaqDTO();

                dto.setfNum(rs.getInt("fnum"));
                dto.setfTag(rs.getString("ftag"));
                dto.setfSubject(rs.getString("fsubject"));
                dto.setfContent(rs.getString("fcontent"));

            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return dto;
    }
}