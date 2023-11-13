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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../web2/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../web2/css/btn.css">
    <link rel="stylesheet" href="../web2/css/signup.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <title>회원 수정</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

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
    <style>
        .item2 {

            background-image: url('./data/city.jpg');

            width: 100%;
            height: 100%; /* wrapper와 같은 높이로 설정하여 고정 크기를 유지합니다. */
            background: url('./data/city.jpg') no-repeat center;

        }

        /*
           .container {

               background: url("./img/back.jpg");
               background-size: cover;
             }
           */
        .input-form {

            max-width: 768px;

            height: 700px;

            margin-top: 80px;
            margin-right: 30px;
            padding: 60px 80px;

            border-radius: 20px;

            outline: none;

        }

        form input {
            /*
          background: #eee;
          padding: 16px;
          margin: 8px 0;
          width: 85%;
          */
            border: 0;
            outline: none;
            border-radius: 50px;

        }

        .radio_box {
            display: inline-block;
            *display: inline;
            *zoom: 1;
            position: relative;
            padding-left: 25px;
            margin-right: 10px;
            cursor: pointer;
            font-size: 14px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        /* 기본 라디오 버튼 숨기기 */
        .radio_box input[type="radio"] {
            display: none;
        }

        /* 선택되지 않은 라디오 버튼 스타일 꾸미기 */
        .on {
            width: 20px;
            height: 20px;
            background: #ddd;
            border-radius: 50%;
            position: absolute;
            top: 0;
            left: 0;
        }

        /* 선택된 라디오 버튼 스타일 꾸미기 */
        .radio_box input[type="radio"]:checked + .on {
            background: orange;
        }

        .on:after {
            content: "";
            position: absolute;
            display: none;
        }

        .radio_box input[type="radio"]:checked + .on:after {
            display: block;
        }

        .on:after {
            width: 10px;
            height: 10px;
            background: #fff;
            border-radius: 50%;
            position: absolute;
            left: 5px;
            top: 5px;
        }

    </style>

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

    <script type="text/javascript">

        function isDelete() {
            if (confirm("멤버십을 탈퇴하시겠습니까?")) {
                location.href = "<%=cp%>/login/deletemem.do";
            }
        }

        window.addEventListener('scroll', function () {
            const header = document.querySelector('.header');
            if (window.scrollY > 0) {
                header.classList.add('fixed');
            } else {
                header.classList.remove('fixed');
            }
        });

        const hypenTel = (target) => {
            target.value = target.value
                .replace(/[^0-9]/g, '')
                .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
        }

    </script>

</head>

<body>

<jsp:include page="../web/header.jsp"/>

<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">마이페이지</div>

            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 마이페이지 > 내정보수정</div>
        </div>

        <hr class="hr-1">

        <div class="item2">
            <div class="scontainer">
                <h4 class="mainheader" ;><b>UPDATE ACCOUNT</b></h4>
                <hr class="hr-3">
                <br/>
            </div>
            <div style="display: flex; justify-content: right; align-items: right;"><a onclick="isDelete();">회원탈퇴</a>
            </div>
            <form action="<%=cp%>/login/updatemem_ok.do" class="validation-form" novalidate method="post" name="myForm"
                  style="background-color: #fff; padding: 20px;">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">성명</font>
                        <input type="text" class="form-control" id="name" name="userName" placeholder=""
                               value="${dto.userName }" readonly="readonly" required
                               style="font-family: 'OTWelcomeRA'; font-size: 14pt;">
                        <div class="invalid-feedback">
                            <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">이름을 입력해주세요.</font>
                        </div>
                    </div>

                    <div class="col-md-6 mb-3">
                        <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">비밀번호</font>
                        <input type="text" class="form-control" id="password" name="userPwd" placeholder="비밀번호" value=""
                               required style="font-family: 'OTWelcomeRA'; font-size: 14pt;">
                        <div class="invalid-feedback">
                            <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">비밀번호를 입력해주세요.</font>
                        </div>
                    </div>
                </div>
                <br/>

                <div class="mb-3">
                    <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">E-mail</font>
                    <input type="email" class="form-control" name="userEmail" id="email" value="${dto.userEmail }"
                           placeholder=" " readonly="readonly" required
                           style="font-family: 'OTWelcomeRA'; font-size: 14pt;">
                    <div class="invalid-feedback">
                        <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">올바른 이메일을 입력해주세요.</font>
                    </div>
                </div>
                <br>

                <div class="mb-3">
                    <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">생년월일</font>
                    <input type="date" class="form-control" name="userBirth" id="birth" placeholder="생년월일 [YYYY-MM-DD]"
                           value="${dto.userBirth }" required style="font-family: 'OTWelcomeRA'; font-size: 14pt;">
                    <div class="invalid-feedback">
                        <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">올바른 생년월일을 입력해주세요.</font>
                    </div>
                </div>
                <br/>

                <div class="mb-3">
                    <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">성별</font><br/><br/>
                    <input type="radio" name="gender" value="여" ${dto.gender == '여' ? 'checked' : ''}/><font
                        style="font-family: 'OTWelcomeRA'; font-size: 15pt;">&nbsp;&nbsp;여자&nbsp;&nbsp;</font>
                    <input type="radio" name="gender" value="남" ${dto.gender == '남' ? 'checked' : ''}/><font
                        style="font-family: 'OTWelcomeRA'; font-size: 15pt;">&nbsp;남자</font>
                </div>
                <br/>

                <div class="mb-3">
                    <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">휴대폰 번호 입력</font>
                    <div class="input-group mb-1">
                        <select class="form-select" id="inputGroupSelect01" name="carrier" required
                                style="font-family: 'OTWelcomeRA'; ">

                            <option ${dto.carrier == 'SKT' ? 'selected' : ''}>SKT</option>
                            <option ${dto.carrier == 'KT' ? 'selected' : ''}>KT</option>
                            <option ${dto.carrier == 'LG U+' ? 'selected' : ''}>LGU+</option>
                            <option ${dto.carrier == 'SKT 알뜰폰' ? 'selected' : ''}>SKT알뜰폰</option>
                            <option ${dto.carrier == 'KT 알뜰폰' ? 'selected' : ''}>KT알뜰폰</option>
                            <option ${dto.carrier == 'LG U+ 알뜰폰' ? 'selected' : ''}>LGU+알뜰폰</option>
                        </select>

                        <input type="text" class="form-control" id="tel" name="userTel" value="${dto.userTel }"
                               placeholder="휴대전화번호" oninput="hypenTel(this)" maxlength="13" required
                               style="font-family: 'OTWelcomeRA'; font-size: 14pt;">
                        <div class="invalid-feedback">
                            <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">휴대전화정보를 입력해주세요.</font>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <div class="custom-control custom-checkbox"
                         style="display: flex; justify-content: right; align-items: right;">
                        <input type="checkbox" class="custom-control-input" id="agreement" name="marketingYn"
                               value="Y" ${dto.marketingYn == 'Y' ? 'checked' : ''}>
                        <label class="custom-control-label" for="agreement">
                            <font style="font-family: 'OTWelcomeRA'; font-size: 15pt;">[선택] 마케팅 수신 동의</font>
                        </label>
                    </div>

                    <div class="mb-4">
                        <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
                            <button type="submit" value="수정완료"
                                    style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                                수정완료
                            </button>
                        </div>
                    </div>


            </form>


            <div class="test1">
                <ui class="mainMenu">
                    <li class="item" id="account">
                        <a href="#account" class="btn"><i class="fas fa-user-circle a_Text">나의 멤버십</i></a>
                        <div class="subMenu">
                            <a href="<%=cp %>/login/my.do">-FAQ보러가기</a>
                        </div>
                    </li>
                    <li class="item" id="about">
                        <a href="#about" class="btn"><i class="fas fa-address-card a_Text">나의 계정</i></a>
                        <div class="subMenu">
                            <a href="<%=cp %>/login/updatemem.do">- 정보수정하기</a>
                        </div>

                    </li>
                    <li class="item" id="support">
                        <a href="#support" class="btn"><i class="fas fa-user-circle a_Text">나의 대출</i></a>
                        <div class="subMenu">
                            <a href="<%=cp %>/loan/list.do.do">- 계약상품조회</a>
                        </div>
                    </li>

                </ui>
            </div>
        </div>
    </div>
</div>
</div>

<script>
    window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        });
    }, false);
</script>

<jsp:include page="../web/footer3.jsp"/>

</body>
</html>