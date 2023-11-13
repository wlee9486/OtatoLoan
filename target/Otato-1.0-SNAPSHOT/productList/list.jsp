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
    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link rel="stylesheet" type="text/css" href="../web/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../productList/css/list.css">
    <link rel="stylesheet" type="text/css" href="../web/css/btn.css">
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

    <script type="text/javascript">
        function sendIt() {


            var f = document.myForm;

            for (var i = 0; i < 4; i++) {
                if (f.pCategory[i].checked) {
                    var cat = f.pCategory[i].value;
                }

                if (f.pMethod[i].checked) {
                    var met = f.pMethod[i].value;
                }
            }


            f.action = "<%=cp%>/product/list.do?pCategory=" + cat + "&pMethod=" + met;
            f.submit();
        }

        function fOpen(n) {
            window.name = "mainWin";
            var width = 850;
            var height = 600;

            var left = (window.innerWidth - width) / 2;
            var top = (window.innerHeight - height) / 2;

            window.open("../product/details.do?pNum=" + n, "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
                ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

        }
    </script>

    <style type="text/css">
        @font-face {
            font-family: 'OTWelcomeRA';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        .bolding {
            font-family: 'LINESeedKR-Bd';
            font-size: 20pt;
        }

    </style>

    <title>상세페이지</title>
</head>

<body>

<jsp:include page="../web/header.jsp"/>

<form action="" method="post" name="myForm">
    <div class="test">
        <div class="container test2">
            <div class="item1">
                <div class="ctitle">대출</div>
                <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp" style="height: 300px; width: 300px;">
                    HOME </a> > 대출 > 대출상품
                </div>
            </div>
            <hr class="hr-1">
            <div class="item2">
                <div class="csubtitle">상품검색</div>
                <hr class="hr-3">
            </div>
            <!-- radio 선택버튼 -->

            <div>상환방식</div>
            <table>
                <tr>
                    <td>
                        <div><label class="pc"><input type="radio" name="pCategory"
                                                      value="all" ${pCategory == 'all' || pCategory == ""? 'checked':''}><span>전체</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pCategory"
                                                      value="만기일시" ${pCategory == '만기일시'? 'checked':''}><span>만기일시</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pCategory"
                                                      value="원리금균등" ${pCategory == '원리금균등'? 'checked':''}><span>원리금균등</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pCategory"
                                                      value="원금균등" ${pCategory == '원금균등'? 'checked':''}><span>원금균등</span></label>
                        </div>
                    </td>
                </tr>
            </table>

            <div>신청대상</div>
            <table>
                <tr>
                    <td>
                        <div><label class="pc"><input type="radio" name="pMethod"
                                                      value="all" ${pMethod == 'all' || pMethod == ""? 'checked':''}><span>전체</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pMethod"
                                                      value="직장인" ${pMethod == '직장인'? 'checked':''}><span>직장인</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pMethod"
                                                      value="개인사업자" ${pMethod == '개인사업자'? 'checked':''}><span>개인사업자</span></label>
                        </div>
                    </td>
                    <td>
                        <div><label class="pc"><input type="radio" name="pMethod"
                                                      value="주부" ${pMethod == '주부'? 'checked':''}><span>주부</span></label>
                        </div>
                    </td>
                </tr>
            </table>


            <hr class="hr-3">
            <div style="height: 70pt; display: flex; justify-content: center; align-items: center;">
                <button style="position: sticky; padding: 10px; width: 200px;  background-color: #fed932; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
                    <font class="bg-1f5">Search</font></button>
            </div>
            <font class="f1">총 <font color="orange"><b>${dataCount }</b></font>개의 상품이 있습니다.</font><br/>

            <!-- 반복문 -->
            <div class="bolding" style="padding-bottom: 20pt; padding-top: 20pt;">
                <c:forEach var="dto" items='${lists }'>
                    <table border="1" cellspacing="2" cellpadding="2" width="100%" height="200px;">
                        <tr>
                            <td rowspan="5" height="100pt" width="100pt"><img src="<%=cp%>/productList/image/logo2.jpg"
                                                                              style="height: 300px; width: 300px;"></td>
                            <th colspan="6" style="font-size: 30pt; text-align: left; color: orange;">
                                <b>${dto.pName }</b></th>
                        </tr>

                        <tr>
                            <td colspan="2"></td>
                            <th style="text-align: left;">한도</th>
                            <th style="text-align: left;">최대</th>
                            <th>${dto.maxAmount }</th>
                            <th colspan="2" style="padding-right: 10pt;">만원</th>

                        </tr>
                        <tr>
                            <th></th>
                            <td colspan="2" style="">금리</td>
                            <th>최저</th>
                            <th>연</th>
                            <th>${dto.maxRate }</th>
                            <th>%</th>
                        </tr>
                        <tr>
                            <th style="text-align: left;"><a href="javascript:fOpen(${dto.pNum});">상세보기</a></th>
                            <td colspan="2" style="text-align: left;">최고</td>
                            <th></th>
                            <th>연</th>
                            <th>${dto.minRate }</th>
                            <th>%</th>
                        </tr>
                    </table>
                    <br/>
                </c:forEach>
            </div>


            <div id="footer" style="text-align:center; margin-top: 20px; ">

                ${pageIndexList }
            </div>
        </div>
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
</form>

<jsp:include page="../web/footer3.jsp"/>

</body>


</body>
</html>