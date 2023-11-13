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
<link rel="stylesheet" type="text/css" href="./css/btn.css">

<title>버튼</title>
</head>
<body>

<!-- bg-1 사각버튼 / bg-2 둥근버튼 -->

<h2>버튼</h2>
   <div class=" bg-1">
      <button class="button button--ujarak button--border-thin ">Publish</button>
       <button class="button button--ujarak button--border-thin ">Vote</button>
       <button class="button button--ujarak button--border-thin ">Delete</button>
    </div>
    <div class=" bg-2">
       <button class="button button--ujarak  button--round-s ">Publish</button>
       <button class="button button--ujarak  button--round-s ">Vote</button>
       <button class="button button--ujarak button--round-s ">Delete</button>
     </div>


</body>
</html>