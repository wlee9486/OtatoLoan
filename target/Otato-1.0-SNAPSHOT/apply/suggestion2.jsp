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
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" type="text/css" href="../apply/css/btn.css">
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../data/suggest.js"></script>


    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../apply/data/suggest.js"></script>


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


    <script type="text/javascript">
        window.addEventListener('scroll', function () {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        });

        function fOpen(n) {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../product/details.do?pNum=" + n, "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }

        function calc() {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../application/calculator.do", "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }


    </script>

    <title>상세페이지</title>
</head>

<body>
<form name="myForm" method="post">

    <jsp:include page="../web/header.jsp"/>
    <div class="test">
        <div class="container test2">
            <div class="item1">
                <div class="ctitle">대출</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 대출 > 대출상품</div>
            </div>
            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">추천상품</div>
                <hr class="hr-3">
            </div>


            <div style="height: 70pt; display: flex; justify-content: flex-end; align-items: center;">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="금융계산기"
                       onclick="calc()">
            </div>

            <div class="card">
                <table>
                    <thead>
                    <tr>
                        <th>상품명</th>
                        <th>한도</th>
                        <th>금리</th>
                        <th>상세보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dto" items="${suggestion}">

                        <tr>
                            <td>
                                <input type="radio" name="suggestionProduct"
                                       value="${dto.pNum}">
                                <img src="<%=cp%>/productList/image/logo2.jpg" class="logo1"
                                     width="15%">
                                <b>${dto.pName }</b>
                            </td>
                            <td>
                                최소 ${dto.minAmount }%
                                <br>
                                최대 ${dto.maxAmount }%
                            </td>
                            <td>
                                최저 연 ${dto.minRate }%
                                <br>
                                최고 연 ${dto.maxRate }%
                            </td>
                            <td>
                                <a class="itemd" href="javascript:fOpen(${dto.pNum});">상세보기</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div style="display: none;" id="lists">
                <div class="item2">
                    <div class="csubtitle">전체상품</div>
                    <hr class="hr-3">
                </div>
                <div class="card">
                    <table>
                        <thead>
                        <tr>
                            <th>상품명</th>
                            <th>한도</th>
                            <th>금리</th>
                            <th>상세보기</th>
                        </tr>
                        </thead>
                        <c:forEach var="dto" items="${totList}" varStatus="status">
                            <tr>
                                <td>
                                    <input type="radio" name="listProduct"
                                           value="${dto.pNum}">
                                    <img src="<%=cp%>/productList/image/logo2.jpg" class="logo1"
                                         width="15%">
                                    <b>${dto.pName }</b>
                                </td>
                                <td>
                                    최소 ${dto.minAmount }%
                                    <br>
                                    최대 ${dto.maxAmount }%
                                </td>
                                <td>
                                    최저 연 ${dto.minRate }%
                                    <br>
                                    최고 연 ${dto.maxRate }%
                                </td>
                                <td>
                                    <a class="itemd" href="javascript:fOpen(${dto.pNum});">상세보기</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="전체상품보기" id="allBtn"
                       onclick="showDiv()">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="더보기" id="moreBtn"
                       onclick="showDiv()" style="display: none">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="신청하기"
                       onclick="send()">
            </div>
        </div>

        <!-- test1(사이드바메뉴)시작 -->
        <div class="test1">
            <ui class="mainMenu">
                <li class="item" id="account">
                    <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">대출상품</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/product/list.do">- 대출상품검색</a>
                        <a href="<%=cp %>/application/suggestion.do">- 상품전체조회</a>
                    </div>
                </li>
                <li class="item" id="about">
                    <a href="#about" class="btn"><i class="fas fa-address-card a_Text">대출신청</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/application/suggestion.do">상품전체조회</a>
                    </div>

                </li>
                <li class="item" id="support">
                    <a href="<%=cp %>/application/credit.do" class="btn"><i class="fas fa-info a_Text">신용정보조회</i></a>
                </li>
            </ui>
        </div>
        <!-- test1(사이드바메뉴)끝 -->

        <!-- test끝 -->
    </div>

    <%--    <div class="modal fade" id="calculatorModal" tabindex="-1" role="dialog"--%>
    <%--         aria-labelledby="calculatorModalLabel"--%>
    <%--         aria-hidden="true">--%>
    <%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <h5 class="modal-title" id="calculatorModalLabel">금융 계산기</h5>--%>
    <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
    <%--                        <span aria-hidden="true">&times;</span>--%>
    <%--                    </button>--%>
    <%--                </div>--%>
    <%--                <div class="modal-body">--%>
    <%--                    <!-- Include the contents of calculator.jsp here -->--%>
    <%--                    <jsp:include page="../apply/calculator.jsp"/>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</form>
<jsp:include page="../web/footer3.jsp"/>


</footer>
</body>
</html>