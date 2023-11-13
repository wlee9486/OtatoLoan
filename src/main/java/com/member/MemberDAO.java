package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MemberDAO {

    private Connection conn;

    public MemberDAO(Connection conn) {
        this.conn = conn;
    }

    // 회원가입
    public int insertMemData(MemberDTO dto) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "insert into member (userName,userEmail,userTel,userBirth,userPwd,gender,carrier,created,marketingYn) ";
            sql += "values (?,?,?,?,?,?,?,sysdate,?)";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getUserName());
            pstmt.setString(2, dto.getUserEmail());
            pstmt.setString(3, dto.getUserTel());
            pstmt.setString(4, dto.getUserBirth());
            pstmt.setString(5, dto.getUserPwd());
            pstmt.setString(6, dto.getGender());
            pstmt.setString(7, dto.getCarrier());
            pstmt.setString(8, dto.getMarketingYn());

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }


    // 계정정보 조회
    public MemberDTO getReadMemData(String userEmail) {

        MemberDTO dto = null;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select username,userpwd,useremail,userbirth,";
            sql += "usertel,gender,carrier,marketingyn,credit,authorized,cash from member where useremail=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userEmail);

            rs = pstmt.executeQuery();

            if (rs.next()) {

                dto = new MemberDTO();

                dto.setUserName(rs.getString("username"));
                dto.setUserPwd(rs.getString("userpwd"));
                dto.setUserEmail(rs.getString("useremail"));
                dto.setUserBirth(rs.getString("userbirth"));
                dto.setUserTel(rs.getString("usertel"));
                dto.setGender(rs.getString("gender"));
                dto.setCarrier(rs.getString("carrier"));
                dto.setMarketingYn(rs.getString("marketingyn"));
                dto.setCredit(rs.getInt("credit"));
                dto.setAuthorized(rs.getString("authorized"));
                dto.setCash(rs.getInt("cash"));

            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return dto;
    }


    // 계정정보수정
    public int updateMemData(MemberDTO dto) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update member set userpwd=?,usertel=?,carrier=?,marketingyn=? where useremail=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getUserPwd());
            pstmt.setString(2, dto.getUserTel());
            pstmt.setString(3, dto.getCarrier());
            pstmt.setString(4, dto.getMarketingYn());
            pstmt.setString(5, dto.getUserEmail());

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    // 탈퇴 처리
    public int deleteMemData(String userEmail) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "delete member where userEmail=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userEmail);

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    // 계정인증 완료 처리
    public int setAccntAuth(String userEmail) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update member set authorized=? where useremail=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, "Y");
            pstmt.setString(2, userEmail);

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return result;
    }

    public int updateCredit(String userEmail, int credit) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update member set credit = ? where useremail=?";

            pstmt = conn.prepareStatement(sql);


            pstmt.setInt(1, credit);
            pstmt.setString(2, userEmail);

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public int updateCash(String userEmail, int cash) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update member set cash = ? where useremail=?";

            pstmt = conn.prepareStatement(sql);


            pstmt.setInt(1, cash);
            pstmt.setString(2, userEmail);

            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }


}
