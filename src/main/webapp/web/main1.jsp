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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/banner.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
  .carousel-inner > .item > video,
  .carousel-inner > .item > a > video {
      width: 70%;
      margin: auto;
  }
  </style>

<title>Menu</title>
</head>
<body>
 
	<!-- header start -->
	<header class="header">
	<div class="container">
		<div class="row v-center">
			<div class="header-item item-left">
				<div class="logo">
					<a href="#"> <img src="<%=cp%>/web/img/로고2.jpg" width="150px"
						height="35px">

					</a>
				</div>
			</div>
			<!-- menu start here -->
			<div class="header-item item-center">
				<div class="menu-overlay"></div>
				<nav class="menu">
				<div class="mobile-menu-head">
					<div class="go-back">
						<i class="fa fa-angle-left"></i>
					</div>
					<div class="current-menu-title"></div>
					<div class="mobile-menu-close">&times;</div>
				</div>
				<ul class="menu-main">
					<li class="menu-item-has-children">
						<a href="#">대출신청<i class="fa fa-angle-down"></i></a>
						<div class="sub-menu mega-menu mega-menu-column-4">
							<div class="list-item">
								<img src="./img/카드.jpg">
							</div>
							<div class="list-item-text">
								<img src="./img/글씨.jpg">
								<div class="separator"></div>	
							</div>
							<div class="list-item">
							
								<h4 class="title">대출신청</h4>
								<ul>
									<li><a href="#">대출상품조회</a></li>
									<li><a href="#">통합한도조회</a></li>
									<li><a href="#">추가/재대출</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="menu-item-has-children">
						<a href="#">대출조회<i class="fa fa-angle-down"></i></a>
						<div class="sub-menu mega-menu mega-menu-column-4">
							<div class="list-item">
								<img src="./img/카드.jpg">
							</div>
							<div class="list-item-text">
								<img src="./img/글씨.jpg">
								<div class="separator"></div>	
							</div>
							<div class="list-item">
							
								<h4 class="title">대출관리</h4>
								<ul>
									<li><a href="#">계약조회</a></li>
									<li><a href="#">상환관리</a></li>
									<li><a href="#">대출이용내역조회</a></li>
									<li><a href="#">추가기능한도조회</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="menu-item-has-children">
						<a href="#">될멤버십<i class="fa fa-angle-down"></i></a>
						<div class="sub-menu mega-menu mega-menu-column-4">
							<div class="list-item">
								<img src="./img/카드.jpg">
							</div>
							<div class="list-item-text">
								<img src="./img/글씨.jpg">
								<div class="separator"></div>	
							</div>
							<div class="list-item">
							
								<h4 class="title">멤버십관리</h4>
								<ul>
									<li><a href="#">멤버십소개</a></li>
									<li><a href="#">잔액관리</a></li>
									<li><a href="#">잔액관리</a></li>
									<li><a href="#">캐시내역</a></li>
									<li><a href="#">나의전자서명</a></li>
								</ul>
							</div>
						</div>
					</li>
						<li class="menu-item-has-children">
						<a href="#">고객센터<i class="fa fa-angle-down"></i></a>
						<div class="sub-menu mega-menu mega-menu-column-4">
							<div class="list-item">
								<img src="./img/카드.jpg">
							</div>
							<div class="list-item-text">
								<img src="./img/글씨.jpg">
								<div class="separator"></div>	
							</div>
							<div class="list-item">
							
								<h4 class="title">고객문의</h4>
								<ul>
									<li><a href="#">1:1문의</a></li>
									<li><a href="#">자주묻는질문</a></li>
								
								</ul>
							</div>
						</div>
					</li>
						<li class="menu-item-has-children">
						<a href="#">마이페이지<i class="fa fa-angle-down"></i></a>
						<div class="sub-menu mega-menu mega-menu-column-4">
							<div class="list-item">
								<img src="./img/카드.jpg">
							</div>
							<div class="list-item-text">
								<img src="./img/글씨.jpg">
								<div class="separator"></div>	
							</div>
							<div class="list-item">
							
								<h4 class="title">마이페이지</h4>
								<ul>
									<li><a href="#">내정보수정</a></li>
									<li><a href="#">신용점수조회</a></li>
									<li><a href="#">최근조회한상품</a></li>
									<li><a href="#">내대출상품조회</a></li>
								
								</ul>
							</div>
						</div>
					</li>
				</ul>
				</nav>
			</div>
			<!-- menu end here -->
			<div class="header-item item-right">
				<a href="#"><font size="bold">로그인&nbsp;&nbsp;</font></a>

				<!-- mobile menu trigger -->
				<div class="mobile-menu-trigger">
					<span></span>
				</div>
			</div>
		</div>
	</div>
	</header>
	<!-- header end -->
 <!-- banner start -->
 
 	<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 700px;">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" style="height: 700px;">
      <div class="item active">
       <div class="overlay"></div>
      <video muted autoplay="" loop="" style="width: 100%; height:60%; "> 
		<source src="./css/1.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
      <h2 style="font-size: 70pt; text-shadow: 2px 2px 4px rgba(0, 0, 0, 4);" class="mh1">Unlock Your <br/>Financial Potential </h2><br/>
      <p style="font-size: 40px; font-family: LINESeedKR-Bd';">당신의 꿈을 현실로, 더 나은 미래를 위한 대출 서비스</p>
    </div>
        
      </div>
      

 
      <div class="item">
      <div class="overlay"></div>
      <video muted autoplay="" loop="" style="width: 100%;"> 
		<source src="./css/5.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
      <h2 style="font-size: 60pt; font-family: 'Poppins'; text-shadow: 2px 2px 4px rgba(0, 0, 0, 2);"">Flexible Loans for Your Unique Needs</h2><br/>
      <p style="font-size: 30px; font-family: Tenada"></p>
    </div>
        
        </div>

    
      <div class="item">

      <video muted autoplay="" loop="" style="width: 100%; "> 
		<source src="./css/2.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
      <h2 style="font-size: 60pt; font-family: 'Poppins'; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Easy and Fast Loans for Every Situation</h2>
      <p style="font-size: 24px;"></p>
    </div>
        
        </div>
      
    
      <div class="item">
      <div class="overlay"></div>
      <video muted autoplay="" loop="" style="width: 100%; "> 
		<source src="./css/3.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
      <h2 style="font-size: 70pt; text-shadow: 2px 2px 4px rgba(0, 0, 0, 3);" class="mh1">Your Trusted Source <br/>for Personalized Loans</h2>
      <p style="font-size: 24px;"></p>
    </div>
              
    </div>  
    
    
 </div>


    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
 	

 <!-- banner end -->

<script src="js/script.js"></script>
</body>
</html>



