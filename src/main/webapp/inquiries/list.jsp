<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/ingrid.css">
        <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/detail.css">
        <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/inbtn.css">
        <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

        <style type="text/css">

            .button1:hover {
                border-radius: 30px;
                color: #fed932;
                border-color: #37474f;
            }

            .button1--inverted:hover {
                border-radius: 30px;
                color: #37474F;
                border-color: #fff;
            }

            .button1:hover::before {
                border-radius: 30px;
                opacity: 1;
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            .button1 {
                border-radius: 30px;
                -webkit-transition: border-color 0.4s, color 0.4s;
                transition: border-color 0.4s, color 0.4s;
            }

            .button1::before {
                border-radius: 30px;
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: #37474F;
                z-index: -1;
                opacity: 0;
                -webkit-transform: scale3d(0.7, 1, 1);
                transform: scale3d(0.7, 1, 1);
                -webkit-transition: -webkit-transform 0.4s, opacity 0.4s;
                transition: transform 0.4s, opacity 0.4s;
                -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
                transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            }

            .button1,
            .button1::before {
                border-radius: 30px;
                -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
                transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            }

            .button1 {
                height: 60px;
                border: 2px solid #37474F;
                float: left;
                min-width: 150px;
                max-width: 250px;
                display: block;
                margin: 1em;
                padding: 1em 1em;
                border-radius: 30px;
                background: none;
                color: inherit;
                vertical-align: middle;
                position: relative;
                z-index: 1;
                -webkit-backface-visibility: hidden;
                -moz-osx-font-smoothing: grayscale;
                text-align: center;
            }

            .button1:focus {
                border-radius: 30px;
                outline: none;
            }

            .button1 > span {
                border-radius: 30px;
                vertical-align: middle;
            }

            .button1 {
                border-radius: 30px;
                font-family: LINESeedKR-Bd;
                font-size: 14pt;
                text-align: center;
            }


        </style>
        <style type="text/css">

            .test {
                display: grid;
                grid-template-columns: 20% 1fr 20%;
                grid-template-areas:
	"test1 test2 test3";
                gap: 50px;
            }

            .test1 {
                grid-area: test1;
            }

            .test2 {
                grid-area: test2;
            }

            .test3 {
                grid-area: test3;
            }

            .a_Text {
                font-size: 25px;
            }
        </style>

        <title>문의내역</title>
    </head>
    <body>

    <jsp:include page="../web/header.jsp"/>

    <div class="test">
        <div class="container test2">
            <div class="ctitle">고객의소리(칭찬/불만/문의)</div>

            <div class="root">
                <a class="aline"
                   href="<%=cp%>/web/main2.jsp"> HOME </a>>&nbsp;고객센터>&nbsp;고객의소리(칭찬/불만/문의)
            </div>

            <hr class="hr-1">
            <div>
                <a href="<%=cp%>/inquiry/write.do;" ; class="button1" style="text-decoration: none" ;>글올리기</a>
            </div>
            <Br/>

            <!-- 테이블 시작 -->
            <section class="notice">
                <div class="page-title">
                    <h3>나의 문의 내역</h3>
                </div>

                <bR/>
                <!-- board seach area -->

                <div id="board-search">
                    <div class="search-window">
                        <form action="<%=cp%>/inquiry/list.do">
                            <div class="search-wrap">
                                <label for="search" class="blind"> 내용 검색</label>
                                <input id="search" type="text" name="searchTxt" placeholder="검색어를 입력해주세요." value="">
                                <button type="submit" class="btn btn-dark">검색</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- board list area -->
                <div id="board-list">
                    <table class="board-table">
                        <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">내용</th>
                            <th scope="col" class="th-date">분류</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="dto" items="${lists}">

                            <c:if test="${not empty dto.userEmail}">
                                <tr>
                                    <td><b>${dto.iNum }</b></td>

                                    <th>
                                        <a href="<%=cp%>/inquiry/detail.do?num=${dto.iNum}">${dto.iSubject}</a>
                                    </th>

                                    <td><b>[${dto.iTag }]</b></td>

                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </section>
        </div>
        <div class="test1">
            <ui class="mainMenu">
                <li class="item" id="account">
                    <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">고객지원</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/faq/list.do">- FAQ보러가기</a>
                    </div>
                </li>
                <li class="item" id="about">
                    <a href="#about" class="btn"><i class="fas fa-address-card a_Text">1:1 문의</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/inquiry/write.do">- 문의하기</a>
                        <a href="<%=cp %>/inquiry/list.do">- 나의 문의내역</a>
                    </div>

                </li>
                <li class="item" id="support">
                    <a href="#support" class="btn"><i class="fas fa-user-circle a_Text">감자될론 지점</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/store/find.do">- 지점찾기</a>
                    </div>
                </li>

            </ui>
        </div>

    </div>


    <!-- 테이블 끝 -->


    <jsp:include page="../web/footer3.jsp"/>


    </body>
    </html>