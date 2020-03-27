<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>아이디 찾기</title>
<style>

.sbbtn{
	color : white;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
}

.reg_formbox {
	/* border: 1px solid silver; */
	border-radius : 1px;
	margin-bottom: 10px;
	text-align: center;
}

.sbbtn, .btn { 
	height: 60px; 
	margin: 10px 10px;
	padding : 0px 50px;
	margin-top: 50px;
}
.text-emphasis {
    font-weight: bolder;
    display: inline-block;
    white-space: nowrap;
    vertical-align: bottom;
}
.text-search-result-list {
    padding: 0;
    font-weight: 500;
    line-height: 27px;
	font-size: 22px;
	color: #222;
	
}
.text-sub-description {
    display: block;
    margin-top: 4px;
    font-size: 16px;
    font-weight: normal;
    color: #a4a9b0;
}
.text__match-id {
    padding-left: 0;
    color: #222;
    font-weight: 500;
    font-size: 24px;
    line-height: 36px;
}
.list-searched-result {
    display: inline-block;
    padding: 37px 32px 35px;
}
.col{
	text-align: center;
}
a{
	padding: 10px;
	color: white;
}
</style>
<script>
	$(document).ready(function(){
		$('button').click(function(){
			console.log($(this).text());
			if($(this).text()==="로그인하러가기"){
				location.href="${pageContext.request.contextPath}/userlogin"	
			}
		});
	});
</script>
</head>
<body>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col mt-5 py-5">
				<div class="reg_formbox mt-5 py-3">
			<p class="text-search-result-list my-3"><span class="text-emphasis">${NewPwuser.email}</span>으로<br></p><p class="text-search-result-list">임시 비밀번호를 발송했습니다.</p>
				</div>
				<button class="btn sbbtn btn-secondary">로그인하러가기</button>				
		</div>
	</div>
</body>
</html>
