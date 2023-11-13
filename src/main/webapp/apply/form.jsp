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


        function sendIt() {
            var f = document.myForm;
            var flag = false;

            for (var i = 0; i < f.repay.length; i++) {
                if (f.repay[i].checked) {
                    flag = true;
                    break;
                }
            }

            if (!flag) {
                alert('상환 방식 선택');
                return;
            }

            if (!f.amount.value) {
                alert("금액 입력 필요");
                f.amount.focus();
                return;
            }

            var minA = parseInt('${productDTO.minAmount}') * 10000;
            var maxA = parseInt('${productDTO.maxAmount}') * 10000;
            if (f.amount.value < minA || f.amount.value > maxA) {
                alert('금액 재입력');
                return;
            }


            if (!f.duration.value) {
                alert("기한 입력 필요");
                f.duration.focus();
                return;
            }


            var minP = parseInt('${productDTO.minPeriod}');
            var maxP = parseInt('${productDTO.maxPeriod}');

            if (f.duration.value < minP || f.duration.value > maxP) {
                alert('상황 기간 재입력');
                return;
            }


            f.action = "<%=cp%>/contract/write.do";
            f.submit();

        }
    </script>

    <style type="text/css">

        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
            font-size: 10px;
        }

        .formfont{
            font-family: 'LINESeedKR-Bd';

        }

    </style>


    <title>대출신청서 작성</title>
</head>

<body>
<jsp:include page="../web/header.jsp"/>

<form name="myForm" method="post" class="formfont">
    <div class="wrapper">
        <div class="container">
            <div class="item1">
                <div class="ctitle">대출신청</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 대출 > 대출신청</div>
            </div>
            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">대출신청서작성</div>
                <hr class="hr-3">
            </div>
            <div>
                <br>

                <!-- 시작 -->

                <table align="center">

                    <tr>
                        <td>
                            이름
                        </td>
                        <td>
                            <input type="hidden" name="userName" value="${memberDTO.userName}">${memberDTO.userName}
                        </td>
                    </tr>

                    <tr>
                        <td>
                            생년월일
                        </td>
                        <td>
                            <input type="hidden" name="userName" value="${memberDTO.userBirth}">${memberDTO.userBirth}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            신용점수
                        </td>
                        <td>
                            <input type="hidden" name="credit" value="${memberDTO.credit}">${memberDTO.credit}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            상품이름
                        </td>
                        <td>
                            <input type="hidden" name="pName" value="${productDTO.pName}">${productDTO.pName}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            대출금리
                        </td>
                        <td>
                            <input type="hidden" name="rate" value="${rate}" size="3">${rate}%
                        </td>
                    </tr>
                    <tr>
                        <td>
                            대출한도
                        </td>
                        <td colspan="2">
                            <input type="hidden" name="limit" value="${productDTO.limit}" size="30">${productDTO.limit}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            대출금액
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
                            <input type="hidden" name="period" value="${productDTO.period}">${productDTO.period}
                        </td>
                    </tr>
                    <tr>
                        <td>
                            상환기간
                        </td>
                        <td>
                            <input type="text" name="duration" size="6"
                                   style="border: none; rgba(255, 255, 255, 0); border-bottom: 1px;">개월
                        </td>
                        <td colspan="5" align="right">
                            <input type="button" value="1년" onclick="addToDuration(12)"
                                   style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                            <input type="button" value="2년" onclick="addToDuration(24)"
                                   style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                            <input type="button" value="3년" onclick="addToDuration(36)"
                                   style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                            <input type="button" value="5년" onclick="addToDuration(60)"
                                   style="padding: 10px; width: 50px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                            <input type="button" value="초기화" onclick="addToDuration(-1)"
                                   style="padding: 10px; width: 80px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                        </td>

                    </tr>
                    <tr>
                        <td>
                            상환방식
                        </td>
                        <td colspan="4">
                            <c:forEach var="str" items="${repay}">
                                &nbsp; &nbsp;<input type="radio" name="repay" value="${str}"> &nbsp;${str}

                            </c:forEach>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            중도상환수수료
                        </td>
                        <td>
                            <input type="hidden" name="fee" value="${productDTO.fee}">${productDTO.fee}
                        </td>
                    </tr>

                </table>
                <input type="hidden" name="pNum" value="${productDTO.pNum}">
            </div>
            <div style="display:flex;justify-content: flex-end">
                <input type="button" value="계약서작성하기"
                       onclick="sendIt()"
                       style="padding: 10px; width: 200px; font-family: LINESeedKR-Bd; color:#fff; background-color: black; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            </div>
            <br>
            <br>
        </div>
    </div>
    </div>
</form>

<jsp:include page="../web/footer3.jsp"/>


</footer>
</body>
</html>