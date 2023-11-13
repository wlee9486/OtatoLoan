package com.inquiry;

import com.member.CustomInfo;
import com.util.DBConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.List;

public class InquiryServlet extends HttpServlet {


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

        String cp = req.getContextPath();
        Connection conn = DBConn.getConnection();
        InquiryDAO dao = new InquiryDAO(conn);


        String uri = req.getRequestURI();

        String url;
        HttpSession session = req.getSession();
        CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

        // 1:1 臾몄쓽 紐⑸줉 議고쉶
        if (uri.indexOf("list.do") != -1) {


            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }

            String searchTxt = req.getParameter("searchTxt");

            if (searchTxt == null) {
                searchTxt = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET")) {
                    searchTxt = URLDecoder.decode(searchTxt, "UTF-8");
                }
            }

            String userEmail = info.getUserEmail();

            List<InquiryDTO> lists = dao.getList(userEmail, searchTxt);

            req.setAttribute("searchTxt", searchTxt);
            req.setAttribute("lists", lists);

            url = "/inquiries/list.jsp";
            forward(req, resp, url);


        } else if (uri.contains("write.do")) {
            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }
            url = "/inquiries/write.jsp";
            forward(req, resp, url);

            // 1:1 臾몄쓽 DB    옣
        } else if (uri.contains("cs.do")) {

            url = "/inquiries/cs.jsp";
            forward(req, resp, url);

            // 1:1 臾몄쓽 DB    옣


        } else if (uri.contains("write_ok.do")) {

            String userEmail = info.getUserEmail();


            InquiryDTO dto = new InquiryDTO();

            int iNum = dao.getDataCount(userEmail);

            dto.setiNum(iNum);
            dto.setUserEmail(userEmail);
            dto.setiSubject(req.getParameter("iSubject"));
            dto.setiContent(req.getParameter("iContent"));


            dao.insertData(dto);

            url = cp + "/inquiry/list.do";
            resp.sendRedirect(url);

            // 1:1 臾몄쓽  긽 꽭蹂닿린
        } else if (uri.contains("detail.do")) {
            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }
            int iNum = Integer.parseInt(req.getParameter("num"));
            InquiryDTO dto = dao.getReadData(iNum);

            if (dto == null) {
                url = cp + "/inquiry/list.do";
                resp.sendRedirect(url);
            }

            dto.setiContent(dto.getiContent().replaceAll("\n", "<br>"));

            req.setAttribute("dto", dto);

            url = "/inquiries/detail.jsp";
            forward(req, resp, url);

            // 1:1 臾몄쓽  닔 젙
        } else if (uri.contains("update.do")) {

            int iNum = Integer.parseInt(req.getParameter("num"));

            InquiryDTO dto = dao.getReadData(iNum);

            if (dto == null) {
                url = cp + "/inquiry/list.do";
                resp.sendRedirect(url);
            }
            req.setAttribute("dto", dto);

            url = "/inquiries/updated.jsp";
            forward(req, resp, url);

        } else if (uri.contains("update_ok.do")) {


            int iNum = Integer.parseInt(req.getParameter("iNum"));
            String userEmail = info.getUserEmail();

            InquiryDTO dto = new InquiryDTO();

            dto.setiNum(iNum);
            dto.setUserEmail(userEmail);
            dto.setiSubject(req.getParameter("iSubject"));
            dto.setiContent(req.getParameter("iContent"));

            int result = dao.updateData(dto);
            System.out.println(result);

//            url = cp + "/inquiry/detail.do?num=" + iNum;
            url = cp + "/inquiry/detail.do?num=" + iNum;
            resp.sendRedirect(url);


            // 1:1 臾몄쓽  궘 젣
        } else if (uri.contains("delete.do")) {

            int iNum = Integer.parseInt(req.getParameter("num"));

            dao.deleteData(iNum);

            url = cp + "/inquiry/list.do";
            resp.sendRedirect(url);
        }


    }
}