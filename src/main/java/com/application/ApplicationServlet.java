package com.application;

import com.member.CustomInfo;
import com.member.MemberDAO;
import com.member.MemberDTO;
import com.product.ProductDAO;
import com.product.ProductDTO;
import com.userloan.UserloanDAO;
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
import java.util.stream.Collectors;


public class ApplicationServlet extends HttpServlet {


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


        if (uri.contains("suggestion.do")) {

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();
            MemberDTO dto = memberDAO.getReadMemData(userEmail);

            int credit = (int) Math.floor(Math.random() * 101 + 825);

            if (dto.getCredit() == 0) {
                memberDAO.updateCredit(info.getUserEmail(), credit);
            }

            credit = dto.getCredit();

            // 추천 리스트 뽑기
            List<ProductDTO> suggestion = productDAO.getSuggestion(credit);

            // 전체 리스트
            int dataCount = productDAO.getDataCount("", "");
            List<ProductDTO> totList = productDAO.getLists(1, dataCount);

            // 가입된 상품
            List<String> loanNames = userloanDAO.getNames(userEmail);


            // 가입된 상품과 겹치지 않는 추천 리스트
            suggestion = suggestion.stream()
                    .filter(product -> !loanNames.contains(product.getpName()))
                    .collect(Collectors.toList());

            // 가입된 상품과 겹치지 않는 추천 리스트
            totList = totList.stream()
                    .filter(product -> !loanNames.contains(product.getpName()))
                    .collect(Collectors.toList());


            req.setAttribute("suggestion", suggestion);
            System.out.println(suggestion.size());
            req.setAttribute("totList", totList);

            url = "/apply/suggestion.jsp";
            forward(req, resp, url);


            // 금융계산기
        } else if (uri.contains("calculator.do")) {

            url = "/apply/calculator.jsp";
            forward(req, resp, url);


            // 대출 신청 서류
        } else if (uri.contains("form.do")) {

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String product1 = req.getParameter("suggestionProduct");
            String product2 = req.getParameter("listProduct");
            String product3 = req.getParameter("pNum");
            int pNum = 0;

            if (product1 != null && !product1.equals("")) {
                pNum = Integer.parseInt(product1);
            } else if (product2 != null && !product2.equals("")) {
                pNum = Integer.parseInt(product2);
            } else if (product3 != null && !product3.equals("")) {
                pNum = Integer.parseInt(product3);
            }

            String userEmail = info.getUserEmail();

            MemberDTO memberDTO = memberDAO.getReadMemData(userEmail);
            ProductDTO productDTO = productDAO.getReadData(pNum);

            // 이율은 각 상품의 최대/최소 이율 사이의 난수
            int max = productDTO.getMaxRate();
            int min = productDTO.getMinRate();
            double rate = Math.random() * (max - min) + min;
            rate = Math.round(rate * 10.0) / 10.0;

            String[] repay = productDTO.getRepay().split(",");

            req.setAttribute("memberDTO", memberDTO);
            req.setAttribute("productDTO", productDTO);
            req.setAttribute("rate", rate);
            req.setAttribute("repay", repay);

            url = "/apply/form.jsp";
            forward(req, resp, url);

            // 신용점수 조회
        } else if (uri.contains("credit.do")) {

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();

            MemberDTO dto = memberDAO.getReadMemData(userEmail);

            int credit = (int) Math.floor(Math.random() * 101 + 825);

            if (dto.getCredit() == 0) {
                memberDAO.updateCredit(info.getUserEmail(), credit);
            }

            req.setAttribute("dto", dto);

            url = "/apply/info.jsp";
            forward(req, resp, url);

        }

    }
}
