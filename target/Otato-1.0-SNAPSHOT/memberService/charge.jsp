<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/membership.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/btn.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/membership.css">
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


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


    <title>캐시충전</title>

    <script>
        function addToAmount(value) {
            var f = document.myForm;
            var currentAmount = parseInt(f.amount.value) || 0;
            var newAmount = currentAmount + value;

            if (value == -1) {
                f.amount.value = "";
                return;
            }
            f.amount.value = newAmount;
        }

        function sendIt() {
            var f = document.myForm;

            if (!f.amount.value) {
                alert('금액 입력');
                f.amount.focus();
                return;
            }

            f.action = "<%=cp%>/membership/charge_ok.do";
            f.submit();
        }

    </script>
</head>
<body>

<jsp:include page="../web/header.jsp"/>


<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">될멤버십</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 될멤버십 > 충전하기</div>
        </div>
        <hr class="hr-1">
        <div class="item2">
            <div class="csubtitle">캐시충전</div>
            <hr class="hr-3">
        </div>


        <form name="myForm" method="post">
            <br/><br/>
            <div style="display: flex; justify-content: center; align-items: center; height: 10vh;">
                <font class="formgroup">충전금액</font>
            </div>
            <br/><br/>

            <div style="display: flex; justify-content: center;">
                <input type="text" name="amount"
                       style="justify-content: center; border: none; border-bottom: 2px solid #fed932;">
            </div>

            <br/><br/><br/>

            <div style="display: flex; justify-content: center;">
                <input type="button" value="1만원" onclick="addToAmount(10000)"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="5만원" onclick="addToAmount(50000)"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="10만원" onclick="addToAmount(100000)"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="100만원" onclick="addToAmount(1000000)"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="초기화" onclick="addToAmount(-1)"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">

            </div>
            <br/><br/>
            <div style="display: flex; justify-content: center;">
                <input type="button" value="충전하기" onclick="sendIt()"
                       style="padding: 20px; width: 150px; font-size: 1.2em; font-family: LINESeedKR-Bd; background-color: var(--bg-color, black); color: var(--text-color, #fed932); border: none; border-radius: 10px; cursor: pointer; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); margin-bottom: 10px; margin-right: 30px;">
                <input type="button" value="이전으로" onclick="location='<%=cp%>/web/main2.jsp'"
                       style="padding: 20px; width: 150px; font-size: 1.2em; font-family: LINESeedKR-Bd; background-color: var(--bg-color, black); color: var(--text-color, #fed932); border: none; border-radius: 10px; cursor: pointer; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); margin-bottom: 10px;">
            </div>
            <br/><br/><br/><br/>

        </form>

    </div>

    <div class="test1">
        <ui class="mainMenu">
            <li class="item" id="account">
                <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">될멤버십</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/login/preauthentication.do">- My 멤버십</a>
                </div>
            </li>
            <li class="item" id="about">
                <a href="#about" class="btn"><i class="fas fa-address-card a_Text">My 캐시</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/membership/charge.do">- 충전하러가기</a>
                    <a href="<%=cp %>/membership/payback.do">- 이번달 상환하러가기</a>
                </div>

            </li>

        </ui>
    </div>

</div>
<jsp:include page="../web/footer3.jsp"/>

</body>
</html>
