package com.userloan;

import com.member.CustomInfo;
import com.product.ProductDAO;
import com.product.ProductDTO;
import com.util.DBConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class UserloanServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }


    protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher(url);

        rd.forward(req, resp);

    }


    public static boolean isNumeric(String strNum) {
        if (strNum == null) {
            return false;
        }
        try {
            double d = Double.parseDouble(strNum);
        } catch (NumberFormatException nfe) {
            return false;
        }
        return true;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String cp = req.getContextPath();

        Connection conn = DBConn.getConnection();
        UserloanDAO dao = new UserloanDAO(conn);
        ProductDAO pdao = new ProductDAO(conn);


        String uri = req.getRequestURI();

        String url;

        HttpSession session = req.getSession();
        CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

        if (uri.indexOf("list.do") != -1) {


            if (info == null) {
                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String userEmail = info.getUserEmail();
            List<UserloanDTO> loanList = dao.getLists(userEmail);


            req.setAttribute("loanList", loanList);


            url = "/userLoan/list.jsp";
            forward(req, resp, url);

            // 내가 조회한 목록 조회 - 쿠키
        } else if (uri.indexOf("clicked.do") != -1) {

            List<ProductDTO> lists = new ArrayList<ProductDTO>();
            Cookie[] ck = req.getCookies();
            int x = Math.max((ck.length - 5), 0);


            for (int i = ck.length - 1; i >= x; i--) {

                if (isNumeric(ck[i].getValue())) {
                    int num = Integer.parseInt(ck[i].getValue());

                    lists.add(pdao.getReadData(num));
                }

            }

            req.setAttribute("lists", lists);
            req.setAttribute("count", lists.size());

            url = "/userLoan/clicked.jsp";
            forward(req, resp, url);


        }
    }

}
