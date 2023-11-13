package com.membership;

import com.member.CustomInfo;
import com.member.MemberDAO;
import com.member.MemberDTO;
import com.product.ProductDAO;
import com.userloan.UserloanDAO;
import com.userloan.UserloanDTO;
import com.util.DBConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class MembershipServlet extends HttpServlet {


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
        String cp = req.getContextPath();

        Connection conn = DBConn.getConnection();
        MemberDAO memberDAO = new MemberDAO(conn);
        ProductDAO productDAO = new ProductDAO(conn);
        UserloanDAO userloanDAO = new UserloanDAO(conn);


        String uri = req.getRequestURI();
        String url;

        HttpSession session = req.getSession();
        CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
        // 회원의 대출별 상환 금액과 캐시 잔액 조회
        if (uri.contains("charge.do")) {


            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }


            url = "/memberService/charge.jsp";
            forward(req, resp, url);

            // 캐시 충전
        } else if (uri.contains("charge_ok.do")) {
            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();
            MemberDTO memberDTO = memberDAO.getReadMemData(userEmail);
            int cash = memberDTO.getCash();
            int amount = Integer.parseInt(req.getParameter("amount"));


            if (amount != 0) {

                cash += amount;
                memberDAO.updateCash(userEmail, cash);
            }

            req.setAttribute("amount", amount);

            url = "/memberService/chargeDone.jsp";
            forward(req, resp, url);

            // 상환하기
        } else if (uri.contains("payback.do")) {


            if (info == null) {
                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);

                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }
            String userEmail = info.getUserEmail();

            MemberDTO memberDTO = memberDAO.getReadMemData(userEmail);
            List<UserloanDTO> userloanDTOS = userloanDAO.membershipList(userEmail);
            int cash = memberDTO.getCash();

            req.setAttribute("cash", cash);
            req.setAttribute("userloanDTOS", userloanDTOS);

            url = "/memberService/repay.jsp";
            forward(req, resp, url);


        } else if (uri.contains("payback_ok.do")) {
            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();

            MemberDTO memberDTO = memberDAO.getReadMemData(userEmail);
            int cash = memberDTO.getCash();

            int uNum = Integer.parseInt(req.getParameter("uNum"));
            int payment = Integer.parseInt(req.getParameter("fPay"));

            userloanDAO.updatePayment(uNum);
            cash -= payment;
            memberDAO.updateCash(userEmail, cash);


            url = cp + "/web/main2.jsp";
            resp.sendRedirect(url);
        }


    }
}
