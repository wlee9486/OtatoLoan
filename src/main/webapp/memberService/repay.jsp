<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="./css/membership.css">
    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link rel="stylesheet" type="text/css" href="../web/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/btn.css">
    <link rel="stylesheet" type="text/css" href="../memberService/css/membership.css">
    <link rel="stylesheet" type="text/css" href="../web/css/table.css">
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

    <title>대출금 상환</title>
    <script>
        function sendIt() {
            var f = document.myForm;
            var flag = false;
            var selectedPayment = 0;


            var pNames = document.getElementsByName('uNum');
            for (var i = 0; i < pNames.length; i++) {
                if (pNames[i].checked) {
                    flag = true;
                    var dtoPayment = document.getElementsByName('payment')[i].value;
                    selectedPayment = parseInt(dtoPayment);
                    break;
                }
            }

            if (!flag) {
                alert('상환할 상품을 선택해주세요');
                return;
            }

            var cash = parseInt('${cash}');

            if (selectedPayment > cash) {
                alert('충전 후 상환하세요')
                return;
            }

            f.fPay.value = selectedPayment;
            f.action = "<%=cp%>/membership/payback_ok.do";
            f.submit();
        }
    </script>

</head>
<body>

<jsp:include page="../web/header.jsp"/>

<form name="myForm" method="post">
    <div class="test">
        <div class="container test2">
            <div class="item1">
                <div class="ctitle">될멤버십</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 될멤버십 > 대출금 상환</div>
            </div>
            <hr class="hr-1">
            <div class="csubtitle">상환하기</div>
            <hr class="hr-3">


            <div class="item4">
                <form name="myForm" method="post">
                    <br/><br/>
                    <table style="width: 100%; border-collapse: collapse;">
                        <tr style="padding-left: 30pt;">
                            <td style="border-bottom: 2px solid #999; text-align: center; padding: 10px;background-color: transparent;">
                                <font class="formgroup">선택</font>
                            </td>
                            <td style="border-bottom: 2px solid #999; text-align: center; padding: 10px; background-color: transparent;">
                                <font class="formgroup">상환금액</font>
                            </td>
                        </tr>
                        <c:forEach var="dto" items="${userloanDTOS}">
                            <tr>
                                <td colspan="1" style="text-align: center; padding: 10px;">
                                    <input type="radio" name="uNum" value="${dto.uNum}" style="align-content: left;">
                                    <font class="formgroup">${dto.pName}</font>
                                </td>
                                <td>
                                    <input type="text" value="${dto.payment}" name="payment"
                                           style="border: none; justify-content: space-evenly;">
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </form>
            </div>

            <br/><br/>


            <div style="display: flex; justify-content: center;">
                <input type="hidden" value="" name="fPay">
                <input type="hidden" value="${cash}" name="cash" style="border: none;">

                <input type="button" value="충전하기" onclick="location='<%=cp%>/membership/charge.do'"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="상환하기" onclick="sendIt()"
                       style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            </div>
        </div>
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

    <br/><br/><br/><br/>
</form>

<jsp:include page="../web/footer3.jsp"/>

</body>
</html>