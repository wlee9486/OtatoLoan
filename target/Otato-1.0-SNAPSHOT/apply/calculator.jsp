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

    <link rel="stylesheet" type="text/css" href="<%=cp %>/apply/css/banner.css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/apply/css/grid.css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/apply/css/table.css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/apply/css/btn.css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/apply/css/instyle.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../apply/data/form.js"></script>
    <title>Title</title>
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

        function addToDuration(value) {
            var f = document.myForm;
            var current = parseInt(f.duration.value) || 0;
            var newDuration = current + value;

            if (value == -1) {
                f.duration.value = "";
                return;
            }
            f.duration.value = newDuration;
        }

        function addToInterest(value) {
            var f = document.myForm;
            var current = parseInt(f.interest.value) || 0;
            var newInterest = current + value;

            if (value == -1) {
                f.interest.value = "";
                return;
            }
            f.interest.value = newInterest;
        }

        function sendIt() {
            var f = document.myForm;

            if (f.amount.value < 100000) {
                alert('최소 금액 미달');
                f.amount.focus();
                return;
            }
            if (f.amount.value > 100000000) {
                alert('최대 금액 초과');
                f.amount.focus();
                return;
            }

            if (f.duration.value > 10) {
                alert('최대 상환 기간 초과');
                f.duration.focus();
                return;
            }
            if (f.interest.value < 5.9) {
                alert('최소 이율 미달');
                f.interest.focus();
                return;
            }

            var loan = f.amount.value;
            var monthlyInterest = f.interest.value / 100 / 12;
            var period = f.duration.value * 12;

            if (f.r1[0].checked) {
                f.calc.value = Math.floor(loan * monthlyInterest);
            }

            var x = Math.pow((1 + monthlyInterest), -period)
            if (f.r1[1].checked) {
                f.calc.value = Math.floor(loan * monthlyInterest / (1 - x));
            }

            var monthlyLoan = loan / period;
            if (f.r1[2].checked) {
                f.calc.value = Math.floor(monthlyLoan + (loan * monthlyInterest));
            }


        }
    </script>
</head>
<body>
<form name="myForm">

    <table align="center">

        <tr>
            <td>
                대출원금
            </td>
            <td style="padding: none;">
                <input type="text" name="amount" style="border: 1px; border-color:black; width: 120pt;"> 원
            </td>
            <td colspan="5" align="right" style="align-content: right;">
                <input type="button" value="10만원" onclick="addToAmount(100000)"
                       style="padding: 10px; width: 70px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="50만원" onclick="addToAmount(500000)"
                       style="padding: 10px; width: 70px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="100만원" size="6" onclick="addToAmount(1000000)"
                       style="padding: 10px; width: 80px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="1000만원" onclick="addToAmount(10000000)"
                       style="padding: 10px; width: 90px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="초기화" size="6" onclick="addToAmount(-1)"
                       style="padding: 10px; width: 70px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            </td>
        </tr>
        <tr>
            <td>
                대출기간
            </td>
            <td>
                <input type="text" name="duration" size="6"> 년
            </td>
            <td colspan="5" align="right">
                <input type="button" value="1년" onclick="addToDuration(1)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="2년" onclick="addToDuration(2)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="3년" onclick="addToDuration(3)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="5년" onclick="addToDuration(5)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="초기화" onclick="addToDuration(-1)"
                       style="padding: 10px; width: 80px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            </td>
        </tr>
        <tr>
            <td>
                대출금리
            </td>
            <td>
                <input type="text" name="interest" size="6"
                       style="border: none; rgba(255, 255, 255, 0); border-bottom: 1px;">%
            </td>
            <td colspan="5" align="right">
                <input type="button" value="1년" onclick="addToInterest(1)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="2년" onclick="addToInterest(2)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="3년" onclick="addToInterest(3)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="5년" onclick="addToInterest(5)"
                       style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <input type="button" value="초기화" onclick="addToInterest(-1)"
                       style="padding: 10px; width: 80px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            </td>
        </tr>

    </table>
    <%--    대출원금 <input type="text" name="amount">원--%>
    <%--    <input type="button" value="10만원" onclick="addToAmount(100000)">--%>
    <%--    <input type="button" value="50만원" onclick="addToAmount(500000)">--%>
    <%--    <input type="button" value="100만원" onclick="addToAmount(1000000)">--%>
    <%--    <input type="button" value="1000만원" onclick="addToAmount(10000000)">--%>
    <%--    <input type="button" value="초기화" onclick="addToAmount(-1)">--%>
    <%--    <br>--%>

    <%--    대출기간<input type="text" name="duration">년--%>
    <%--    <input type="button" value="1년" onclick="addToDuration(1)">--%>
    <%--    <input type="button" value="2년" onclick="addToDuration(2)">--%>
    <%--    <input type="button" value="3년" onclick="addToDuration(3)">--%>
    <%--    <input type="button" value="5년" onclick="addToDuration(5)">--%>
    <%--    <input type="button" value="초기화" onclick="addToDuration(-1)">--%>
    <%--    <br>--%>

    <%--    대출금리<input type="text" name="interest">%--%>
    <%--    <input type="button" value="1%" onclick="addToInterest(1)">--%>
    <%--    <input type="button" value="2%" onclick="addToInterest(2)">--%>
    <%--    <input type="button" value="3%" onclick="addToInterest(3)">--%>
    <%--    <input type="button" value="5%" onclick="addToInterest(5)">--%>
    <%--    <input type="button" value="초기화" onclick="addToInterest(-1)">--%>
    <%--    <br>--%>

    <div style="display:flex;justify-content: flex-end">
        <input type="button" value="계산하기"
               onclick="sendIt()"
               style="padding: 10px; width: 200px; font-family: LINESeedKR-Bd; color:#fff; background-color: black; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
    </div>
    <br>
    <br>

    <table align="center">
        <tr>
            <td>
                상환방법 및 매월 상환액
            </td>
        </tr>
        <tr>
            <td>
                상환방식
            </td>

            <td colspan="4">
                <input type="radio" name="r1" value="t1" checked="checked"> 만기일시
                <input type="radio" name="r1" value="t2"> 원리금균등
                <input type="radio" name="r1" value="t3"> 원금균등
                <input type="text" name="calc">원
            </td>
        </tr>
        <tr>
            <td>
                상환액(초회차)
            </td>
            <td>
                <input type="text" name="calc">원
            </td>
        </tr>
    </table>
    <div style="display:flex;justify-content: flex-end">
        <input type="button" value="나가기"
               onclick="javascript:window.close()"
               style="padding: 10px; width: 200px; font-family: LINESeedKR-Bd; color:#fff; background-color: black; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
    </div>

</form>
</body>
</html>
