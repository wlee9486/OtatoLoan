<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>title</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../web/css/btn.css">

</head>
<body>
<div style="display: flex; align-items: flex-end; float">
    <!-- 서명 공간 -->
    <div style="width:300px; height:150px;">
        <canvas id="canvas" style="border:1px solid black"></canvas>
    </div>
    <div>
        <button id="save"
                style="padding: 10px; width: 100px; font-family: LINESeedKR-Bd; background-color: #fed932; border: none; border-radius: 10px; cursor: pointer; margin-right: 10px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);">
            서명저장
        </button>
    </div>
    <script>
        (function (obj) {
            obj.init();
            $(obj.onLoad);
        })((function () {
            var canvas = $("#canvas");
            var div = canvas.parent("div");
            // 캔버스의 오브젝트를 가져옵니다.
            var ctx = canvas[0].getContext("2d");
            var drawble = false;

            // 이제 html 버그인지는 모르겠는데 canvas의 style의 height와 width를 수정하게 되면 그림이 이상하게 그려집니다.
            function canvasResize() {
                canvas[0].height = div.height();
                canvas[0].width = div.width();
            }

            // pc에서 서명을 할 경우 사용되는 이벤트입니다.
            function draw(e) {
                function getPosition() {
                    return {
                        X: e.pageX - canvas[0].offsetLeft,
                        Y: e.pageY - canvas[0].offsetTop
                    }
                }

                switch (e.type) {
                    case "mousedown": {
                        drawble = true;
                        ctx.beginPath();
                        ctx.moveTo(getPosition().X, getPosition().Y);
                    }
                        break;
                    case "mousemove": {
                        if (drawble) {
                            ctx.lineTo(getPosition().X, getPosition().Y);
                            ctx.stroke();
                        }
                    }
                        break;
                    case "mouseup":
                    case "mouseout": {
                        drawble = false;
                        ctx.closePath();
                    }
                        break;
                }
            }


            return {
                init: function () {
                    $(window).on("resize", canvasResize);

                    canvas.on("mousedown", draw);
                    canvas.on("mousemove", draw);
                    canvas.on("mouseup", draw);
                    canvas.on("mouseout", draw);

                    // save 버튼을 누르면 imageupload.php로 base64코드를 보내서 이미지로 변환합니다.
                    $("#save").on("click", function () {
                        event.preventDefault(); // 기본 동작(페이지 새로고침) 막기
                        var form = "${myForm}";
                        // a 태그를 만들어서 다운로드를 만듭니다.
                        var link = document.createElement('a');
                        // base64데이터 링크 달기
                        link.href = canvas[0].toDataURL("image/png");
                        // 다운로드시 파일명 지정
                        link.download = "${memberDTO.userName}_${productDTO.pName }.png";
                        // body에 추가
                        document.body.appendChild(link);
                        link.click();
                        document.body.removeChild(link);
                        // 다운로드용 a 태그는 다운로드가 끝나면 삭제합니다.
                        form.remove();
                    });
                },
                onLoad: function () {
                    canvasResize();
                }
            }
        })());
    </script>
</div>
</body>
</html>