<%@page import="java.util.List" %>
<%@page import="com.store.StoresDTO" %>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../web/css/table.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../web/css/banner.css">
    <link rel="stylesheet" type="text/css" href="../web/css/grid.css">
    <link rel="stylesheet" type="text/css" href="../productList/css/list.css">
    <link rel="stylesheet" type="text/css" href="../web/css/prolist.css">
    <link rel="stylesheet" type="text/css" href="../web/css/btn.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../web/css/sidemenu.css">

    <title>지도</title>
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
    <script>
        window.onload = function () {
            var x = parseFloat('${x}');
            var y = parseFloat(${y});
            getMap(x, y);
        }

        function getLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("위치 정보를 가져올 수 없습니다.");
            }

        }

        function showPosition(position) {

            var f = document.myForm;

            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            location.href = "<%=cp%>/store/find.do?lat=" + latitude + "&lon=" + longitude;
        }

        function getMap(x1, y1) {

            var mapContainer = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(y1, x1),
                level: 5
            };
            var map = new kakao.maps.Map(mapContainer, options);

            var positions = [];

            <c:forEach var="dto" items="${totList}">
            var x = ${dto.x};
            var y = ${dto.y};
            var name = "${dto.name}";

            var position = {
                title: name,
                latlng: new kakao.maps.LatLng(y, x)
            };

            positions.push(position);
            </c:forEach>

            console.log(positions);

            // 마커 이미지의 이미지 주소입니다
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

            for (var i = 0; i < positions.length; i++) {

                // 마커 이미지의 이미지 크기 입니다
                var imageSize = new kakao.maps.Size(24, 35);

                // 마커 이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                // 마커를 생성합니다
                var marker = new kakao.maps.Marker({
                    map: map, // 마커를 표시할 지도
                    position: positions[i].latlng, // 마커를 표시할 위치
                    title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                    image: markerImage // 마커 이미지
                });


            }
        }


    </script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b201fded522e05323e977e43c669e52"></script>

</head>

<body>
<jsp:include page="../web/header.jsp"/>
<div class="test">
    <div class="container test2">
        <div class="item1">
            <div class="ctitle">지점안내</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 지점안내 > 지점위치</div>
        </div>
        <hr class="hr-1">
        <div class="item2">
            <div class="csubtitle">감자될론 지점</div>
            <hr class="hr-3">
        </div>


        <div id="map" style="width:100%; height:500px; justify-content: center; display: flex;"></div>

        <br><br/>
        <div style="display:flex;justify-content: flex-end">
            <input type="button" value="근처 지점 찾기"
                   onclick="getLocation()"
                   style="padding: 10px; width: 200px; font-family: LINESeedKR-Bd; color:#fff; background-color: black; border: none; border-radius: 20px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
        </div>

        <table>
            <thead>
            <tr class="trfont">
                <th class="thfont" width="25%">지점명</th>
                <th class="thfont" width="60%">주소</th>
                <th class="thfont" width="15%">전화번호</th>
            </tr>
            </thead>

            <c:forEach var="dto" items="${closest}">
                <tbody>
                <tr>
                    <td>${dto.name}</td>
                    <td>${dto.address}</td>
                    <td>${dto.tel}</td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <br>
        <br>
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

<jsp:include page="../web/footer3.jsp"/>
</body>
