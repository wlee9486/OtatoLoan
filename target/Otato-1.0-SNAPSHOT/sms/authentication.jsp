<%@page import="com.member.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
	
	CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
	String verNum = info.getVerNum();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
	#popup{
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-150px;
		margin-top:-100px;
		border:2px solid #c4c4c4;
		width:300px;
		height:100px;
		background-color: white;
		z-index: 100;
	}			
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=cp%>/sms/css/sendsms.css">
<title>휴대전화 인증</title>

<script type="text/javascript">
	function open_window(){
		var popup = document.getElementById("popup");
		popup.style.display = "block"; // block을 생성해서 보이게 한다.
		//popup.style.visibility = "visible"; --> 이미 생성된 영역의 visible 기능만 On 한 경우
	}
	
	function close_window(){
		var popup = document.getElementById("popup");
		popup.style.display = "none"; //해당 영역을 지워서 안보이게 한다.
		//popup.style.visibility = "hidden"; --> 해당 영역을 렌더링한 상태에서 visible 기능만 Off 한 경우
	}

	function verifingNum() {
	    // code클래스 input받아오기
	    var codeInputs = document.getElementsByClassName("code");
	    
	    // 하나의 string으로 만들기
	    var iptVerNum = "";
	    for (var i = 0; i < codeInputs.length; i++) {
	      iptVerNum += codeInputs[i].value;
	    }
	    
	    console.log("Input Verification Number:", iptVerNum);
	    console.log("Stored Verification Number:", "<%=verNum%>");

	    if (iptVerNum !== "<%=verNum%>") {
	      console.log("Verification Failed");
	      var popup = document.getElementById("popup");
	      popup.style.display = "block";
	      return;
	    }
	    
	    console.log("Verification Successful");
	    location.href = "<%=cp%>/login/verified.do";
	  }

	$('#input1').on('keyup', function() {
	    if(this.value.length == 4) {
	       $('#input2').focus()
	    }
	});
	
</script>

<!-- css관련스크립트 -->
<script type="text/javascript">
const codes = document.querySelectorAll(".code");

codes[0].focus();

codes.forEach((code, idx) => {
  code.addEventListener("keydown", (e) => {
    if (e.key >= 0 && e.key <= 9) {
      codes[idx].value = "";
      setTimeout(() => codes[idx + 1].focus(), 10);
    } else if (e.key === "Backspace") {
      setTimeout(() => codes[idx - 1].focus(), 10);
    }
  });
});


</script>


</head>
<body>

<div>
  <div class="scontainer">
    <h2 class="sh2" style="text-align: center; justify-content: center; align-content: auto;"><b>가입자 휴대폰 인증</b></h2>
    <p class="sh3">
 회원 가입 시 입력한 휴대폰 번호를 이용해 인증하는 서비스 입니다.<br/>
 가입자 휴대폰 인증은 통신사의 사정에 따라 인증번호 전송이 다소 늦어질수 있습니다.<br/>
 인증번호가 도착하지 않는 경우 [인증번호받기] 버튼을 다시 한번 클릭해 주세요.<br/>
 발송된 인증번호의 유효 시간은 <font>3분</font>이며, 인증번호 발송 후 3분 이후에 재전송이 가능합니다.<br/>
    </p>
    <br/>
    
    <small class="info">
휴대폰 인증에 필요한 SMS전송 비용은 무료 입니다.
    </small>
    
    <div class="code-scontainer">
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
      <input type="tel" class="code" placeholder="*" min="0" max="9" onlyNumber maxlength="1" required/>
    </div>
    
  </div>

<div class="button-scontainer">  
<div><input type="button" value="재전송" onclick="location.href='<%=cp %>/login/authentication.do';" class="ellipse-button" style="margin-right: 30pt;"/>
<input type="button" value=" 인증하기 " onclick="verifingNum()" class="ellipse-button"/>
</div>
</div>

<div id="popup" style="display: none;">
	<div style="width:300px;height:170px" align="center"><br>
		<!-- 팝업내용 -->
		인증번호가 올바르지 않습니다.<br/><br/>
		<input type="button" value=" 닫 기 " onclick="close_window()">
	</div>
</div>
    </div>
  <script src="script.js"></script>

<!-- 인증번호 입력: <input type="text" id="inputVerNum" name="inputVerNum"/> -->
</body>
</html>