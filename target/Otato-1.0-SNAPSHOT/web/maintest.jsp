<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.17/fullpage.min.css" integrity="sha512-JIWkx/Vz4qw2gIbB6CCH0f8TdElaUt22FCIIytW9C792hpBivsgmsBqoIMtlDTbqLI9mCA+PXw4/v6BCRLbtKw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="<%=cp %>/web/main.css"/>



<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	
	
	<style>
 .carousel-inner > .item > video,
 .carousel-inner > .item > a > video {
      width: 70%;
      margin: auto;
  }
  
.carousel-inner video {
  /* 밝기 조정 (0은 완전히 어둡게, 100은 원래 밝기) */
  filter: brightness(100%);
}

  </style>



</head>
<body>

       <jsp:include page="../web/header.jsp"/>
       
    <div id="fullpage">
        <div class="section">
        
       <!-- 메인 첫페이지 동영상시작 -->
            <div class="slide">
            	<div class="carousel-inner" style="height: 900px;">
      				<div class="item active">
       					<div class="overlay"></div>
      						<video muted autoplay="" loop="" style="width: 100%;"> 
								<source src="./css/1.mp4" type="video/mp4"></source></video>
      							  <div class="carousel-caption">
       									<h3></h3>
        								<p></p>
        							</div>
      											<div class="text-overlay">
      											<h2 style="font-size: 70pt; martext-shadow: 2px 2px 4px rgba(0, 0, 0, 4);" class="mh1">Unlock Your <br/>Financial Potential </h2><br/>
      											<p style="font-size: 40px; font-family: LINESeedKR-Bd';">당신의 꿈을 현실로, 더 나은 미래를 위한 대출 서비스</p>
   				 </div>
     			 </div>
            </div>
           </div>
        
           <!-- 두번째 영상 -->
            <div class="slide">
            	 <div class="item">
      				
      					<video muted autoplay="" loop="" style="width: 100%; height:100%;"> 
					<source src="./css/5.mp4" type="video/mp4"></source></video>
        			<div class="carousel-caption">
        				<h3></h3>
        				<p></p>
        				</div>	
     											 <div class="text-overlay">
      		 <h2 style="font-size: 60pt; margin-right:1400pt;  margin-top:200pt; font-family: 'Poppins'; text-shadow: 2px 2px 4px rgba(0, 0, 0, 2);" class="mh1">Flexible Loans <br>for Your Unique Needs</h2><br/>
      			<p style="font-size: 30px; font-family: Tenada"></p>
    </div>
        </div>
            </div>
            
             <div class="slide">
                <div class="item">

      <video muted autoplay="" loop="" style="width: 100%; "> 
		<source src="./css/2.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
     	 <h2 style="font-size: 60pt; font-family: 'Poppins'; margin-left: 1500pt; 2px 2px 4px rgba(0, 0, 0, 3);" class="mh1">Easy and Fast Loans for Every Situation</h2>
     	 <p style="font-size: 24px;"></p>
    </div>
          </div>
        </div>
            
            <div class="slide">
                <div class="item">
      <div class="overlay"></div>
      <video muted autoplay="" loop="" style="width: 100%; "> 
		<source src="./css/3.mp4" type="video/mp4"></source></video>
        <div class="carousel-caption">
        <h3></h3>
        <p></p>
        </div>
      <div class="text-overlay">
      <h2 style="font-size: 70pt; text-shadow: 2px 2px 4px rgba(0, 0, 0, 3);" class="mh1"></h2>
      <p style="font-size: 24px;"></p>
    </div>
              
    </div> 
            </div>
         </div> <!-- section -->
        
        
        <div class="section" id="section3">
        <img src="<%=cp %>/web/img/메인1.png">
        </div>
        
         
        <div class="section" id="section4"><font class="font1"></font><div>
        <div class="section" id="section5"></div>
    <div class="section"></div>
    </div>
</div>
</div>

 <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.17/fullpage.min.js" integrity="sha512-zAHJKGyoPf2Y20Wi4uo32sa/vSvwKfY4tYUt6gJfmkA79X0wt5ZfaxL5GqJ5cMnmvGslWi5PKTo51rHRZqYbJg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="script.js"></script>

<script type="text/javascript">
new fullpage('#fullpage', {
	  //options here
	  autoScrolling: true,
	  scrollHorizontally: true,
	  sectionsColor: [], // 배경색을 제거함
	  navigation: true,
	  slidesNavigation: true,
	  anchors: ['firstPage', 'secondPage', 'thirdPage', 'finalPage'],
	  navigationTooltips: ['first', 'second']
	});
</script>
<script type="text/javascript">


</script>

<script src="js/script.js"></script>



</body>


</html>