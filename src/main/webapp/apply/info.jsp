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
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">
    <script src="path/to/progressbar.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../apply/css/btn.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <script src="../apply/data/cred.js"></script>
    <script src="https://rawgit.com/kimmobrunfeldt/progressbar.js/1.0.0/dist/progressbar.js"></script>
    <style type="text/css">
        #myProgress {
            width: 100%;
            background-color: #d3d3d3;
        }

        #myBar {
            width: 1%;
            height: 30px;
            background-color: #fed932;
        }
    </style>
    <style type="text/css">

        .test {
            display: grid;
            grid-template-columns: 20% 1fr 20%;
            grid-template-areas:
	"test1 test2 test3";
            gap: 50px;
        }

        .test1 {
            grid-area: test1;
        }

        .test2 {
            grid-area: test2;
        }

        .test3 {
            grid-area: test3;
        }

        .a_Text {
            font-size: 25px;
        }

    </style>
    <script type="text/javascript">
        window.addEventListener('scroll', function () {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        });


        function startProgress(n1) {
            var btn = document.getElementById('btn1');
            btn.style.display = "none";
            document.getElementById("myProgress").style.display = "block";
            var i = 0;
            move(n1);

            setTimeout(() => {

                document.getElementById("demo").innerText = `${dto.credit}점`;
            }, 1000);


            function move(n) {

                var n2 = parseFloat(n) / 10;
                if (i == 0) {
                    i = 1;
                    var elem = document.getElementById("myBar");
                    var width = 1;
                    var id = setInterval(frame, 10);

                    function frame() {
                        if (width >= n2) {
                            clearInterval(id);
                            i = 0;
                        } else {
                            width++;
                            elem.style.width = width + "%";
                        }
                    }

                }

            }
        }

    </script>


    <title>상세페이지</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>

<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">신용점수조회</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 대출 > 신용점수조회</div>
        </div>
        <hr class="hr-1">
        <div class="item2">
            <div class="csubtitle">${sessionScope.customInfo.userName}님의 신용점수</div>
            <hr class="hr-3">
        </div>

        <div>
            <div class="ccontainer chart" data-size="300" data-value="${dto.credit}" data-arrow="down"></div>
        </div>

        <div id="myProgress" style="display: none">
            <div id="myBar"></div>
        </div>
        <br>
        <br>
        <div style="height: 70pt; display: flex; justify-content: center; align-items: center;font-family: LINESeedKR-Bd">
            <br>
            <br>
            <p id="demo" style="font-size: 30pt;">
            </p>
        </div>
        <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
             <button id="btn1" onclick="startProgress(${dto.credit})"
                                    style="position: sticky; padding: 10px; width: 200px;  background-color: #fed932; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                <font class="bg-1f5">조회하기</font></button>
        </div>

        <!-- test1(사이드바메뉴)시작 -->
        <div class="test1">
            <ui class="mainMenu">
                <li class="item" id="account">
                    <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">대출상품</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/product/list.do">- 대출상품검색</a>
                    </div>
                </li>
                <li class="item" id="about">
                    <a href="#about" class="btn"><i class="fas fa-address-card a_Text">대출신청</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/application/suggestion.do">- 맞춤대출신청</a>
                    </div>

                </li>
                <li class="item" id="support">
                    <a href="#support" class="btn"><i class="fas fa-address-card a_Text">신용정보조회</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/application/credit.do">- 나의신용점수</a>
                    </div>
                </li>
            </ui>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="../web/footer3.jsp"/>

</footer>
</body>
</html>

