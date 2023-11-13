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
    <link rel="stylesheet" type="text/css" href="<%=cp %>/faqs/css/grid2.css"/>
    <link rel="stylesheet" type="text/css" href="<%=cp %>/faqs/css/btn.css"/>
    <link rel="stylesheet" type="text/css" href="<%=cp %>/faqs/css/faqlist.css"/>
    <link rel="stylesheet" type="text/css" href="<%=cp %>/faqs/css/faq.css"/>
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
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
    </script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const faqList = document.getElementById("faqList");
            const radioButtons = document.querySelectorAll("input[type='radio'][name='fTag']");

            function hideAllDivs() {
                faqList.querySelectorAll("div.faq").forEach(function (div) {
                    div.style.display = "none";
                });
            }

            function showSelectedDiv(tagValue) {
                const selectedDiv = faqList.querySelector("div.faq[data-tag='" + tagValue + "']");
                if (selectedDiv) {
                    selectedDiv.style.display = "block";
                }
            }

            radioButtons.forEach(function (radioButton) {
                radioButton.addEventListener("change", function () {
                    const selectedTagValue = this.value;
                    hideAllDivs();
                    showSelectedDiv(selectedTagValue);
                });
            });

            // Initially, hide all divs and show the first one
            hideAllDivs();
            showSelectedDiv(radioButtons[0].value);
        });
    </script>


    <title>자주하는질문FAQ</title>
</head>
<body>
<jsp:include page="../web/header.jsp"/>

<div id="h">
</div>
<div class="test">
    <div class="container123 test2">
        <div class="item1">
            <div class="ctitle">자주하는질문FAQ</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 고객센터 > 고객지원 > 자주하는질문FAQ</div>
        </div>
        <div class="item2">
            <hr class="hr-3">
        </div>


        <div class="tabs">
            <div id="faqList">
                <div id="btn">
                    <input type="radio" name="fTag" id="tabone" value="예·적금" checked="checked">
                    <label for="tabone">예·적금</label>

                    <input type="radio" name="fTag" id="tabtwo" value="대출">
                    <label for="tabtwo">대출</label>

                    <input type="radio" name="fTag" id="tabthree" value="앱서비스">
                    <label for="tabthree">앱서비스</label>

                    <input type="radio" name="fTag" id="tabfour" value="보안설정">
                    <label for="tabfour">보안설정</label>

                    <input type="radio" name="fTag" id="tabfive" value="기타">
                    <label for="tabfive">기타</label>
                </div>

                <hr class="hr-3">
                <br>
                <!-- Add the FAQ content divs with class "faq" and data-tag attribute -->
                <div class="faq" data-tag="예·적금">
                    <!-- Loop through the list for the "예·적금" tag and display the contents -->
                    <c:forEach items="${faqMap['예·적금']}" var="faq">
                        <div id=subject>
                            <h5 style="font-family: 'LINESeedKR-Bd';">${faq.fSubject}</h5>
                            <p style="font-family: 'Pretendard-Regular';">${faq.fContent}</p>
                        </div>
                    </c:forEach>
                </div>

                <div class="faq" data-tag="대출">
                    <!-- Loop through the list for the "대출" tag and display the contents -->
                    <c:forEach items="${faqMap['대출']}" var="faq">
                        <div id=subject>
                            <h5 style="font-family: 'LINESeedKR-Bd';">${faq.fSubject}</h5>
                            <p style="font-family: 'Pretendard-Regular';">${faq.fContent}</p>
                        </div>
                    </c:forEach>
                </div>

                <!-- Add similar <div> blocks for other tags: 앱서비스, 보안설정, 기타 -->
                <div class="faq" data-tag="앱서비스">
                    <!-- Loop through the list for the "앱서비스" tag and display the contents -->
                    <c:forEach items="${faqMap['앱서비스']}" var="faq">
                        <div id=subject>
                            <h5 style="font-family: 'LINESeedKR-Bd';">${faq.fSubject}</h5>
                            <p style="font-family: 'Pretendard-Regular';">${faq.fContent}</p>
                        </div>
                    </c:forEach>
                </div>

                <div class="faq" data-tag="보안설정">
                    <!-- Loop through the list for the "보안설정" tag and display the contents -->
                    <c:forEach items="${faqMap['보안설정']}" var="faq">
                        <div id=subject>
                            <h5 style="font-family: 'LINESeedKR-Bd';">${faq.fSubject}</h5>
                            <p style="font-family: 'Pretendard-Regular';">${faq.fContent}</p>
                        </div>
                    </c:forEach>
                </div>

                <div class="faq" data-tag="기타">
                    <!-- Loop through the list for the "기타" tag and display the contents -->
                    <c:forEach items="${faqMap['기타']}" var="faq">
                        <div id=subject>
                            <h5 style="font-family: 'LINESeedKR-Bd';">${faq.fSubject}</h5>
                            <p style="font-family: 'Pretendard-Regular';">${faq.fContent}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <br/>
        <br/>
        <hr class="hr-3">

        <br/>
        <br/>
        <br/>

    </div>
    <div class="test1">
        <ui class="mainMenu">
            <li class="item" id="account">
                <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">고객지원</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/faq/list.do">- FAQ보러가기</a>
                </div>
            </li>
            <li class="item" id="about">
                <a href="#about" class="btn"><i class="fas fa-address-card a_Text">1:1 문의</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/inquiry/write.do">- 문의하기</a>
                    <a href="<%=cp %>/inquiry/list.do">- 나의 문의내역</a>
                </div>

            </li>
            <li class="item" id="support">
                <a href="#support" class="btn"><i class="fas fa-user-circle a_Text">감자될론 지점</i></a>
                <div class="subMenu">
                    <a href="<%=cp %>/store/find.do">- 지점찾기</a>
                </div>
            </li>

        </ui>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</footer>


</body>
</html>