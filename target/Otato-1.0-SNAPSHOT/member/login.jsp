<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8"); 
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/member/data/account.css">

<script type="text/javascript">

	function login(){
		
		var f = document.myForm;
		
		
		if(!f.userEmail.value){
			alert("이메일을 입력하세요.");
			f.userEmail.focus();
			return;
		}
		
		if(!f.userPwd.value){
			alert("패스워드를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		
		f.action = "<%=cp%>/login/login_ok.do";
		f.submit();
		
	}
	
</script>

<body>

<c:if test="${!empty message}">
	<div class="alert alert-secondary alert-dismissible fade show" style="text-align: center; height: 30px; font-size: 10pt;" role="alert">
		<br/> ${message }
	 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
</c:if>

<Form name="myForm" method="post" action="<%=cp%>/login/login_ok.do">
<section class="user">
<div class="user_options-container">
  <div class="user_options-text">
    <div class="user_options-unregistered">
      <h2 class="user_unregistered-title">계정이 없으신가요?</h2>
      <p class="user_unregistered-text">오테이토 대출서비스 이용을 위해 회원가입해주세요</p>
      <button class="user_unregistered-signup" id="signup-button" onclick="location.href='<%=cp%>/login/signup.do';">Sign up</button>
    </div>
  
  <div class="user_options-forms" id="user_options-forms">
    <div class="user_forms-login">
      <h2 class="forms_title">로그인</h2>
      <form class="forms_form">
      
        <fieldset class="forms_fieldset">
          <div class="forms_field">
            <input name="userEmail" type="email" placeholder="Email (User@otato.com)" class="forms_field-input" required autofocus />
          </div>
          <div class="forms_field">
            <input name="userPwd" type="password" placeholder="Password" class="forms_field-input" required />
          </div>
        </fieldset>
        
        <div class="forms_buttons">
          <button type="button" class="forms_buttons-forgot" onclick="location.href='<%=cp%>/login/findpwd.do';">비밀번호를 잊으셨나요?</button>
          <input type="submit" value="로그인" class="forms_buttons-action" />
        </div>
      </form>
    </div>
    
  </div>
</div>
</section>
</Form>
</body>
</html>