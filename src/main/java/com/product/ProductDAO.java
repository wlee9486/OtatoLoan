package com.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private Connection conn = null;

    public ProductDAO(Connection conn) {
        this.conn = conn;
    }

    public List<ProductDTO> getSuggestion(int score) {

        score += 100;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<ProductDTO> list = new ArrayList<>();

        try {
            String sql = "select * from (select rownum rnum, data.* from " +
                    "(select * from product where score <= ? order by maxrate desc) data) " +
                    "where rnum <=5";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, score);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO dto = new ProductDTO();

                dto.setpName(rs.getString("pName"));
                dto.setpNum(rs.getInt("pNum"));
                dto.setMaxRate(rs.getInt("maxRate"));
                dto.setMinRate(rs.getInt("minRate"));
                dto.setMaxAmount(rs.getInt("maxAmount"));
                dto.setpCategory(rs.getString("pCategory"));
                dto.setpMethod(rs.getString("pMethod"));
                dto.setTarget(rs.getString("target"));
                dto.setPeriod(rs.getString("period"));
                dto.setLimit(rs.getString("limit"));
                dto.setlRate(rs.getString("lRate"));
                dto.setPenalty(rs.getString("penalty"));
                dto.setRepay(rs.getString("repay"));
                dto.setFee(rs.getString("fee"));
                dto.setAccrual(rs.getString("accrual"));
                dto.setScore(rs.getInt("score"));
                dto.setMinPeriod(rs.getInt("minPeriod"));
                dto.setMaxPeriod(rs.getInt("maxPeriod"));
                dto.setMinAmount(rs.getInt("minAmount"));

                list.add(dto);
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

    public ProductDTO getReadData(int pNum) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ProductDTO dto = null;

        try {
            String sql = "select * from product where pNum = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, pNum);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                dto = new ProductDTO();

                dto.setpName(rs.getString("pName"));
                dto.setpNum(rs.getInt("pNum"));
                dto.setMaxRate(rs.getInt("maxRate"));
                dto.setMinRate(rs.getInt("minRate"));
                dto.setMaxAmount(rs.getInt("maxAmount"));
                dto.setpCategory(rs.getString("pCategory"));
                dto.setpMethod(rs.getString("pMethod"));
                dto.setTarget(rs.getString("target"));
                dto.setPeriod(rs.getString("period"));
                dto.setLimit(rs.getString("limit"));
                dto.setlRate(rs.getString("lRate"));
                dto.setPenalty(rs.getString("penalty"));
                dto.setRepay(rs.getString("repay"));
                dto.setFee(rs.getString("fee"));
                dto.setAccrual(rs.getString("accrual"));
                dto.setScore(rs.getInt("score"));
                dto.setMinPeriod(rs.getInt("minperiod"));
                dto.setMaxPeriod(rs.getInt("maxperiod"));
                dto.setMinAmount(rs.getInt("minamount"));

            }

            pstmt.close();
            rs.close();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return dto;
    }

    public List<ProductDTO> getLists(int start, int end) {
        List<ProductDTO> lists = new ArrayList<ProductDTO>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        try {
            sql = "select * from (";
            sql += "select rownum prNum, data.* from (";
            sql += "select * from product order by pNum desc) data) ";
            sql += "where prNum>=? and prNum<=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);

            rs = pstmt.executeQuery();

            while (rs.next()) {

                ProductDTO dto = new ProductDTO();

                dto.setpName(rs.getString("pName"));
                dto.setpNum(rs.getInt("pNum"));
                dto.setMaxRate(rs.getInt("maxRate"));
                dto.setMinRate(rs.getInt("minRate"));
                dto.setMaxAmount(rs.getInt("maxAmount"));
                dto.setpCategory(rs.getString("pCategory"));
                dto.setpMethod(rs.getString("pMethod"));
                dto.setTarget(rs.getString("target"));
                dto.setPeriod(rs.getString("period"));
                dto.setLimit(rs.getString("limit"));
                dto.setlRate(rs.getString("lRate"));
                dto.setPenalty(rs.getString("penalty"));
                dto.setRepay(rs.getString("repay"));
                dto.setFee(rs.getString("fee"));
                dto.setAccrual(rs.getString("accrual"));
                dto.setScore(rs.getInt("score"));
                dto.setMinPeriod(rs.getInt("minPeriod"));
                dto.setMaxPeriod(rs.getInt("maxPeriod"));
                dto.setMinAmount(rs.getInt("minAmount"));

                lists.add(dto);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return lists;
    }

    public int getDataCount(String pCategory, String pMethod) {
        int totalDataCount = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;
        pCategory = "%" + pCategory + "%";
        pMethod = "%" + pMethod + "%";

        try {
            sql = "select nvl(count(*), 0) from product where pCategory like ? and pMethod like ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pCategory);
            pstmt.setString(2, pMethod);
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

    // 검색 리스트 가져오기
    public List<ProductDTO> searchList(int start, int end, String pCategory, String pMethod) {

        List<ProductDTO> lists = new ArrayList<ProductDTO>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql;

        pCategory = "%" + pCategory + "%";
        pMethod = "%" + pMethod + "%";

        try {
            sql = "select * from (";
            sql += "select rownum prNum, data.* from (";
            sql += "select pName,pNum,maxRate,minRate,maxAmount,pCategory,";
            sql += "pMethod,target,period,limit,lRate,penalty,repay,fee,accrual,score,minPeriod,maxPeriod,minAmount from product where pCategory like ? and pMethod like ? order by pNum desc) data) ";
            sql += "where prNum>=? and prNum<=?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pCategory);
            pstmt.setString(2, pMethod);
            pstmt.setInt(3, start);
            pstmt.setInt(4, end);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductDTO dto = new ProductDTO();

                dto.setpName(rs.getString("pName"));
                dto.setpNum(rs.getInt("pNum"));
                dto.setMaxRate(rs.getInt("maxRate"));
                dto.setMinRate(rs.getInt("minRate"));
                dto.setMaxAmount(rs.getInt("maxAmount"));
                dto.setpCategory(rs.getString("pCategory"));
                dto.setpMethod(rs.getString("pMethod"));
                dto.setTarget(rs.getString("target"));
                dto.setPeriod(rs.getString("period"));
                dto.setLimit(rs.getString("limit"));
                dto.setlRate(rs.getString("lRate"));
                dto.setPenalty(rs.getString("penalty"));
                dto.setRepay(rs.getString("repay"));
                dto.setFee(rs.getString("fee"));
                dto.setAccrual(rs.getString("accrual"));
                dto.setScore(rs.getInt("score"));
                dto.setMinPeriod(rs.getInt("minPeriod"));
                dto.setMaxPeriod(rs.getInt("maxPeriod"));
                dto.setMinAmount(rs.getInt("minAmount"));

                lists.add(dto);
            }

            rs.close();
            pstmt.close();

        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return lists;
    }



}
