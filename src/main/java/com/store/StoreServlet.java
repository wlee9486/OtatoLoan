package com.store;

import com.util.DBConn;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class StoreServlet extends HttpServlet {
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
        StoresDAO dao = new StoresDAO(conn);

        String uri = req.getRequestURI();
        String url;

        // javascript로 가져온 위도 경도 정보로 DB에서 가까운 지점 목록 생성
        if (uri.contains("find.do")) {

            String strX = req.getParameter("lon");
            String strY = req.getParameter("lat");

            Double x = 0.0;
            Double y = 0.0;

            if (strX == null) {
                x = 126.9784;
                y = 37.5667;
            } else {
                x = Double.parseDouble(strX);
                y = Double.parseDouble(strY);
            }


            List<StoresDTO> totList = dao.getAll(x, y);
            List<StoresDTO> closest = dao.getClosest(x, y);


            req.setAttribute("totList", totList);
            req.setAttribute("closest", closest);
            req.setAttribute("x", x);
            req.setAttribute("y", y);


            url = "/stores/list.jsp";
            forward(req, resp, url);

        }
    }

}

