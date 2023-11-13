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
    <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/instyle.css">



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
    <script type="text/javascript">

        function sendIt() {

            var f = document.myForm;

            str = f.iSubject.value;
            str = str.trim();
            if (!str) {
                alert("\n제목을 입력하세요.");
                f.iSubject.focus();
                return;
            }
            f.iSubject.value = str;

            str = f.iContent.value;
            str = str.trim();
            if (!str) {
                alert("\n내용을 입력하세요.");
                f.iContent.focus();
                return;
            }
            f.iContent.value = str;

            var flag = false;
            for (var i = 0; i < 5; i++) {
                if (f.iTag.checked) {
                    var cat = f.iTag[i].value;
                    flag = true;
                }

            }

            if (!flag) {
                alert('태그를 선택해주세요');
                return;
            }
            f.action = "<%=cp%>/inquiry/write_ok.do";
            f.submit();

        }

    </script>


    </style>
    <title>1:1문의</title>
</head>
<body>
<form action="" method="post" name="myForm">

    <jsp:include page="../web/header.jsp"/>

    <div class="wrapper">
        <div class="container">
            <div class="item1">
                <div class="ctitle">고객의소리(칭찬/불만/문의)</div>

                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a>>&nbsp;고객센터>&nbsp;고객의소리(칭찬/불만/문의)
                </div>
            </div>

            <br/>
            <hr class="hr-1">
            <br/>
            <div class="csubtitle" style="text-align: center; font-size: 30pt;">
                고객 의견 접수
            </div>
            <br/>
        </div>


        <!-- 시작 -->

        <div class="wrapper">
            <div class="form">
                <div class="inputfield">
                    <label>유형</label>


                    <div class="radio-buttons">
                        <div class="radio-item">
                            <input type="radio" name="iTag" value="예·적금" ${iTag == '예·적금'? 'checked':''}>
                            <span class="radio-label">예·적금</span>
                        </div>


                        <div class="radio-item">
                            <input type="radio" name="iTag" value="대출" ${iTag == '대출'? 'checked':''}>
                            <span class="radio-label">대출</span>
                        </div>

                        <div class="radio-item">
                            <input type="radio" name="iTag" value="앱서비스" ${iTag == '앱서비스'? 'checked':''}>
                            <span class="radio-label">앱서비스</span>
                        </div>

                        <div class="radio-item">
                            <input type="radio" name="iTag" value="보안설정" ${iTag == '보안설정'? 'checked':''} >
                            <span class="radio-label">보안설정</span>
                        </div>

                        <div class="radio-item">
                            <input type="radio" name="iTag" value="기타" ${iTag == '기타'? 'checked':''} >
                            <span class="radio-label">기타</span>
                        </div>
                    </div>


                </div>
                <div class="inputfield">
                    <label>이메일주소</label>
                    <input type="text" class="input" name="userEmail">
                </div>

                <div class="inputfield">
                    <label>비밀번호</label>
                    <input type="password" class="input" name="iPwd">
                </div>
                <div class="inputfield">
                    <label>제목</label>
                    <input type="text" class="input" name="iSubject">
                </div>


                <div class="inputfield">
                    <label>내용</label>
                    <textarea class="textarea" name="iContent" style="resize: none;"></textarea>
                </div>

                <div class="inputfield terms">
                    <label>개인정보수집<br/>이용동의서</label>
                    <label class="check">
                        <input type="checkbox">
                        <span class="checkmark"></span>
                    </label>
                    <p>귀하의성명,연락처 등 개인정보의 수집 및 이용에 대한
                        동의 여부를 표시하여 주시기 바랍니다.<br/>(동의항목:이름,E-mail,전화번호)</p>
                </div>
                <div class="inputfield btn-container">
                    <input type="button" value="등록하기" class="btn" onclick="sendIt();"/>
                    <input type="button" value="취소하기" class="btn" onclick="location='<%=cp%>/inquiry/cs.do';">
                </div>
            </div>


        </div>
    </div>


    <!-- 끝 -->

    </div>
    </div>
    </div>
</form>

<jsp:include page="../web/footer3.jsp"/>
</body>
</html>