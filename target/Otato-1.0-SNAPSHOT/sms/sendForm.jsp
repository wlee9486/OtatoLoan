<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title></title>
    <script type="text/javascript">
        function setPhoneNumber(val) {
            var numList = val.split("-");
            document.smsForm.sphone1.value = numList[0];
            document.smsForm.sphone2.value = numList[1];
      		if(numList[2] != undefined){
                document.smsForm.sphone3.value = numList[2];
   		 	}
        }

        function loadJSON() {
            var data_file = "/calljson.jsp";
            var http_request = new XMLHttpRequest();
            try {
                // Opera 8.0+, Firefox, Chrome, Safari
                http_request = new XMLHttpRequest();
            }catch (e) {
                // Internet Explorer Browsers
                try {
                    http_request = new ActiveXObject("Msxml2.XMLHTTP");

                }catch (e) {

                    try {
                        http_request = new ActiveXObject("Microsoft.XMLHTTP");
                    }catch (e) {
                        // Eror
                        alert("지원하지 않는브라우저!");
                        return false;
                    }

                }
            }
            http_request.onreadystatechange = function() {
                if (http_request.readyState == 4) {
                    // Javascript function JSON.parse to parse JSON data
                    var jsonObj = JSON.parse(http_request.responseText);
                    if (jsonObj['result'] == "Success") {
                        var aList = jsonObj['list'];
                        var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                        selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                        for (var i = 0; i < aList.length; i++) {
                            selectHtml += "<option value=\"" + aList[i] + "\">";
                            selectHtml += aList[i];
                            selectHtml += "</option>";
                        }
                        selectHtml += "</select>";
                        document.getElementById("sendPhoneList").innerHTML = selectHtml;
                    }
                }
            }

            http_request.open("GET", data_file, true);
            http_request.send();
        }
    </script>
</head>

<body onload="loadJSON();">

<form method="post" name="smsForm" action="../sms/sendForm_ok1.jsp">
    <input type="hidden" name="action" value="go">
    <input type="hidden" name="smsType" value="S" checked="checked">
    <input type="hidden" name="subject" value="">
    <input type="hidden" name="msg" value="[OTATOLOAN]\n인증번호는 ${sessionScope.customInfo.verNum } 입니다.">
    <input type="hidden" name="rphone" value="${sessionScope.customInfo.userTel }">
    <input type="hidden" name="destination" value="" size=80>
    <input type="hidden" name="sphone1" value="010">
    <input type="hidden" name="sphone2" value="7702">
    <input type="hidden" name="sphone3" value="1685">
    <span id="sendPhoneList"></span>
    <input type="hidden" name="rdate" maxlength="8">
    <input type="hidden" name="rtime" maxlength="6">
    <input type="hidden" name="returnurl" maxlength="64" value="<%=cp %>/login/authentication_ok.do">
    <input type="hidden" name="testflag" maxlength="1">
    <input type="hidden" name="nointeractive" maxlength="1">
    <input type="hidden" name="repeatFlag">
    <input type="hidden" name="repeatNum" >
    <input type="hidden" name="repeatTime">
</form>

<script type="text/javascript">
	document.smsForm.submit(); 
</script>
</body>

</html>
        