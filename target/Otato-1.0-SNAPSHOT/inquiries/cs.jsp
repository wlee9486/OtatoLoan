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

    <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/faq.css"/>
    <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/btn.css"/>
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


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
        const items = document.querySelectorAll('.accordion button');

        function toggleAccordion() {
            const itemToggle = this.getAttribute('aria-expanded');
            for (i = 0; i < items.length; i++) {
                items[i].setAttribute('aria-expanded', 'false');
            }
            if (itemToggle == 'false') {
                this.setAttribute('aria-expanded', 'true');
            }
        }

        items.forEach((item) => item.addEventListener('click', toggleAccordion));
    </script>


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
            grid-area: test2;
        }


        /* 남색사각 버튼 */
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
        }

        .button1::before {
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
            -webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
            transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
        }

        .button1 {
            border: 2px solid #37474F;
            float: left;
            min-width: 150px;
            max-width: 250px;
            display: block;
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

        .button1 {
            font-family: LINESeedKR-Bd;
            font-size: 14pt;
            text-align: center;
        }


    </style>

    <title>상세페이지</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>

<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">고객의소리(칭찬/불만/문의)</div>

            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a>>&nbsp;고객센터>&nbsp;고객의소리(칭찬/불만/문의)
            </div>
        </div>

        <br/>
        <hr class="hr-1">
        <br/>
        <div style="height: 150px; margin-top: 0px;">
            <div class="csubtitle">
                <font style="color: #5e5e5e; font-family:'SUIT-Bold'; font-size: 14pt;">문의/제안/칭찬/불만/요청 등 OTATO론에 대한 고객
                    여러분들의 의견을 자유롭게 남겨주실 수 있는 게시판입니다.<br/>
                    (단순 문의 및 요청은 채팅상담 이용도 가능합니다.)<br/>
                    접수해주신 의견은 신속하게 답변 드리겠으며, 고객 여러분들의 소중한 의견은 OTATO론 경영에 적극 반영하도록 노력하겠습니다.<br/>
                    ※ 욕설 및 비방 등 게시판 성격에 맞지 않은 게시물은 삭제될 수 있으니 양해바랍니다.</font>

            </div>
            <br/>

            <br/>
            <div style="padding-left: 300px;">
                <a href="<%=cp %>/inquiry/write.do" class="button1" style="text-decoration: none" ;>
                    고객의견접수
                </a>
                <a href="<%=cp %>/faq/list.do" class="button1" style="text-decoration: none" ;>
                    자주하는질문FAQ
                </a>
            </div>
        </div>
        <!-- 시작 -->


        <hr class="hr-3">

        <div class="faq-articles" style="padding-top: 140px;">

            <article class="faq-accordion">

                <input type="checkbox" class="tgg-title" id="tgg-title-1">
                <div>
                    <font style="color: #5e5e5e; font-family:'SUIT-Bold'; font-size: 15pt; ">※혹시 <B>OTATO</B>론을 사칭한 <b>대출
                        권유전화</b>를 받으셨다면,<B>보이스피싱이 의심되오니</B>,
                        <span style="color: red; text-decoration: underline;">여기</span>에서 신고해 주세요!</font>
                </div>

                <hr class="hr-3">

                <div class="faq-accordion-title" style="padding-top: 10px;">
                    <label for="tgg-title-1">
                        <font style="font-family:'LINESeedKR-Bd'" color="black" size="5pt" ;>
                            Q1.OTATO론을 이용한 적 없는데,대출상품을 안내하는 전화가 왔어요.</font>
                        <span class="arrow-icon">
                <img src="https://raw.githubusercontent.com/Romerof/FAQ-accordion-card/main/images/icon-arrow-down.svg">
              </span>
                    </label>
                </div>

                <div class="faq-accordion-content">
                    <font style="color: #black; font-family:'SUIT-Bold'; font-size: 14pt; ">
                        <span>▶</span> OTATO론은 당사 이용고객 중 마케팅 활동 동의 고객에 한해 연락을 드리고 있습니다.<BR/>
                        당사를<span>이용하지 않는 고객</span>님께서 당사라고 밝히며 <span>대출상품을 안내하는 전화</span>를 받으셨다면
                        <span>당사를 사칭한 금융사기일 확률이 높습니다.</span></font>
                </div>

            </article> <!-- faq accordion -->

            <article class="faq-accordion">

                <input type="checkbox" class="tgg-title" id="tgg-title-2">

                <div class="faq-accordion-title" style="padding-top: 20px;">
                    <label for="tgg-title-2">
                        <font style="font-family:'LINESeedKR-Bd'" color="black" size="5pt" ;>
                            Q2.OTATO론 이용하는 고객인데, 이상한 번호(070)번호,휴대폰 번호 등)로 대출상품 안내전화가 왔어요.</font>
                        <span class="arrow-icon">
                <img src="https://raw.githubusercontent.com/Romerof/FAQ-accordion-card/main/images/icon-arrow-down.svg">
              </span>
                    </label>
                </div>

                <div class="faq-accordion-content">
                    <font style="color: #black; font-family:'SUIT-Bold'; font-size: 14pt; ">
                        <span>▶</span> 당사는 당사 대표번호(1800-5050, 1899-0505)및 각 영업점 전화번호 외 <span>070번호,개인 휴대번호 등
            다른 전화번호로<BR/> 연락을 드리지 않습니다.</span>
                        해당 경우는<span style="text-decoration: underline;">당사를 사칭한 금융사기일 확률이 높습니다.</span></font>
                </div>

            </article> <!-- faq accordion -->

            <article class="faq-accordion">

                <input class="tgg-title" type="checkbox" id="tgg-title-3">

                <div class="faq-accordion-title" style="padding-top: 20px;">
                    <label for="tgg-title-3">

                        <font style="font-family:'LINESeedKR-Bd'" color="black" size="5pt" ;>
                            Q3.OTATO론을 사칭하여 전화하는 사람들을 어떻게 조치해야 할까요?</font>
                        <span class="arrow-icon">
                <img src="https://raw.githubusercontent.com/Romerof/FAQ-accordion-card/main/images/icon-arrow-down.svg">
              </span>
                    </label>
                </div>

                <div class="faq-accordion-content"
                ">
                <font style="color: #black; font-family:'SUIT-Bold'; font-size: 14pt; ">
                    <span>▶</span> <span>불법스팸대응센터</span>(한국인터넷진흥원)의<span>스팸신고 메뉴</span>를 통해 해당 전화번호를 신고할 경우 유무선 통신사로부터
                    발신번호
                    <BR/>소유자의 정보를 제공받아 <span>과태료 등의 행정처분이 가능합니다.</span></font>
        </div>
        <hr style="border: 2px; border-color: #black;">

        </article> <!-- faq accordion -->

    </div> <!-- faq articles -->

    </main> <!-- faq -->

</div> <!-- faq card -->





</div> <!-- card test -->
</div>

<!-- 끝 -->

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<jsp:include page="../web/footer3.jsp"/>
</body>
</html>