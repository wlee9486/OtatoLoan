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
    <link rel="stylesheet" type="text/css" href="<%=cp %>/web/css/writesign.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../apply/data/form.js"></script>
    <script type="text/javascript" src="../pcontract/js/sign.js"></script>



    <script type="text/javascript">
        window.addEventListener('scroll', function () {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        });

        function sendIt() {
            var f = document.myForm
            f.action = "<%=cp%>/contract/write_ok.do";
            f.submit();
        }
    </script>

    <style type="text/css">
        .cbutton--round-s {
            border-radius: 30px;
            border: 2px solid;
            font-weight: 600;
            background-color: #ffc107;
            font-family: 'LINESeedKR-Bd';


    </style>

    <title>상세페이지</title>
</head>

<body>
<jsp:include page="../web/header.jsp"/>


<form name="myForm" method="post">
    <div class="wrapper">
        <div class="container">
            <div class="item1">
                <div class="ctitle">대출신청</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 대출 > 대출신청</div>
            </div>
            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">계약서작성</div>
                <hr class="hr-3">
            </div>
            <div>
                <br>

                <div class="email">
                    <eh>대출계약서</eh>
                    <hr style="border-width: 4px; border-color: black;">
                    <!-- 시작 -->
                    <ep>
                        <table align="center">

                            <tr>
                                <td width="50%">
                                    <font style="border-right: 5px;">채무자</font>
                                </td>
                                <td>
                                    <input type="hidden" name="userName" value="${memberDTO.userName}">${memberDTO.userName}
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    신청상품
                                </td>
                                <td>
                                    <input type="hidden" name="pName" value="${productDTO.pName }">${productDTO.pName }
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    대출금액
                                </td>
                                <td>
                                    <input type="hidden" name="amount" value="${amount }">${amount }원
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    대출기간
                                </td>
                                <td>
                                    <input type="hidden" name="duration" value="${duration }">${duration }개월
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    상환이자율
                                </td>
                                <td>
                                    <input type="hidden" name="rate" value="${rate }">${rate }%
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    대출계약일
                                </td>
                                <td>
                                    <input type="hidden" name="signed" value="${signed}">${signed}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    대출만기일
                                </td>
                                <td>
                                    <input type="hidden" name="endDate" value="${endDate}">${endDate}
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    상환 방식
                                </td>
                                <td>
                                    <input type="hidden" name="repay" value="${repay}">${repay}
                                </td>
                            </tr>
                        </table>

                        <input type="hidden" name="pNum" value="${productDTO.pNum}">
                        <jsp:include page="../pcontract/sign.jsp">
                            <jsp:param name="myForm" value="${myForm}"/>
                        </jsp:include>
                </div>

                <div style="display:flex;justify-content: flex-end; font-family: 'LINESeedKR-Bd'; ba" >
                    <input type="button" class="button button--ujarak  button--round-s " value="계약" onclick="sendIt()"/>
                    <input type="button" class="button button--ujarak  button--round-s " value="계약취소"
                           onclick="location='<%=cp%>';"/>
                    </ep>
                </div>
            </div>
            <br>
            <br>
        </div>
    </div>
</form>

<jsp:include page="../web/footer3.jsp"/>


</footer>
</body>
</html>