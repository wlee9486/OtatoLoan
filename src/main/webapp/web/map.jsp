<%@ page contentType="text/html; charset=UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="./css/web.css">
<title>Insert title here</title>
</head>
<body>
		<div class="section4">
			<div class="content tbl">
				<div class="tbl-cell">
					<div class="sec4-tit">고객의 곁에 언제나</div>
					<div class="sec4-txt">통합디지털 및 지점에서<br/> OTATO론을 만나실 수 있습니다</div>
					<div class="sec4-txt typel mt20">
					<span class="sec4-txt typel mt20">
					<b>OTATO 고객센터</b>
					</span>
					<span class="main-tel">1566-7979</span>
					</div>
				</div>
			</div>
		</div>
		<div class="tbl-cell"> 
		
		<div class="sec4-selt"> 
		<select ng-model="searchData.areaCd"> 
		<!-- ngRepeat: item in areaList -->
		<option value="" ng-repeat="item in areaList" class="ng-binding ng-scope">전체</option>
		<!-- end ngRepeat: item in areaList -->
		<option value="00009" ng-repeat="item in areaList" class="ng-binding ng-scope">서울</option>
		<!-- end ngRepeat: item in areaList -->
		<option value="00005" ng-repeat="item in areaList" class="ng-binding ng-scope">광주</option>
		<!-- end ngRepeat: item in areaList -->
		<option value="00007" ng-repeat="item in areaList" class="ng-binding ng-scope">대전</option>
		<!-- end ngRepeat: item in areaList -->
		<option value="00008" ng-repeat="item in areaList" class="ng-binding ng-scope">부산</option>
		<!-- end ngRepeat: item in areaList --> 
		</select> </div> 
		
		<div class="sec4-inpt"> 
		<div class="search"> 
		<input ng-model="searchData.searchNm" type="text" ng-keyup="event.search($event)" class="form-input common-search ng-pristine ng-untouched ng-valid ng-empty" placeholder="영업점 이름 또는 주소를 입력해주세요."> 
		<button class="search-btn" ng-click="event.callBrncSrch()">검색</button> 
		</div> 
		</div> 
		<div class="sec4-txts">※ 검색 시 지점안내 상세 페이지로 이동합니다.</div> 
		</div>
</body>
</html>