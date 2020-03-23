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
    max-width: 220px;
    text-overflow: ellipsis;
    overflow: hidden;
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
			}else if($(this).text()==="비밀번호 재설정"){
				location.href="${pageContext.request.contextPath}/userlogin/FindPW"
			}
		});
	});
</script>
</head>
<body>
		<div class="mx-auto row align-items-top" style="width: 600px; height: 670px;">
		<div class="col mt-5 py-5">
				<div class="reg_formbox mt-5 py-3">
				<p class="text-search-result-list"><span class="text-emphasis">${finduser.name}</span>님의 정보와 일치하는 아이디 목록입니다.</p>
				<ul class="list-searched-result" id="idList">
					<li class="list-searched-result__item">
						<p class="text__search-result">
								<strong class="text__match-id"><span class="text__ellipsis">${finduser.name}</span> - ${finduser.id}</strong>
								<span class="text-sub-description">${finduser.join_date} 가입</span>
						</p>
					</li>
				</ul>
				</div>
				<button class="btn sbbtn btn-secondary">로그인하러가기</button><button class="btn btn-secondary">비밀번호 재설정</button>				
		</div>
	</div>
</body>
</html>
