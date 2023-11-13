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
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">
    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link rel="stylesheet" type="text/css" href="../web/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../web/css/btn.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
    </script>

    <script type="text/javascript">
        function sendIt() {


            var f = document.myForm;

            for (var i = 0; i < 4; i++) {
                if (f.pCategory[i].checked) {
                    var cat = f.pCategory[i].value;
                }

                if (f.pMethod[i].checked) {
                    var met = f.pMethod[i].value;
                }
            }


            f.action = "<%=cp%>/product/list.do?pCategory=" + cat + "&pMethod=" + met;
            f.submit();
        }

        function fOpen(n) {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../product/details.do?pNum=" + n, "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }
    </script>

    </script>

    <title>상세페이지</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>


<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">최근 조회한 상품</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 마이페이지 > 최근 조회한 상품</div>
        </div>
        <hr class="hr-1">


        <br/>
        <br/>
        <font class="f1">최근 <font color="orange"><b>${count}</b></font>개의 상품입니다.</font><br/>



        <!-- 반복문 -->
        <div class="bolding" style="padding-bottom: 20pt; padding-top: 20pt;">
            <c:forEach var="dto" items='${lists }'>
                <table border="1" cellspacing="2" cellpadding="2" width="100%" height="200px" style="font-family: 'OTWelcomeRA'; font-size: 25px;">
                    <tr>
                        <td rowspan="5" height="100pt" width="100pt"><img src="<%=cp%>/productList/image/logo2.jpg"
                                                                          style="height: 300px; width: 300px;"></td>
                        <th colspan="6" style="font-size: 30pt; text-align: left; color: orange;">
                            <b>${dto.pName }</b></th>
                    </tr>

                    <tr>
                        <td colspan="2"></td>
                        <th style="text-align: left;">한도</th>
                        <th style="text-align: left;">최대</th>
                        <th>${dto.maxAmount }</th>
                        <th colspan="2" style="padding-right: 10pt;">만원</th>

                    </tr>
                    <tr style="font-size: 25px;">
                        <th></th>
                        <td colspan="2" style="font-family: 'OTWelcomeRA';"><b>금리</b></td>
                        <th>최저</th>
                        <th>연</th>
                        <th>${dto.maxRate }</th>
                        <th>%</th>
                    </tr>
                    <tr style="">
                        <th style="text-align: left;"><a href="javascript:fOpen(${dto.pNum});">상세보기</a></th>
                        <td colspan="2" style="text-align: left; "><b>최고</b></td>
                        <th></th>
                        <th>연</th>
                        <th>${dto.minRate }</th>
                        <th>%</th>
                    </tr>
                </table>
                <br/>
            </c:forEach>
        </div>
    </div>
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
</div>

<br/>
<br/>


<jsp:include page="../web/footer3.jsp"/>

</body>
</html>