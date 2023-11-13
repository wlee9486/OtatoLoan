package com.member;

import com.userloan.UserloanDAO;
import com.util.DBConn;
import com.util.SHA256;
import org.apache.commons.lang3.RandomStringUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.SecureRandom;

public class MemberServlet extends HttpServlet {

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
        String cp = req.getContextPath();

        MemberDAO dao = new MemberDAO(DBConn.getConnection());

        String uri = req.getRequestURI();
        String url;

        //  쉶 썝媛  엯 李
        if (uri.indexOf("signup.do") != -1) {

            url = "/member/signup.jsp";
            forward(req, resp, url);

            //  쉶 썝媛  엯  썑泥섎━
        } else if (uri.indexOf("signup_ok.do") != -1) {

            MemberDTO dto = new MemberDTO();
            new SHA256();

            dto.setUserName(req.getParameter("userName"));
            dto.setUserEmail(req.getParameter("userEmail"));
            dto.setUserPwd(SHA256.getSHA256(req.getParameter("userPwd")));
            dto.setUserBirth(req.getParameter("userBirth"));
            dto.setCarrier(req.getParameter("carrier"));
            dto.setUserTel(req.getParameter("userTel"));
            dto.setGender(req.getParameter("gender"));
            dto.setMarketingYn(req.getParameter("marketingYn"));

            int result = dao.insertMemData(dto);

            if (result == 0) {
                req.setAttribute("message", "회원가입을 다시 시도해주세요.");
                url = "/login/login.do";
                forward(req, resp, url);
                return;
            }

            url = cp + "/login/login.do";
            resp.sendRedirect(url);

            // 濡쒓렇 씤 李
        } else if (uri.indexOf("login.do") != -1) {

            url = "/member/login.jsp";
            forward(req, resp, url);

            // 濡쒓렇 씤  썑泥섎━
        } else if (uri.indexOf("login_ok.do") != -1) {

            String userEmail = req.getParameter("userEmail");
            String userPwd = req.getParameter("userPwd");

            MemberDTO dto = dao.getReadMemData(userEmail);

            if (dto == null || !(dto.getUserPwd().equals(SHA256.getSHA256(userPwd)))) {
                req.setAttribute("message", "아이디와 비밀번호를 확인하세요.");

                url = "/login/login.do";
                forward(req, resp, url);
                return;
            }

            HttpSession session = req.getSession();

            CustomInfo info = new CustomInfo();

            info.setUserEmail(dto.getUserEmail());
            info.setUserName(dto.getUserName());
            info.setAuthorized(dto.getAuthorized());
            info.setUserTel(dto.getUserTel());

            session.setAttribute("customInfo", info);

            String previousPage = (String) session.getAttribute("previousPage");
            if (previousPage != null) {
                resp.sendRedirect(previousPage);
            } else {
                //  씠 쟾  럹 씠吏 媛   뾾 쑝硫  湲곕낯  럹 씠吏 濡  redirect 빀 땲 떎.
                resp.sendRedirect( cp + "/web/main2.jsp"); //  삁 떆濡  index.jsp濡   꽕 젙 뻽 뒿 땲 떎.
            }

            // 鍮꾨 踰덊샇 李얘린李쎌쑝濡   씠 룞
        } else if (uri.indexOf("findpwd.do") != -1) {

            url = "/member/findpwd.jsp";
            forward(req, resp, url);

            // 鍮꾨 踰덊샇 李얘린  썑泥섎━
        } else if (uri.indexOf("findpwd_ok.do") != -1) {

            String userEmail = req.getParameter("userEmail");
            String userTel = req.getParameter("userTel");

            MemberDTO dto = dao.getReadMemData(userEmail);

            if (dto == null || !(dto.getUserTel().equals(userTel))) {

                System.out.println(userTel);
                System.out.println(userEmail);
                req.setAttribute("message", "회원정보가 없습니다.");

                url = "/login/login.do";
                forward(req, resp, url);
                return;
            }

            String tempPwd = RandomStringUtils.randomAlphanumeric(10);
            String shatempPwd = SHA256.getSHA256(tempPwd);

            dto.setUserPwd(shatempPwd);
            dao.updateMemData(dto);

            HttpSession session = req.getSession();
            session.setAttribute("tempPwd", tempPwd);
            session.setAttribute("uTel", dto.getUserTel());

            System.out.println(tempPwd);

            url = cp + "/sms/sendPwdForm.jsp";
            resp.sendRedirect(url);

            // 濡쒓렇 븘 썐
        } else if (uri.indexOf("logout.do") != -1) {

            HttpSession session = req.getSession();

            session.removeAttribute("customInfo");
            session.invalidate();
            url = cp + "/web/main2.jsp";
            resp.sendRedirect(url);

            //  옄 룞濡쒓렇 븘 썐  썑  븞 궡  럹 씠吏 濡   씠 룞
        } else if (uri.indexOf("logoutinfo.do") != -1) {

            HttpSession session = req.getSession();

            session.removeAttribute("customInfo");
            session.invalidate();

            url = "/member/logoutinfo.jsp";
            forward(req, resp, url);


            // 怨꾩젙  젙蹂댁닔 젙  럹 씠吏
        } else if (uri.indexOf("updatemem.do") != -1) {

            HttpSession session = req.getSession();

            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            String userEmail = info.getUserEmail();

            MemberDTO dto = dao.getReadMemData(userEmail);

            if (dto == null) {
                url = cp + "/web/main2.jsp";
                resp.sendRedirect(url);
            }

            req.setAttribute("dto", dto);

            url = "/member/updatemem.jsp";
            forward(req, resp, url);

            // 怨꾩젙  젙蹂   닔 젙  썑泥섎━
        } else if (uri.indexOf("updatemem_ok.do") != -1) {

            MemberDTO dto = new MemberDTO();

            dto.setUserEmail(req.getParameter("userEmail"));
            dto.setUserPwd(SHA256.getSHA256(req.getParameter("userPwd")));
            dto.setUserBirth(req.getParameter("userBirth"));
            dto.setCarrier(req.getParameter("carrier"));
            dto.setUserTel(req.getParameter("userTel"));
            dto.setMarketingYn(req.getParameter("marketingYn"));

            dao.updateMemData(dto);

            url = cp + "/web/main2.jsp";
            resp.sendRedirect(url);

            //  깉 눜泥섎━
        } else if (uri.indexOf("deletemem.do") != -1) {

            HttpSession session = req.getSession();

            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            String userEmail = info.getUserEmail();

            // userEmail濡    異   긽 뭹  쑀臾   뙋蹂
            UserloanDAO uldao = new UserloanDAO(DBConn.getConnection());

            if (!uldao.getLists(userEmail).isEmpty()) {
                req.setAttribute("message", "탈퇴할 수 없는 회원입니다. 고객센터 문의(1899-7979)");

                url = "/loan/list.do";
                forward(req, resp, url);
                return;

            }

            dao.deleteMemData(userEmail);

            session.removeAttribute("customInfo");
            session.invalidate();

            url = cp + "/web/main2.jsp";
            resp.sendRedirect(url);

            // 怨꾩젙  씤利앺븯湲 (sms  쟾 넚)
        } else if (uri.indexOf("preauthentication.do") != -1) {

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            if (info == null) {
                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;
            }


            url = "/member/veraccnt.jsp";
            forward(req, resp, url);

        } else if (uri.indexOf("authentication.do") != -1) {

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");

            SecureRandom random = new SecureRandom();

            String verNum = "";

            for (int i = 0; i < 6; i++) {
                verNum += random.nextInt(10);
            }
            System.out.println(verNum);

            info.setVerNum(verNum);

            url = "/sms/sendForm.jsp";
            forward(req, resp, url);

            // 怨꾩젙  씤利  踰덊샇  엯 젰李
        } else if (uri.indexOf("authentication_ok.do") != -1) {

            url = "/sms/authentication.jsp";
            forward(req, resp, url);

            // 怨꾩젙  씤利   뜲 씠 꽣 DB    꽭 뀡 뿉 諛섏쁺
        } else if (uri.indexOf("verified.do") != -1) {

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
            String userEmail = info.getUserEmail();

            dao.setAccntAuth(userEmail);

            info.setAuthorized("Y");
            String auth = "Y";
            session.setAttribute("auth", auth);

            url = cp + "/web/main2.jsp";
            resp.sendRedirect(url);

        } else if (uri.indexOf("my.do") != -1) {

            HttpSession session = req.getSession();
            CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
            String userEmail = info.getUserEmail();

            MemberDTO dto = dao.getReadMemData(userEmail);

            if (info == null) {

                String currentPage = req.getRequestURI();
                session.setAttribute("previousPage", currentPage);
                url = "/login/login.do";
                forward(req, resp, url);
                return;

            }


            req.setAttribute("dto", dto);

            url = "/member/verified.jsp";
            forward(req, resp, url);

        }
    }

}
