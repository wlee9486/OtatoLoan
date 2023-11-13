<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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

    <title>Insert title here</title>
</head>
<body>

<!-- header start -->

<header class="header">
    <div class="container123">
        <div class="row v-center">
            <div class="header-item item-left">
                <div class="logo">
                    <a href="<%=cp%>/web/main2.jsp"> <img src="<%=cp %>\web\img\로고2.jpg" width="150px"
                                      height="35px">

                    </a>
                </div>
            </div>
            <!-- menu start here -->
            <div class="header-item item-center">
                <div class="menu-overlay"></div>
                <nav class="menu">
                    <div class="mobile-menu-head">
                        <div class="go-back">
                            <i class="fa fa-angle-left"></i>
                        </div>
                        <div class="current-menu-title"></div>
                        <div class="mobile-menu-close">&times;</div>
                    </div>
                    <ul class="menu-main">
                        <li class="menu-item-has-children">
                            <a href="#"><i class="fa fa-angle-down"></i></a>
                            <div class="sub-menu mega-menu mega-menu-column-4">
                                <div class="list-item">
                                    <img src="<%=cp %>\web\img카드.jpg">
                                </div>
                                <div class="list-item-text">
                                    <img src="<%=cp %>\web\img\글씨.jpg">
                                    <div class="separator"></div>
                                </div>
                                <div class="list-item">

                                    <h4 class="title">대출신청</h4>
                                    <ul>
                                        <li><a href="#">대출상품조회</a></li>
                                        <li><a href="#">통합한도조회</a></li>
                                        <li><a href="#">추가/재대출</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">대출관리<i class="fa fa-angle-down"></i></a>
                            <div class="sub-menu mega-menu mega-menu-column-4">
                                <div class="list-item">
                                    <img src="<%=cp %>\web\img\카드.jpg">
                                </div>
                                <div class="list-item-text">
                                    <img src="<%=cp %>\web\img\글씨.jpg">
                                    <div class="separator"></div>
                                </div>
                                <div class="list-item">

                                    <h4 class="title">대출</h4>
                                    <ul>
                                        <li><a href="<%=cp%>/product/list.do">대출상품</a></li>
                                        <li><a href="<%=cp%>/application/suggestion.do">대출신청</a></li>
                                        <li><a href="<%=cp%>/application/credit.do">신용점수조회</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">될멤버십<i class="fa fa-angle-down"></i></a>
                            <div class="sub-menu mega-menu mega-menu-column-4">
                                <div class="list-item">
                                    <img src="<%=cp %>\web\img\카드.jpg">
                                </div>
                                <div class="list-item-text">
                                    <img src="<%=cp %>\web\img\글씨.jpg">
                                    <div class="separator"></div>
                                </div>
                                <div class="list-item">

                                    <h4 class="title">멤버십관리</h4>
                                    <ul>

                                        <li><a href="<%=cp%>/login/preauthentication.do">멤버십소개</a></li>
                                        <li><a href="<%=cp%>/membership/charge.do">캐시충전</a></li>
                                        <li><a href="<%=cp%>/membership/payback.do">대출금상환</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">고객센터<i class="fa fa-angle-down"></i></a>
                            <div class="sub-menu mega-menu mega-menu-column-4">
                                <div class="list-item">
                                    <img src="<%=cp %>\web\img\카드.jpg">
                                </div>
                                <div class="list-item-text">
                                    <img src="<%=cp %>\web\img\글씨.jpg">
                                    <div class="separator"></div>
                                </div>
                                <div class="list-item">

                                    <h4 class="title">고객문의</h4>
                                    <ul>
                                        <li><a href="<%=cp%>/faq/list.do">자주묻는질문</a></li>
                                        <li><a href="<%=cp%>/inquiry/cs.do">1:1문의</a></li>
                                        <li><a href="<%=cp%>/inquiry/list.do">나의문의내역</a></li>
                                        <li><a href="<%=cp%>/store/find.do">지점안내</a></li>

                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="menu-item-has-children">
                            <a href="#">마이페이지<i class="fa fa-angle-down"></i></a>
                            <div class="sub-menu mega-menu mega-menu-column-4">
                                <div class="list-item">
                                    <img src="<%=cp %>\web\img\카드.jpg">
                                </div>
                                <div class="list-item-text">
                                    <img src="<%=cp %>\web\img\글씨.jpg">
                                    <div class="separator"></div>
                                </div>
                                <div class="list-item">

                                    <h4 class="title">마이페이지</h4>
                                    <ul>
                                        <li><a href="<%=cp%>/login/my.do">My멤버십</a></li>
                                        <li><a href="<%=cp%>/loan/list.do">내대출상품</a></li>
                                        <li><a href="<%=cp%>/loan/clicked.do">최근조회한상품</a></li>

                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <!-- menu end here -->
            <div class="header-item item-right">
                <% if (session.getAttribute("customInfo") != null) { %>
                <a href="<%=cp%>/login/logout.do"><font size="bold">로그아웃&nbsp;&nbsp;</font></a>
                <% } else { %>
                <a href="<%=cp%>/login/login.do"><font size="bold">로그인&nbsp;&nbsp;</font></a>
                <% } %>
                <!-- mobile menu trigger -->
                <div class="mobile-menu-trigger">
                    <span></span>
                </div>
            </div>
        </div>
    </div>
</header>

</body>
</html>