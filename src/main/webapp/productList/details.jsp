<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<%=cp%>/productList/css/modal.css"/>
    <script>

        function linkToOpener() {

            var f = document.myForm;

            f.target = "mainWin";
            f.action = "<%=cp%>/application/form.do"
            f.submit();
            self.close();
        }


    </script>

</head>
<body>
<form name="myForm" method="post">
    <div class="container">
        <div class="modal">
            <div class="details">
                <h1 class="title">${dto.pName}</h1>
                <p class="description">${dto.target} 대상</p>
            </div>

            <p class="txt">
                - 최소이율: ${dto.minRate}<br/>
                - 최대이율: ${dto.maxRate}<br/>
                - 대출기간: ${dto.period}<br/>
                - 최대한도: ${dto.limit}<br/>
                - 연체이자율: ${dto.penalty}<br/>
                - 상환방식: ${dto.repay}<br/>
            </p>

            <input type="hidden" value="${dto.pNum}" name="pNum">
            <button class="btn" type="button"
                    onclick="linkToOpener()">신청하기 &rarr;
            </button>

        </div>
    </div>
</form>
</body>
</html>
