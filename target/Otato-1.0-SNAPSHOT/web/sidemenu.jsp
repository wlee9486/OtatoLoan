<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=cp %>/web/css/sidemenu.css">

<title>Insert title here</title>

</head>
<body>

		<div>
        	<h2>대출</h2>
        	<div class="test1">
        	<ui class="mainMenu">
            <li class="item" id="account">
                <a href="#account" class="btn"><i class="fas fa-user-circle"></i>대출상품</a>
                <div class="subMenu">
                    <a href="<%=cp %>/product/list.do">- 대출상품검색</a>
                    <a href="<%=cp %>/application/suggestion.do">- 상품전체조회</a>
                </div>
            </li>
            <li class="item" id="about">
                <a href="#about" class="btn"><i class="fas fa-address-card"></i>대출신청</a>
                <div class="subMenu">
                    <a href="<%=cp %>/application/suggestion.do">상품전체조회</a>
                </div>
                
            </li>
            <li class="item" id="support">
                <a href="<%=cp %>/application/credit.do" class="btn"><i class="fas fa-info"></i>신용정보조회</a>
            </li>
        </ui>
        </div>
    </div>




</body>
</html>