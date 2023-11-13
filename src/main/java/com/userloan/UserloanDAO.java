package com.userloan;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UserloanDAO {

    private Connection conn = null;

    public UserloanDAO(Connection conn) {
        this.conn = conn;
    }


    public List<UserloanDTO> getLists(String userEmail) {

        List<UserloanDTO> lists = new ArrayList<UserloanDTO>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {


            sql = "select * from userloan where useremail = ? order by uNum";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                UserloanDTO dto = new UserloanDTO();

                dto.setUserEmail(rs.getString("userEmail"));
                dto.setuNum(rs.getInt("uNum"));
                dto.setpName(rs.getString("pName"));
                dto.setSigned(rs.getString("signed"));
                dto.setRate(rs.getString("rate"));
                dto.setDuration(rs.getString("duration"));
                dto.setRepay(rs.getString("repay"));
                dto.setEndDate(rs.getString("enddate"));
                dto.setPayment(rs.getInt("payment"));
                dto.setOriginalFilename(rs.getString("originalFilename"));
                dto.setSaveFilename(rs.getString("saveFilename"));

                lists.add(dto);
            }

            rs.close();
            pstmt.close();


        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return lists;


    }

    public int insertData(UserloanDTO dto) {
        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {
            sql = "insert into userloan (useremail, unum, pname, amount, signed, rate, duration, repay, enddate, payment, OriginalFilename, saveFilename) " +
                    "values (?, (select nvl(max(unum), 0) + 1 from userloan), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, dto.getUserEmail());
            pstmt.setString(2, dto.getpName());
            pstmt.setString(3, dto.getAmount());
            pstmt.setString(4, dto.getSigned());
            pstmt.setString(5, dto.getRate());
            pstmt.setString(6, dto.getDuration());
            pstmt.setString(7, dto.getRepay());
            pstmt.setString(8, dto.getEndDate());
            pstmt.setInt(9, dto.getPayment());
            pstmt.setString(10, dto.getOriginalFilename());
            pstmt.setString(11, dto.getSaveFilename());


            result = pstmt.executeUpdate();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public int updatePayment(int uNum) {

        int result = 0;

        PreparedStatement pstmt = null;
        String sql;

        try {

            sql = "update userloan set payment = 0 where uNum=?";

            pstmt = conn.prepareStatement(sql);


            pstmt.setInt(1, uNum);


            result = pstmt.executeUpdate();

            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return result;
    }

    public List<String> getNames(String userEmail) {
        List<String> names = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {
            sql = "select pName from userloan where useremail = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                String pName = rs.getString("pName");

                names.add(pName);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return names;
    }

    public List<UserloanDTO> membershipList(String userEmail) {

        List<UserloanDTO> lists = new ArrayList<UserloanDTO>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {


            sql = "select * from userloan where useremail = ? and payment != 0 order by uNum";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userEmail);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                UserloanDTO dto = new UserloanDTO();

                dto.setUserEmail(rs.getString("userEmail"));
                dto.setuNum(rs.getInt("uNum"));
                dto.setpName(rs.getString("pName"));
                dto.setSigned(rs.getString("signed"));
                dto.setRate(rs.getString("rate"));
                dto.setDuration(rs.getString("duration"));
                dto.setRepay(rs.getString("repay"));
                dto.setEndDate(rs.getString("enddate"));
                dto.setPayment(rs.getInt("payment"));
                dto.setOriginalFilename(rs.getString("originalFilename"));
                dto.setSaveFilename(rs.getString("saveFilename"));

                lists.add(dto);
            }

            rs.close();
            pstmt.close();


        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return lists;


    }

    public UserloanDTO getReadData(int num) {

        UserloanDTO dto = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {

            sql = "select * from userloan where unum=?";

            pstmt = conn.prepareStatement(sql);

            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();

            if (rs.next()) {

                dto = new UserloanDTO();

                dto.setUserEmail(rs.getString("userEmail"));
                dto.setuNum(rs.getInt("uNum"));
                dto.setpName(rs.getString("pName"));
                dto.setSigned(rs.getString("signed"));
                dto.setRate(rs.getString("rate"));
                dto.setDuration(rs.getString("duration"));
                dto.setRepay(rs.getString("repay"));
                dto.setEndDate(rs.getString("enddate"));
                dto.setPayment(rs.getInt("payment"));
                dto.setOriginalFilename(rs.getString("originalFilename"));
                dto.setSaveFilename(rs.getString("saveFilename"));


            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return dto;
    }

}
