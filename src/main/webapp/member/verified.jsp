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

    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link rel="stylesheet" type="text/css" href="../web/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../web/css/btn.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

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
    <style type="text/css">
        @font-face {
            font-family: 'GangwonEduPowerExtraBoldA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'EF_ladio';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/EF_ladio.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'OTWelcomeRA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'MaplestoryOTFBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/MaplestoryOTFBold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
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

    <title>멤버십가입완료</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>

<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">마이페이지</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 마이페이지 > My멤버십</div>
        </div>
        <hr class="hr-1">
        <div class="item2">
            <div class="csubtitle">My멤버십</div>
            <hr class="hr-3">
        </div>
        <div style="text-align: right;">
            <a href="<%=cp%>\login\updatemem.do"
               style="color: inherit; text-decoration: underline; color:#808080; font-size: 15px;">내 정보 </a><span
                style="color: #808080;">></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
        <br/>
        <div>
            <div style="text-align: center; font-family: 'OTWelcomeRA';"><h2>🥔&nbsp;&nbsp;<span
                    style="color: orange; font-weight: bold;">${sessionScope.customInfo.userName}</span> 님, 오늘도 좋은 하루
                되세요!<br/><br/></h2></div>
        </div>
        <br/>
        <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-family: 'OTWelcomeRA'; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 캐시 정보</span>
        </div>
        <br/>
        <div style="align-items: center; justify-content: center; display: flex;">
            <table style="border: 1px solid grey; width: 900px; height: 100px; padding: 100px; border-collapse : collapse;border-radius : 5px; border-style : hidden;box-shadow : 0 0 0 1px #666; font-family: 'OTWelcomeRA'">
                <tr>
                    <td style="text-align: left;  ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>My
                        cash</b></td>
                    <td style="text-align: right; ">${dto.cash == "0" ? 0 : dto.cash}&nbsp;<b>원</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
        </div>
        <br/>
        <br/>
        <div style="align-items: center; justify-content: center; display: flex;">
            <a href="<%=cp %>/membership/payback.do"><img alt="" src="<%=cp%>\web\img\easyrepay.png" width="300px"></a>
            <a href="<%=cp %>/application/suggestion.do"><img alt="" src="<%=cp%>\web\img\addiloan.png"
                                                              width="300px"></a>
            <a href="<%=cp %>/loan/list.do"><img alt="" src="<%=cp%>\web\img\myloan.png" width="300px"></a>
        </div>
        <br/><br/><br/>
    </div>

    <div class="test1">
        <ui class="mainMenu">
            <li class="item" id="account">
                <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">나의 멤버십</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/login/my.do">-FAQ보러가기</a>
                </div>
            </li>
            <li class="item" id="about">
                <a href="#about" class="btn"><i class="fas fa-address-card a_Text">나의 계정</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/login/updatemem.do">- 정보수정하기</a>
                </div>

            </li>
            <li class="item" id="support">
                <a href="#support" class="btn"><i class="fas fa-user-circle a_Text">나의 대출</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/loan/list.do.do">- 계약상품조회</a>
                </div>
            </li>

        </ui>
    </div>
</div>


<jsp:include page="../web/footer3.jsp"/>

</footer>
</body>
</html>