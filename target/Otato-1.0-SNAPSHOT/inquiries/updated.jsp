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
    <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/detailarea.css">
    <link rel="stylesheet" type="text/css" href="<%=cp %>/inquiries/css/ingrid.css">


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

            f = document.myForm;

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


            f.action = "<%=cp%>/inquiry/update_ok.do";
            f.submit();

        }


    </script>

    <title>1:1문의</title>
</head>
<body>
<form action="" method="post" name="myForm">

    <jsp:include page="../web/header.jsp"/>

    <div class="wrapper">
        <div class="container123">
            <div class="item1">
                <div class="ctitle">고객의소리(칭찬/불만/문의)</div>

                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a>>&nbsp;고객센터>&nbsp;고객의소리(칭찬/불만/문의)
                </div>
            </div>

            <br/>
            <hr class="hr-1">
            <br/>
            <div class="csubtitle" style="text-align: left; font-size: 20pt;">
                나의 문의내역 수정
            </div>
            <br/>
        </div>


        <!-- 시작 -->

        <div class="wrapper">
            <div class="container123">
                <div class="form">

                    <div class="inputfield">
                        <label>이메일</label>
                        <input type="text" class="input" name="userEmail" value="${dto.userEmail}" readonly="readonly">
                    </div>

                    <div class="inputfield">

                    </div>


                    <div class="inputfield">
                        <label>제목</label>
                        <input type="text" class="input" name="iSubject" value="${dto.iSubject}">
                    </div>


                    <div class="inputfield">
                        <label>내용</label>
                        <textarea class="textarea" name="iContent" style="resize: none;
          height: 500px;">${dto.iContent}</textarea>
                    </div>

                    <div class="inputfield btn-container2">
                        <input type="hidden" name="iNum" value="${dto.iNum}">
                        <input type="button" value="수정하기" class="btn" onclick="sendIt()"/>
                        <input type="button" value="취소하기" class="btn"
                               onclick="location='<%=cp%>/inquiry/list.do'">
                    </div>
                </div>
            </div>


            <!-- 끝 -->

        </div>
    </div>
    </div>
</form>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<jsp:include page="../web/footer3.jsp"/>
</footer>
</body>
</html>