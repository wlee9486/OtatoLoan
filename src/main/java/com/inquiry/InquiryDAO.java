package com.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InquiryDAO {

    private Connection conn = null;

    public InquiryDAO(Connection conn) {

        this.conn = conn;

    }


    public int insertData(InquiryDTO dto) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "insert into inquiry (inum, userEmail,iSubject,iContent,iTag) ";
            sql += "values ((select nvl(max(inum),0) +1 from inquiry),?,?,?,?)";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getUserEmail());
            pstmt.setString(2, dto.getiSubject());
            pstmt.setString(3, dto.getiContent());
            pstmt.setString(4, dto.getiTag());

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return result;
    }

    public int getDataCount(String userEmail) {

        int totalDataCount = 0;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select nvl(max(inum),0) from inquiry where useremail = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);

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


    public List<InquiryDTO> getList(String userEmail, String searchTxt) {

        List<InquiryDTO> lists = new ArrayList<InquiryDTO>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            searchTxt = "%" + searchTxt + "%";

            sql = "select userEmail,iPwd,iSubject,iContent,iNum,iTag from inquiry where userEmail=? and iContent like ?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userEmail);
            pstmt.setString(2, searchTxt);
            rs = pstmt.executeQuery();

            while (rs.next()) {

                InquiryDTO dto = new InquiryDTO();

                dto.setUserEmail(rs.getString("userEmail"));
                dto.setiPwd(rs.getString("iPwd"));
                dto.setiSubject(rs.getString("iSubject"));
                dto.setiContent(rs.getString("iContent"));
                dto.setiNum(rs.getInt("iNum"));
                dto.setiTag(rs.getString("iTag"));

                lists.add(dto);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return lists;
    }

    public int updateData(InquiryDTO dto) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update inquiry set iSubject=?, iContent=? where iNum=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getiSubject());
            pstmt.setString(2, dto.getiContent());
            pstmt.setInt(3, dto.getiNum());

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return result;
    }

    public int deleteData(int num) {

        int result = 0;
        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "delete inquiry where iNum=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, num);

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return result;
    }

    public InquiryDTO getReadData(int num) {

        InquiryDTO dto = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select * from inquiry where iNum=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                dto = new InquiryDTO();

                dto.setUserEmail(rs.getString("userEmail"));
                dto.setiPwd(rs.getString("iPwd"));
                dto.setiSubject(rs.getString("iSubject"));
                dto.setiContent(rs.getString("iContent"));
                dto.setiNum(rs.getInt("iNum"));
                dto.setiTag(rs.getString("iTag"));
            }

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return dto;
    }

}
