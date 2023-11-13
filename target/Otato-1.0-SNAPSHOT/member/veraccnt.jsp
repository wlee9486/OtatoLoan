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
    <html>
    <head>
        <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <style type="text/css">

            .button1:hover {
                border-radius: 30px;
                color: #fed932;
                border-color: #37474f;
            }

            .button1--inverted:hover {
                border-radius: 30px;
                color: #37474F;
                border-color: #fff;
            }

            .button1:hover::before {
                border-radius: 30px;
                opacity: 1;
                -webkit-transform: translate3d(0, 0, 0);
                transform: translate3d(0, 0, 0);
            }

            .button1 {
                border-radius: 30px;
                -webkit-transition: border-color 0.4s, color 0.4s;
                transition: border-color 0.4s, color 0.4s;
            }

            .button1::before {
                border-radius: 30px;
                content: '';
                position: absolute;
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
                border-radius: 30px;
                -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
                transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            }

            .button1 {
                height: 60px;
                border: 2px solid #37474F;
                float: left;
                min-width: 150px;
                max-width: 250px;
                display: block;
                margin: 1em;
                padding: 1em 1em;
                border-radius: 30px;
                background: none;
                color: inherit;
                vertical-align: middle;
                position: relative;
                z-index: 1;
                -webkit-backface-visibility: hidden;
                -moz-osx-font-smoothing: grayscale;
                text-align: center;
            }

            .button1:focus {
                border-radius: 30px;
                outline: none;
            }

            .button1 > span {
                border-radius: 30px;
                vertical-align: middle;
            }

            .button1 {
                border-radius: 30px;
                font-family: LINESeedKR-Bd;
                font-size: 14pt;
                text-align: center;
            }

            @font-face {
                font-family: 'Tenada';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: 'Playfair Display', serif;
                src: url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&display=swap');
                font-weight: normal;
                font-style: normal;
            }


            @font-face {
                font-family: 'SEBANG_Gothic_Bold';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: 'SUIT-Bold';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: 'LINESeedKR-Bd';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
                font-weight: 700;
                font-style: normal;
            }

            @font-face {
                font-family: 'ChosunGs';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGs.woff') format('woff');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: 'KBO-Dia-Gothic_bold';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/KBO-Dia-Gothic_bold.woff') format('woff');
                font-weight: 700;
                font-style: normal;
            }

            @font-face {
                font-family: 'EF_ladio';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/EF_ladio.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
            }

            @font-face {
                font-family: 'OTWelcomeRA';
                src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
                font-weight: normal;
                font-style: normal;
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

            function checkSelectAll() {
                // 약관 수
                const checkboxes
                    = document.querySelectorAll('input[id="term"]');
                // 선택된 라디오
                const checked
                    = document.querySelectorAll('input[id="term"]:checked');
                // select all 체크박스
                const selectAll
                    = document.querySelector('input[name="selectall"]');
                // 인증번호 버튼
                const submitButton
                    = document.getElementById('submitButton');

                if (checkboxes.length === checked.length) {
                    selectAll.checked = true;
                } else {
                    selectAll.checked = false;
                }

                if (selectAll.checked) {
                    submitButton.disabled = false;
                } else {
                    submitButton.disabled = true;
                }

            }

            function selectAll(selectAll) {
                const checkboxes
                    = document.querySelectorAll('input[id="term"]');

                checkboxes.forEach((checkbox) => {
                    checkbox.checked = selectAll.checked;
                });
                checkSelectAll();
            }

        </script>

        <title>멤버쉽소개/가입</title>
    </head>
    <body>

    <jsp:include page="../web/header.jsp"/>

    <div class="test">
        <div class="container test2">
            <div class="ctitle">될멤버십</div>

            <div class="root">
                <a class="aline"
                   href="<%=cp%>/web/main2.jsp"> HOME </a>>&nbsp;될멤버십>&nbsp;멤버십소개/가입
            </div>

            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">멤버십소개/가입</div>
                <hr class="hr-3">
            </div>

            <Br/>

            <!-- 테이블 시작 -->

            <div class="page-title" style="font-family: 'OTWelcomeRA';">
                <h5>OTATO론만의 다양하고 차별화된 온라인 대출서비스를 만나보세요. </h5>
                <h5>고객님을 위한 토탈 금융 라이프 스타일을 제공합니다.<br/><br/></h5>
                <img src="../web/img/membership.png" width="1000px"/>

            </div>

            <br/><br/><br/>
            <!-- board seach area -->
            <div style="font-family: 'OTWelcomeRA';">
                <form action="<%=cp %>/login/authentication.do" name="termsForm" method="post">
                    <div>
                        <input type='checkbox' name='selectall' value='selectall' onclick='selectAll(this)' required/>&nbsp;&nbsp;본인인증약관
                        전체 동의합니다.<br/>
                        <div class="invalid-feedback">
                            본인인증약관에 동의해야합니다.
                        </div>
                    </div>
                    <hr class="hr-3">
                    <span style="color: orange; font-weight: bold;">[필수]</span>&nbsp;&nbsp;본인확인 서비스 이용약관 동의
                    <span style="float: right;">
	  <input type='radio' id="term" name='terms1' value='agg' onclick='checkSelectAll()'/> 동의함 &nbsp;&nbsp;
	  <input type='radio' name='terms1' value='disagg' onclick='checkSelectAll()'/> 동의안함<br/>
	</span>

                    <hr class="hr-3">
                    <span style="color: orange; font-weight: bold;">[필수]</span>&nbsp;&nbsp;고유식별정보 처리 동의
                    <span style="float: right;">
	  <input type='radio' id="term" name='terms2' value='agg' onclick='checkSelectAll()'/> 동의함&nbsp;&nbsp;
	  <input type='radio' name='terms2' value='disagg' onclick='checkSelectAll()'/> 동의안함<br/>
  	 </span>

                    <hr class="hr-3">
                    <span style="color: orange; font-weight: bold;">[필수]</span>&nbsp;&nbsp;이동통신사 이용약관 동의
                    <span style="float: right;">
	  <input type='radio' id="term" name='terms3' value='agg' onclick='checkSelectAll()'/> 동의함&nbsp;&nbsp;
	  <input type='radio' name='terms3' value='disagg' onclick='checkSelectAll()'/> 동의안함<br/>
  	  </span>
                    <hr class="hr-3">
                    <span style="color: orange; font-weight: bold;">[필수]</span>&nbsp;&nbsp;본인확인 개인정보 정보수집 이용동의
                    <span style="float: right;">
	    <input type='radio' id="term" name='terms4' value='agg' onclick='checkSelectAll()'/> 동의함&nbsp;&nbsp;
	    <input type='radio' name='terms4' value='disagg' onclick='checkSelectAll()'/> 동의안함<br/>
 	  </span>

                    <hr class="hr-3">
                    *본인확인 정보를 잘못 입력하거나, OTATO론 대표번호(1899-7979)를 차단한 경우,인증번호가 발송되지 않을 수 있습니다.

                    <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
                        <button type="submit" value=""
                                style="padding: 10px; width: 150px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                            인증번호 요청
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="test1">
            <ui class="mainMenu">
                <li class="item" id="account">
                    <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">될멤버십</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/login/preauthentication.do">- My 멤버십</a>
                    </div>
                </li>
                <li class="item" id="about">
                    <a href="#about" class="btn"><i class="fas fa-address-card a_Text">My 캐시</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/membership/charge.do">- 충전하러가기</a>
                        <a href="<%=cp %>/membership/payback.do">- 이번달 상환하러가기</a>
                    </div>

                </li>

            </ui>
        </div>

        <li class="item" id="support">
            <a href="#support" class="btn"><i class="fas fa-address-card a_Text">- 신용정보조회</i></a>
            <div class="subMenu">
                <a href="<%=cp %>/application/credit.do" class="btn"><i class="fas fa-info a_Text">나의신용점수</i></a>
            </div>
        </li>
        </ui>
    </div>
    </div>

    <br/><br/><br/>
    <br/><br/><br/>

    <!-- 테이블 끝 -->


    <jsp:include page="../web/footer3.jsp"/>

    </body>
    </html>