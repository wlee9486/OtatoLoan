<%@page import="com.member.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();	
	
%>
<html>
<head>
<style>
	#popup{
		position:absolute;
		left:50%;
		top:50%;
		margin-left:-150px;
		margin-top:-100px;
		border:2px solid #c4c4c4;
		width:300px;
		height:200px;
	}			
</style>
</head>
<script>
	//Layer Popup 설정
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
	
	
	//Timer 설정
	var tid;
	var cnt = parseInt(60);
	
	function counter_init() {
		tid = setInterval("counter_run()", 1000);
	}
	
	function counter_run() {	//메인화면 세션 카운트
		document.all.counter.innerText = time_format(cnt);
		cnt--;
		if(cnt < 0) {
			clearInterval(tid);
			
			// 세션연장 여부를 질의하는 팝업
			open_window();

			// 팝업에서 다시 카운트 시작
			cnt = parseInt(10);	// 팝업창 추가카운트 시간 설정 
			nCounter_init();
		}
	}
	
	function nCounter_run() { 	//팝업화면 추가 세션 카운트
		document.all.ncounter.innerText = time_format(cnt);
		cnt--;
		if(cnt < 0) {
			// 추가 세션 카운트가 0이면 로그아웃 후 자동로그아웃 안내화면으로 이동
			logoutInfo();
		}
	}
			
	function counter_reset() {
		clearInterval(tid);
	
		cnt = parseInt(60*3); // 초기값(초단위)
		counter_init();

		document.all.ncounter.innerText = "";
		
		// 세션에 값 업데이트
	}
	
	function logoutInfo() { 
		self.location = "<%=cp%>/login/logoutinfo.do";
	}
	
	function logout() {
		self.location = "<%=cp%>/login/logout.do";
	}
	
	function time_format(s) {
		var nMin=0;
		var nSec=0;
		if(s>0) {
			nMin = parseInt(s/60);
			nSec = s%60;
		} 
		if(nSec<10) nSec = "0"+nSec;
		if(nMin<10) nMin = "0"+nMin;

		return "" + nMin + ":" + nSec;
	}
	
</script>
<body onload="counter_init()">
    <!-- Timer 설정 -->
    <span id="counter"></span><input type="button" value="연장" onclick="counter_reset()">
	
	<!-- Layer Popup 설정 시작 -->
	<!-- div id="popup" style="visibility:hidden" -->
	<div id="popup" style="display:none">
		<div style="width:300px;height:170px" align="center"><br>
			<!-- 팝업내용 -->
			<span id="ncounter"></span> 초 후 자동 로그아웃 됩니다.<br/><br/>
			<input type="button" value="연장하기" onclick="counter_reset(), close_window()">
			<input type="button" value="로그아웃" onclick="logout()">
		</div>
	</div>
	<!-- Layer Popup 설정 끝 -->
</body>
</html>