package com.contract;

import com.member.CustomInfo;
import com.member.MemberDAO;
import com.member.MemberDTO;
import com.product.ProductDAO;
import com.product.ProductDTO;
import com.userloan.UserloanDAO;
import com.userloan.UserloanDTO;
import com.util.DBConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.sql.Connection;
import java.time.LocalDate;

public class ProductContractServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Connection conn = DBConn.getConnection();
        UserloanDAO dao = new UserloanDAO(conn);

        MemberDAO memberDAO = new MemberDAO(conn);
        ProductDAO productDAO = new ProductDAO(conn);


        String cp = req.getContextPath();
        String uri = req.getRequestURI();


        String url;

        // 계약서 정보 받기
        if (uri.indexOf("write.do") != -1) {


            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;


            }

            String userEmail = info.getUserEmail();
            int pNum = Integer.parseInt(req.getParameter("pNum"));

            // 계약서에는 회원 정보와 상품 정보가 모두 필요해서 각 DB에서 dto 가져오기
            MemberDTO memberDTO = memberDAO.getReadMemData(userEmail);
            ProductDTO productDTO = productDAO.getReadData(pNum);
            String rate = req.getParameter("rate");
            Integer duration = Integer.parseInt(req.getParameter("duration"));
            String amount = req.getParameter("amount");
            String repay = req.getParameter("repay");


            req.setAttribute("memberDTO", memberDTO);
            req.setAttribute("productDTO", productDTO);
            req.setAttribute("rate", rate);
            req.setAttribute("duration", duration);
            req.setAttribute("amount", amount);
            req.setAttribute("repay", repay);

            LocalDate date = LocalDate.now();
            req.setAttribute("signed", date.toString());

            date = date.plusMonths(duration);
            req.setAttribute("endDate", date.toString());

            url = "/pcontract/write.jsp";
            forward(req, resp, url);


            // 계약서 DB에 저장
        } else if (uri.indexOf("write_ok.do") != -1) {

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();

            String amount = req.getParameter("amount");
            String duration = req.getParameter("duration");
            String rate = req.getParameter("rate");
            String repay = req.getParameter("repay");

            // 상환 방법에 따른 첫 상환금 계산
            int loan = Integer.parseInt(amount);
            int period = Integer.parseInt(duration) * 12;
            int monthlyLoan = loan / period;
            Double monthlyInterest = Double.parseDouble(rate) / 100 / 12;
            int x = (int) Math.pow((1 + monthlyInterest), -period);

            int payment = 0;
            if (repay.equals("만기일시")) {
                payment = (int) Math.floor(loan * monthlyInterest);
            } else if (repay.equals("원리금균등")) {
                payment = (int) Math.floor(loan * monthlyInterest / (1 - x));
            } else if (repay.equals("원금균등")) {
                payment = (int) Math.floor(monthlyLoan + (loan * monthlyInterest));
            }


            // 대출 받은 상품 목록에 저장
            UserloanDTO dto = new UserloanDTO();

            dto.setUserEmail(userEmail);
            dto.setpName(req.getParameter("pName"));
            dto.setAmount(req.getParameter("amount"));
            dto.setDuration(req.getParameter("duration"));
            dto.setRate(req.getParameter("rate"));
            dto.setSigned(req.getParameter("signed"));
            dto.setEndDate(req.getParameter("endDate"));
            dto.setRepay(repay);
            dto.setPayment(payment);
            dto.setOriginalFilename(userEmail + "_" + req.getParameter("pNum") + ".png");
            dto.setSaveFilename(userEmail + "_" + req.getParameter("pNum") + ".png");

            int result = dao.insertData(dto);
            String msg = "";

            if (result == 1) {
                msg = "대출신청이 정상적으로 완료되었습니다.";
            } else {
                msg = "잠시 후, 다시 시도해주세요.";
            }


            req.setAttribute("msg", msg);
            url = cp + "/contract/complete.do";
            resp.sendRedirect(url);

        } else if (uri.indexOf("complete.do") != -1) {



            url = "/pcontract/complete.jsp";
            forward(req, resp, url);

        }

    }



}
