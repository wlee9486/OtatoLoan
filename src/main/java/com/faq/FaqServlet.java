package com.faq;

import com.util.DBConn;
import com.util.MyUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FaqServlet extends HttpServlet {


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
        FaqDAO dao = new FaqDAO(conn);

        MyUtil myUtil = new MyUtil();

        String uri = req.getRequestURI();

        String url;

        // faq 태그별로 보기
//        if (uri.indexOf("list.do") != -1) {
//
//            String pageNum = req.getParameter("pageNum");
//            String fTag = req.getParameter("fTag");
//
//            // fTag의 기본값 설정
//            if (fTag == null || fTag.equals("")) {
//                fTag = "예·적금";
//
//            } else {
//                if (req.getMethod().equalsIgnoreCase("GET")) {
//                    fTag = URLDecoder.decode(fTag, "UTF-8");
//
//                }
//            }
//
//            int currentPage = 1;
//
//            if (pageNum != null) {
//                currentPage = Integer.parseInt(pageNum);
//            }
//
//            int dataCount = dao.getDataCount(fTag);
//
//            int numPerPage = 5;
//            int totalPage = myUtil.getPageCount(numPerPage, dataCount);
//
//            if (currentPage > totalPage) {
//                currentPage = totalPage;
//            }
//
//            int start = (currentPage - 1) * numPerPage + 1;
//            int end = currentPage * numPerPage;
//
//
//            List<FaqDTO> lists = dao.getList(start, end, fTag);
//
//            String listUrl = cp + "/faq/list.do?fTag=" + URLEncoder.encode(fTag, "UTF-8");
//
//
//            String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
//
//
//            req.setAttribute("lists", lists);
//            req.setAttribute("pageIndexList", pageIndexList);
//            req.setAttribute("dataCount", dataCount);
//            req.setAttribute("fTag", fTag);
//
//            url = "/faqs/faqlist.jsp";
////            url = "/faqs/test.jsp";
//            forward(req, resp, url);
//
//        }

        if (uri.indexOf("list.do") != -1) {

            String[] fTagValues = {"예·적금", "대출", "앱서비스", "보안설정", "기타"};
            Map<String, List<FaqDTO>> faqMap = new HashMap<>();

            for (int i = 0; i < fTagValues.length; i++) {
                String fTag = fTagValues[i];
                List<FaqDTO> list = dao.getList(fTag);
                faqMap.put(fTag, list);
            }

            req.setAttribute("faqMap", faqMap);

            url = "/faqs/faqlist.jsp";
            forward(req, resp, url);

        }
    }


}
