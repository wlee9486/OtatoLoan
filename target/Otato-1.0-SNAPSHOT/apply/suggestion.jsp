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

    <link rel="stylesheet" type="text/css" href="../apply/css/btn.css">
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="../apply/data/suggest.js"></script>


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

        /* */
        @import url('https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css');
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300..700&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=Lora:wght@400..700&display=swap');

        @font-face{
            font-family: 'Playfair Display', serif;
            src: url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&display=swap');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'SUIT-Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Bold.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }



        :root {
            --color-black: #41423d;
            --color-neutral-100: #f5f4f0; /* select  ư     */
            --color-neutral: #dfddd0;
            --color-primary-100: #fdfdf2; /*    콺  ÷             */
            --color-primary-200: #fafad6; /*    õ   κ       */
            --color-primary: #f8cc01; /*   ư      */
            --color-white: #fbfcfa;
            --text-font-family: 'Inter', sans-serif;
            --title-font-family: 'Lora', serif;
            --title-font-weight: 500;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        html { font: normal 16px/1.5 sans-serif; }

        body {
            background: var(--color-neutral-100);
            color: var(--color-black);
            font-family: var(--text-font-family);
        }

        h1 {
            color: var(--color-primary);
            font-family: var(--title-font-family);
            font-size: 2.5rem;
            font-weight: var(--title-font-weight);
            margin: 0;
        }

        a {
            color: var(--color-primary);
            font-size: .875rem;
            font-weight: 500;
            text-decoration: none;
        }
        a:hover { color: var(--color-primary-500); }

        /*
          main
        */

        main {

            align-items: center;
            display: grid;
            min-height: 100vh;
            padding: 2.5rem;
            width: 100%;
        }

        main .content {
            margin: 0 auto;
            max-width: 1400px;
            width: 100%;
        }

        .main-header { margin: 0 0 2.5rem; }
        .main-header.grid {
            align-items: center;
            display: grid;
            grid-auto-flow: column;
            justify-content: space-between;
        }

        /*
          buttons
        */

        .button {
            background: var(--color-primary);
            border: 0;
            border-radius: .25rem;
            color: var(--color-white);
            cursor: pointer;
            font: inherit;
            font-weight: 500;
            height: 3rem;
            line-height: 3rem;
            padding: 0 2rem;
            /* grid */
            align-items: center;
            display: grid;
            gap: .75rem;
            grid-auto-flow: column;
        }
        .button:hover { background: var(--color-primary-500); }
        .button i { font-size: 1.25rem; }

        .button.icon {
            border-radius: 50%;
            justify-content: center;
            overflow: hidden;
            padding: 0;
            width: 3rem;
        }

        .button.link {
            background: none;
            color: var(--color-primary);
            justify-content: start;
            padding: 0;
        }
        .button.link:hover { color: var(--color-primary-500); }
        .button.link i { font-size: inherit; }

        /*
          cards
        */

        .card { /* ǥ  ׵θ  */
            border: 1px solid var(--color-neutral);
            border-radius: .25rem;
            background: var(--color-white);
            margin: 0 0 2.5rem;
            overflow: auto;
            padding: 1.5rem 1.5rem 2.5rem;
            width: 100%;
            font-family:'Playfair Display', serif;
        }

        /*
          inputs
        */

        .checkbox {
            background: var(--color-white);
            border: 1px solid var(--color-neutral);
            border-radius: .25rem;
            cursor: pointer;
            height: 1.5rem;
            position: relative;
            width: 1.5rem;
        }

        .checkbox input[type="checkbox"] {
            cursor: pointer;
            height: 0;
            opacity: 0;
            position: relative;
            width: 0;
        }

        .checkbox .checkmark::after {
            background: var(--color-primary);
            border: 0;
            border-radius: .25rem;
            color: var(--color-white);
            content: "\f00c";
            display: block;
            font-family: "Font Awesome 6 Free";
            font-size: .75rem;
            font-weight: 900;
            height: 1.5rem;
            width: 1.5rem;

            /* grid */
            display: grid;
            align-items: center;
            justify-content: center;

            /* position */
            position: absolute;
            left: -1px;
            top: -1px;
        }
        .checkbox .checkmark.minus::after { content: "\f068"; }
        .checkbox .checkmark { display: none; }
        .checkbox input[type="checkbox"]:checked ~ .checkmark { display: block; }

        .select {
            background: var(--color-white);
            border: 1px solid var(--color-neutral);
            border-radius: .25rem;
            color: var(--color-black);
            display: inline-block;
            font: inherit;
            height: 3rem;
            margin: 0 1rem 0 0;
            padding: 0 1rem;
            position: relative;
            width: 12rem;
        }

        .select::after {
            content: "\f107";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
            height: 3rem;
            line-height: 3rem;
            padding: 0 1rem;
            position: absolute;
            right: 0;
            top: 0;
        }

        select {
            appearance: none;
            background-color: transparent;
            border: 0;
            cursor: inherit;
            font: inherit;
            height: 3rem;
            margin: 0;
            padding: 0 1rem 0 0;
            width: 100%;
        }

        input[type="number"],
        input[type="text"] {
            background: var(--color-white);
            border: 1px solid var(--color-neutral);
            border-radius: .25rem;
            color: var(--color-black);
            display: inline-block;
            font: inherit;
            height: 3rem;
            margin: 0 .5rem;
            padding: 0 1rem;
            width: 5rem;
        }

        /*
          colors
        */

        .colors {
            display: grid;
            justify-content: start;
            gap: 1.5rem;
            grid-auto-flow: column;
            margin: 2.5rem 0;
        }

        .color { border-radius: 50%; height: 4rem; width: 4rem; }
        .color.black { background: var(--color-black); }
        .color.neutral-100 { background: var(--color-neutral-100); border: 1px solid var(--color-neutral); }
        .color.neutral { background: var(--color-neutral); }
        .color.primary-100 { background: var(--color-primary-100); border: 1px solid var(--color-primary-300); }
        .color.primary-200 { background: var(--color-primary-200); border: 1px solid var(--color-primary-300); }
        .color.primary { background: var(--color-primary); }
        .color.primary-500 { background: var(--color-primary-500); }
        .color.white { background: var(--color-white); border: 1px solid var(--color-neutral); }

        /*
          paging
        */

        .paging.grid {
            align-items: center;
            display: grid;
            gap: .75rem;
            grid-auto-flow: column;
        }

        .paging span { margin: 0 .75rem; }

        /*
          table
        */

        table { border-collapse: collapse; width: 100%; }
        td, th {
            font-size: 1rem;
            text-align: left;
            white-space: nowrap;
        }
        th { padding: 1.5rem 1rem; }
        td { padding: 1rem; }

        tbody tr { cursor: pointer; }
        tbody tr.selected td { background: var(--color-primary-200); }
        tbody tr:hover:not(.selected) td,
        tbody tr.hover:not(.selected) td {
            background: var(--color-primary-100);
        }

        .table-footer, .table-header { font-size: .875rem; }
        .table-footer { margin: -1.5rem 0 0; }
        .table-header { margin: 0 0 1rem; }

        .table-footer.grid,
        .table-header.grid {
            align-items: center;
            display: grid;
            grid-auto-flow: column;
            justify-content: space-between;
        }
        /* */

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }


        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'LINESeedKR-Bd', sans-serif;
        }
        body{

            padding: 0 10px;
        }
        .wrapper{
            max-width: 500px;
            width: 100%;
            background: #fff;
            margin: 20px auto;
            box-shadow: 1px 1px 2px rgba(0,0,0,0.125);
            padding: 30px;
        }

        .wrapper .title{
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 25px;
            text-transform: uppercase;
            text-align: center;
        }

        .wrapper .form{
            width: 100%;
        }

        .wrapper .form .inputfield{
            padding-top:20px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;

        }

        .wrapper .form .inputfield label{
            width: 200px;
            color: #595959;
            margin-right: 10px;
            font-size: 16px;
            font-style: bold;
            font-weight: 700;
        }



        .wrapper .form .inputfield .input,
        .wrapper .form .inputfield .textarea{
            width: 100%;
            outline: none;
            border: 1px solid #d5dbd9;
            font-size: 15px;
            padding: 8px 10px;
            border-radius: 3px;
            transition: all 0.3s ease;

        }

        .wrapper .form .phonefield .input1{
            outline: none;
            border: 1px solid #d5dbd9;
            font-size: 15px;
            padding: 8px 10px;
            border-radius: 3px;
            transition: all 0.3s ease;

        }


        .wrapper .form .inputfield .textarea{
            width: 100%;
            height: 125px;
            resize: none;
        }

        .wrapper .form .phonefield .custom_select{
            display: inline-block;
            width: 100%;
            height: 37px;

        }

        .wrapper .form .phonefield .custom_select:before{
            content: "";
            position: absolute;
            top: 12px;
            right: 10px;
            border: 8px solid;
            border-color: #d5dbd9 transparent transparent transparent;
            pointer-events: none;
            text-align: center;
        }

        .wrapper .form .phonefield .custom_select select{
            -webkit-appearance: none;
            -moz-appearance:   none;
            appearance:        none;
            outline: none;
            width: 15%;
            height: 100%;
            border: 0px;
            padding: 8px 10px;
            font-size: 15px;
            border: 1px solid #d5dbd9;
            border-radius: 3px;
            text-align: center;
        }


        .wrapper .form .inputfield .input:focus,
        .wrapper .form .phonefield .input1:focus,
        .wrapper .form .inputfield .textarea:focus,
        .wrapper .form .inputfield .custom_select select:focus{
            border: 1px solid #fec107;

        }

        .wrapper .form .inputfield p{
            font-size: 14px;
            color: #606060;
            font-style: semi-bold;
        }
        .wrapper .form .inputfield .check{ /*  ǹ   簢 üũ ڽ  */
            width: 20px;
            height: 20px;
            position: relative;
            display: block;
            cursor: pointer;
            padding-right: 10px;
            padding-left: 0px;
        }
        .wrapper .form .inputfield .check input[type="checkbox"]{
            position: absolute;
            top: 0;
            left: 0;
            opacity: 0;

        }
        .wrapper .form .inputfield .check .checkmark{
            width: 20px;
            height: 20px;
            border: 1px solid #fec107;
            display: block;
            position: relative;
        }
        .wrapper .form .inputfield .check .checkmark:before{
            content: "";
            position: absolute;
            top: 1px;
            left: 2px;
            width: 20px;
            height: 2px;
            border: 1px solid;
            border-color: transparent transparent #fff #fff;
            transform: rotate(-45deg);
            display: none;
        }
        .wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark{
            background: #fec107;
        }

        .wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark:before{
            display: block;
        }

        .wrapper .form .inputfield .btn{

            width: 100%;
            margin:auto;
            font-style:bold;
            font-size: 17px;
            border: 0px;
            background:  #fec107;
            color: #fff;
            cursor: pointer;
            border-radius: 10px;
            outline: none;
            height: 50px;
            text-align: center;
            vertical-align: center;
            justify-content: space-between;
        }

        .wrapper .form .inputfield .btn-container {
            width: 50%;

            justify-content: space-between;
        }

        /* .btn-container   Ÿ   */
        .btn-container {

            gap: 20px; /*    ϴ    ư                  */
        }

        /* .btn   Ÿ   */
        .btn {
            font-style: bold;
            font-size: 17px;
            border: 0px;
            background: #fec107;
            color: #fff;
            cursor: pointer;
            border-radius: 10px;
            outline: none;
            height: 50px;
            text-align: center;
            vertical-align: center;
            margin-right: 20px; /*   ư               10px        */
        }


        .wrapper .form .phonefield .btn{
            width: 100%;
            padding: 8px 10px;
            font-size: 15px;
            border: 0px;
            background:  #fec107;
            color: #fff;
            cursor: pointer;
            border-radius: 10px;
            outline: none;
            height: 10px;
        }

        .wrapper .form .inputfield .btn:hover{
            background: #ffd658;
        }

        .wrapper .form .inputfield:last-child{
            margin-bottom: 0;
        }

        @media (max-width:420px) {
            .wrapper .form .inputfield{
                flex-direction: column;
                align-items: flex-start;
            }
            .wrapper .form .inputfield label{
                margin-bottom: 5px;
            }
            .wrapper .form .inputfield.terms{
                flex-direction: row;
            }
        }

        @media (max-width:420px) {
            .wrapper .form .phonefield{
                flex-direction: column;
                align-items: flex-start;
            }
            .wrapper .form .phonefield label{
                margin-bottom: 5px;
            }
            .wrapper .form .phonefield.terms{
                flex-direction: row;
            }
        }


        .radio-buttons {
            display: flex;
            gap: 15px; /*        ư    ۾                     */
            align-items: center; /*        ư    ۾                */
        }

        /*        ư   Ÿ   */
        .radio-buttons input[type="radio"] {
            width: 20px;
            height: 20px;
            margin-right: 5px;
        }

        /*  ۾    Ÿ   */
        .radio-item {
            display: flex;
            align-items: center;
        }

        .radio-label {
            font-size: 16px;
            font-weight: 700;
            font-style: bold;
            color: #595959;
        }

        .inputfield .input-group {
            display: flex;
            align-items: center; /*   ǲ ڽ        Ʈ   ư             */
        }

        .inputfield .input-group .input {
            margin-right: 10px;
        }

        .inputfield .custom_select .input1 {
            margin-right: 10px;
            margin-left: 10px;
            width: 30%;
        }


        .wrapper .form .inputfield input[type="radio"] {
            width: 20px;
            height: 20px;
            padding-right: 10px;
        }

        .wrapper .form .inputfield input[type="radio"]:checked {
            background-color: #fed932; /*    ϴ                */

        /*  ޴     ȣ   ü      */
        /*  ޴     ȣ   ü      */
        .phonefield {
            display: flex;
            align-items: center;
            margin-bottom: 15px; /*    ϴ            */
        }

        .phonefield select {
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            outline: none;
            width: 15%;
            height: 100%;
            border: 1px solid #d5dbd9;
            border-radius: 3px;
            text-align: center;
            padding: 8px 10px;
            font-size: 15px;
            margin-right: 5px; /*    ϴ            */
        }

        .phonefield .input1 {
            width: 70%;
            outline: none;
            border: 1px solid #d5dbd9;
            font-size: 15px;
            padding: 8px 10px;
            border-radius: 3px;
            transition: all 0.3s ease;
        }

        .phonefield .input1:focus {
            border: 1px solid #fec107;
        }



        .wrapper .form .phonefield label{
            width: 200px;
            color: #595959;
            margin-right: 10px;
            font-size: 16px;
            font-style: bold;
            font-weight: 700;
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

        function fOpen(n) {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../product/details.do?pNum=" + n, "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }

        function calc() {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../application/calculator.do", "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }


    </script>

    <title>상세페이지</title>
</head>

<body>
<form name="myForm" method="post">

    <jsp:include page="../web/header.jsp"/>
    <div class="test">
        <div class="container test2">
            <div class="item1">
                <div class="ctitle">대출</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 대출 > 대출상품</div>
            </div>
            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">추천상품</div>
                <hr class="hr-3">
            </div>


            <div style="height: 70pt; display: flex; justify-content: flex-end; align-items: center;">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="금융계산기"
                       onclick="calc()">
            </div>

            <div class="card">
                <table>
                    <thead>
                    <tr>
                        <th>상품명</th>
                        <th>한도</th>
                        <th>금리</th>
                        <th>상세보기</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dto" items="${suggestion}">

                        <tr>
                            <td>
                                <input type="radio" name="suggestionProduct"
                                       value="${dto.pNum}">
                                <img src="<%=cp%>/productList/image/logo2.jpg" class="logo1"
                                     width="15%">
                                <b>${dto.pName }</b>
                            </td>
                            <td>
                                최소 ${dto.minAmount }%
                                <br>
                                최대 ${dto.maxAmount }%
                            </td>
                            <td>
                                최저 연 ${dto.minRate }%
                                <br>
                                최고 연 ${dto.maxRate }%
                            </td>
                            <td>
                                <a class="itemd" href="javascript:fOpen(${dto.pNum});">상세보기</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div style="display: none;" id="lists">
                <div class="item2">
                    <div class="csubtitle">전체상품</div>
                    <hr class="hr-3">
                </div>
                <div class="card">
                    <table>
                        <thead>
                        <tr>
                            <th>상품명</th>
                            <th>한도</th>
                            <th>금리</th>
                            <th>상세보기</th>
                        </tr>
                        </thead>
                        <c:forEach var="dto" items="${totList}" varStatus="status">
                            <tr>
                                <td>
                                    <input type="radio" name="listProduct"
                                           value="${dto.pNum}">
                                    <img src="<%=cp%>/productList/image/logo2.jpg" class="logo1"
                                         width="15%">
                                    <b>${dto.pName }</b>
                                </td>
                                <td>
                                    최소 ${dto.minAmount }%
                                    <br>
                                    최대 ${dto.maxAmount }%
                                </td>
                                <td>
                                    최저 연 ${dto.minRate }%
                                    <br>
                                    최고 연 ${dto.maxRate }%
                                </td>
                                <td>
                                    <a class="itemd" href="javascript:fOpen(${dto.pNum});">상세보기</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>

            <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="전체상품보기" id="allBtn"
                       onclick="showDiv()">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="더보기" id="moreBtn"
                       onclick="showDiv()" style="display: none">
                <input type="button" class="button button--ujarak  button--round-s bg-1f5" value="신청하기"
                       onclick="send()">
            </div>
        </div>

        <!-- test1(사이드바메뉴)시작 -->
        <div class="test1">
            <ui class="mainMenu">
                <li class="item" id="account">
                    <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">대출상품</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/product/list.do">- 대출상품검색</a>
                        <a href="<%=cp %>/application/suggestion.do">- 상품전체조회</a>
                    </div>
                </li>
                <li class="item" id="about">
                    <a href="#about" class="btn"><i class="fas fa-address-card a_Text">대출신청</i></a>
                    <div class="subMenu">
                        <a href="<%=cp %>/application/suggestion.do">상품전체조회</a>
                    </div>

                </li>
                <li class="item" id="support">
                    <a href="<%=cp %>/application/credit.do" class="btn"><i class="fas fa-info a_Text">신용정보조회</i></a>
                </li>
            </ui>
        </div>
        <!-- test1(사이드바메뉴)끝 -->

        <!-- test끝 -->
    </div>

    <%--    <div class="modal fade" id="calculatorModal" tabindex="-1" role="dialog"--%>
    <%--         aria-labelledby="calculatorModalLabel"--%>
    <%--         aria-hidden="true">--%>
    <%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-header">--%>
    <%--                    <h5 class="modal-title" id="calculatorModalLabel">금융 계산기</h5>--%>
    <%--                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
    <%--                        <span aria-hidden="true">&times;</span>--%>
    <%--                    </button>--%>
    <%--                </div>--%>
    <%--                <div class="modal-body">--%>
    <%--                    <!-- Include the contents of calculator.jsp here -->--%>
    <%--                    <jsp:include page="../apply/calculator.jsp"/>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>
</form>
<jsp:include page="../web/footer3.jsp"/>


</footer>
</body>
</html>