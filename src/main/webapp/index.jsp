<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>main</title>

</head>
<body>
<form method="post" name="myForm">

    <a href="<%=cp %>/login/login.do">로그인</a>
    <!--- ------------------------------------------------------------------------------------------->
    <a href="<%=cp%>/product/list.do">대출상품</a>
    <br>
    <a href="<%=cp %>/application/suggestion.do"> 대출신청 </a>
    <br>
    <a href="<%=cp %>/application/credit.do">신용조회</a>
    <br>
    <!--- ------------------------------------------------------------------------------------------->
    <a href="<%=cp %>/login/preauthentication.do">멤버십소개</a>
    <br>
    <a href="<%=cp %>/membership/charge.do">캐시충전</a>
    <br>
    <a href="<%=cp %>/membership/payback.do">대출금상환</a>
    <!--- ------------------------------------------------------------------------------------------->
    <a href="<%=cp%>/faq/list.do">고객센터</a>
    <br>
    <a href="<%=cp%>/inquiry/cs.do">1:1 문의</a>
    <br>
    <a href="<%=cp%>/inquiry/list.do">나의문의 내역</a>
    <br>
    <a href="<%=cp%>/store/find.do">지도</a>
    <!--- ------------------------------------------------------------------------------------------->
    <a href="<%=cp %>/login/updatemem.do">내정보수정</a>
    <br>
    <a href="<%=cp%>/loan/list.do">내 대출사움</a>
    <br>
    <a href="<%=cp%>/loan/clicked.do">최근조회한상품</a>
</form>
</body>
</html>