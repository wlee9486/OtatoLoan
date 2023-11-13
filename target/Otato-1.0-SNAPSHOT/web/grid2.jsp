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
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css" href="css/banner.css">
<link rel="stylesheet" type="text/css" href="css/grid.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<script type="text/javascript">
window.addEventListener('scroll', function() {
	  const header = document.querySelector('.header');
	  if (window.scrollY > 0) {
	    header.classList.add('fixed');
	  } else {
	    header.classList.remove('fixed');
	  }
	});
</script>
 
<title>상세페이지</title>
</head>

<body>

  <jsp:include page="./header.jsp"/>
  
  <div class="wrapper">
  <div class="container">
  <div class="item1">	
  	<div class="ctitle">타이틀</div>
  	<div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 타이틀 > 세부속성</div>
  </div>
  <hr class="hr-1">
    <div class="item2">
     <div class="csubtitle">세부타이틀</div>
     <hr class="hr-3">
    </div>
      <div class="item3">본문 css에서의 배경색, 높이 등 조절하세요. 안에서 자유롭게 그리드 기술</div>
	</div>
  </div>
  
  <jsp:include page="./footer3.jsp"/>

  
  </footer>
</body>