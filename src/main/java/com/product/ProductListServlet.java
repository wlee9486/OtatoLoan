package com.product;

import com.util.DBConn;
import com.util.MyUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

public class ProductListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
            throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        Connection conn = DBConn.getConnection();
        ProductDAO dao = new ProductDAO(conn);
        MyUtil myUtil = new MyUtil();

        String cp = req.getContextPath();
        String uri = req.getRequestURI();

        String url;

        // 대출 상품 목록 조회
        if (uri.indexOf("list.do") != -1) {
            String pCategory = req.getParameter("pCategory");
            String pMethod = req.getParameter("pMethod");

            // 검색 카테고리는 전체를 기본값으로 지정
            if (pCategory == null || pCategory.equals("all")) {
                pCategory = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET")) {
                    pCategory = URLDecoder.decode(pCategory, "UTF-8");
                }
            }

            if (pMethod == null || pMethod.equals("all")) {
                pMethod = "";
            } else {
                if (req.getMethod().equalsIgnoreCase("GET")) {
                    pMethod = URLDecoder.decode(pMethod, "UTF-8");
                }
            }

            String pageNum = req.getParameter("pageNum");
            int currentPage = 1;

            if (pageNum != null) {
                currentPage = Integer.parseInt(pageNum);
            }

            int numPerPage = 3;

            int start = (currentPage - 1) * numPerPage + 1;
            int end = currentPage * numPerPage;

            List<ProductDTO> lists = dao.searchList(start, end, pCategory, pMethod);


            int dataCount = dao.getDataCount(pCategory, pMethod);
            int totalPage = myUtil.getPageCount(numPerPage, dataCount);

            if (currentPage > totalPage) {
                currentPage = totalPage;
            }


            String param = "pCategory=" + URLEncoder.encode(pCategory, "UTF-8") + "&pMethod=" + URLEncoder.encode(pMethod, "UTF-8");


            String listUrl = cp + "/product/list.do?" + param;
            String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

            req.setAttribute("dataCount", dataCount);
            req.setAttribute("pageIndexList", pageIndexList);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("currentPage", currentPage);
            req.setAttribute("lists", lists);
            req.setAttribute("pCategory", pCategory);
            req.setAttribute("pMethod", pMethod);


            url = "/productList/list.jsp";
            forward(req, resp, url);

            // 상품 상세보기
        } else if (uri.contains("details.do")) {

            int pNum = Integer.parseInt(req.getParameter("pNum"));

            // 상세보기 링크를 들어갈 때 마다 쿠키 생성
            // 최근 조회한 상품에서 보일 수 있도록 pNum으로 쿠키 생성
            Cookie c = new Cookie(String.valueOf(pNum), String.valueOf(pNum));
            c.setPath("/");
            resp.addCookie(c);

            ProductDTO productDTO = dao.getReadData(pNum);

            req.setAttribute("dto", productDTO);
            req.setAttribute("pNum", pNum);

            url = "/productList/details.jsp";

            forward(req, resp, url);
        }
    }


}


