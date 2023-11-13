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
    <link rel="stylesheet" type="text/css" href="./css/main.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">


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

        <style type="text/css">

                              .button1:hover {
                                  color: #fed932;
                                  border-color: #37474f;
                              }

        .button1--inverted:hover {
            color: #37474F;
            border-color: #fff;
        }
        .button1:hover::before {
            opacity: 1;
            -webkit-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0);
        }

        .button1 {

            -webkit-transition: border-color 0.4s, color 0.4s;
            transition: border-color 0.4s, color 0.4s;
            z-index: 1;
        }
        .button1::before {
            margin-top: 500px;
            content: '';
            position: relative;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #37474F;
            z-index: -1;
            opacity: 0;
            -webkit-transform: scale3d(0.7, 1, 1);
            transform: scale3d(0.7, 1, 1);
            -webkit-transition: -webkit-transform 0.4s, opacity 0.4s;
            transition: transform 0.4s, opacity 0.4s;
            -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
        }

        .button1,
        .button1::before {
            -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
        }

        .button1 {
            margin-top: 500px;
            border: 2px solid #37474F;

            min-width: 150px;
            max-width: 250px;
            display: relative;
            margin: 1em;
            padding: 1em 1em;
            background: none;
            color: inherit;
            vertical-align: middle;
            position: relative;
            z-index: 1;
            -webkit-backface-visibility: hidden;
            -moz-osx-font-smoothing: grayscale;
        }
        .button1:focus {
            outline: none;
        }
        .button1 > span {
            vertical-align: middle;
        }

        .button1{
            font-family: LINESeedKR-Bd;
            font-size: 14pt;
            text-align: center;
        }

        .back {
            background: url(./img/메인12.png);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

    </style>

    <title>Menu</title>
</head>
<body>

<c:if test="${(!empty sessionScope.customInfo.userEmail) && (empty sessionScope.customInfo.authorized) }">
    <div class="alert alert-secondary alert-dismissible fade show" role="alert">
        <marquee direction="down" scrollamount="2" style="text-align: center; font-family: 'LINESeedKR-Bd'">멤버십가입을 완료하기 위해 휴대전화 인증이 필요합니다.
            /login/preauthentication.do" class="alert-link" style="font-family: 'LINESeedKR-Bd'; color: red;">&nbsp; 계정 인증하기
        </marquee>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>


<jsp:include page="../web/header.jsp"/>

<!-- banner start 메인영상  -->
<section1>
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
    </div>
</section1>




<div>
    <img src="<%=cp %>/web/img/메인11.png">
</div>




    <img src="<%=cp %>/web/img/메인12.png" width="100%;" onclick="location='<%=cp%>/store/find.do'"><br>




<script src="js/script.js"></script>

</body>
</html>



