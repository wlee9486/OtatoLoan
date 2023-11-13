<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/membership.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/membership.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/btn.css">

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
    <title>충전완료</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>

<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">될멤버십</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 될멤버십 > 캐시충전 및 상환</div>
        </div>
        <hr class="hr-1">
        <div class="csubtitle">캐시 충전 및 상환</div>
        <hr class="hr-3">

        <!-- 충전완료 -->
        <div class="item3">

            <div class="coin">
                <div class="front"></div>
                <div class="front_b"></div>
                <div class="back"></div>
                <div class="back_b"></div>
            </div>

        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/>
        <div style="display: flex; justify-content: center; align-items: center; height: 5vh;">
            <font style="font-family: 'OTWelcomeRA'; font-size: 30pt; text-align: center; position: relative;"><font
                    color="orange"><b>${amount}</b></font>&nbsp;원 충전 완료</font>
        </div>
        <br/><br/>
        <div style="display: flex; justify-content: center; gap: 20px;">
            <input type="button" value="메인으로"
                   style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer;"
                   onclick="location='<%=cp%>/web/main2.jsp'"></div>
        <br/><br/><br/><br/>
    </div>
</div>
<jsp:include page="../web/footer3.jsp"/>

</body>
</html>
