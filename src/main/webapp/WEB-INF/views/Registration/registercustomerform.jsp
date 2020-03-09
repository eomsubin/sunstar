<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.custom-control-input:checked~.custom-control-label::before {
    color: #fff;
    border-color: #fbab60;
    background-color: #fbab60;
}

.regbtn{
	color : white;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
}

.regh1 {
	font-weight : 300;
	display: inline-block;
	margin-right: 5%;
	margin-bottom: 5%;
}

.regspan {
	margin-left: 24px;
	font-weight: bold;
}

.reg_formbox {
	/* border: 1px solid silver; */
	border-radius : 1px;
	margin-bottom: 10px;
}

.regbtn { 
	height: 60px; 
	margin: 10px auto;
	display: flex;
	padding : 0px 50px;
	margin-top: 50px;
}

.now {
	color: #fbab60;
	border-top: 2px solid #fbab60;
}

.list-group-item {
	border-radius: 0px !important;
	border : 1px solid silber !important;
}
</style>
<script>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
<div class="mx-auto mt-5 row align-items-bottom" style="width: 600px; height: 138px;">
<div class="col">
		<h1 class="regh1">구매 회원가입</h1><span class="regspan">1 약관동의</span><span class="regspan now">2 정보입력</span><span class="regspan">3 가입완료</span>
		<p class="txt_info">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다.</p>
		</div>
		</div>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col">
		<form method="post" action="${pageContext.request.contextPath}/registercustomer/insertcustomer">
				<div class="reg_formbox py-0">
				<ul class="list-group">
				  	<li class="list-group-item">Cras justo odio</li>
				  	<li class="list-group-item">Dapibus ac facilisis in</li>
				  	<li class="list-group-item">Morbi leo risus</li>
				  	<li class="list-group-item">Porta ac consectetur ac</li>
				  	<li class="list-group-item">Vestibulum at eros</li>
				</ul>
				</div>
				<button class="btn btn-secondary regbtn">확인</button>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		</div>
	</div>
</body>
</html>