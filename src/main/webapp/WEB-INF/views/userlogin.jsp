<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!--  Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;display=swap" rel="stylesheet">
	<!-- Font Awesome -->
    <link rel="stylesheet" href="/controller/resources/css/font-awesome.css">
	<!-- Themify Icons -->
    <link rel="stylesheet" href="/controller/resources/css/themify-icons.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>SBBJ</title>
<style>
	ul li{
	list-style : none;
	}
	#naverlogin{
	width:253px;
	}
	.logbtn{
		width:130px; 
	}
	.button_login{	
	font-weight: bold !important;
	}
	input[type="submit"] {
	color : white !important;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
	}
	input[type="text"], input[type="password"] {
	}
	.statusbox{
	margin-top: 1px;
    height: 1px;
    background: #fbab60;
    border: 1.5px solid #fbab60;
    text-align: center;
	}
	.location{
	padding: 6px 0 0 12px;
 	font-size: 12px;
   	color: #888;
	}
	h3{
    padding: 13px 0 2px 10px;
    border-bottom: 1px solid #ebebeb;
	}
	.member-select {
    padding: 30px 0 0 104px;
    font-size: 11px;
    color: #444;
	}
	.member-select .radio {
    width: 13px;
    height: 13px;
    vertical-align: middle;
	}
	.member-select label {
    margin-left: 5px;
    margin-right: 50px;
	}
	.login-input .user-input {
    position: absolute;
    top: 0;
    left: 38px;
    width: 275px;
	}
	.user-input label .txt {
	float: left;
	width: 63px;
	padding-top: 7px;
	color: #555050;
	font-weight: bold;
	}
	.login-input {
    position: relative;
    z-index: 1;
    margin-top: 15px;
    width: 100%;
    height: 110px;
	}
	.login-input .btn-login {
    position: absolute;
    top: 0;
    left: 309px;
    width: 96px;
	}
	.button_login {
    position: relative;
    display: block;
    width: 96px;
    height: 70px;
    font-size: 17px;
    font-weight: 500;
    text-align: center;
    font-family: -apple-system,BlinkMacSystemFont,Apple SD Gothic Neo,Roboto,Noto Sans CJK KR,Tahoma,'Noto Sans KR',sans-serif;
	}
	.option {
    position: absolute;
    top: 84px;
    left: 80px;
    width: 263px;
    font-size: 11px;
    color: #888;
	}
	.option label {
    margin-left: 3px;
    letter-spacing: -1px;
    vertical-align: top;
	}
	.option .checkbox {
    width: 13px;
    height: 13px;
    vertical-align: middle;
    margin-left: 21px;
	}
	.links {
    margin: 10px 45px 0 38px;
    padding-top: 14px;
    border-top: 1px solid #ebebeb;
	}
	.links .member {
    padding-left: 66px;
    font-size: 12px;
    height: 24px;
	}
	.links .member a:first-child {
    padding-left: 0;
	}
	.links .member a.join {
    border: none;
    color: #fbab60;
	}
	.links .member a {
    display: inline-block;
    height: 24px;
    margin: 0;
    padding: 0 15px;
    border-right: 1px solid #ebebeb;
    font-weight: bold;
	}
	.links .box__social-links {
    margin: 0px 0 0 64px;
	}
	.button_find-order-password {
    overflow: hidden;
    position: absolute;
    top: 78px;
    right: -93px;
    width: 96px;
    height: 31px;
    background: #929ba9;
    border: none;
    cursor: pointer;
    color: #fff;
    font-size: 11px;
    letter-spacing: -.5px;
    }
    .links .alert{
    	color: red;
    }
</style>
<script>
$(document).ready(function(){
	Naverlogin(${naverlogin});
	function Naverlogin(naverlogin){
		if(naverlogin!=null){
		$('body').css("display", "none");
		$('#username').val(naverlogin);
		$('#password').val(naverlogin);
		$('form').submit();
	}
	}
	$('input[type="radio"]').click(function(){
		if($( "input:checked").val()==="Y"){
			$('#mem_login').css("display", "block");
			$('#title_member').css("display", "block");
			
			$('#non_login').css("display", "none");
			$('#title_nonmember').css("display", "none");
		}else{
			$('#mem_login').css("display", "none");
			$('#title_member').css("display", "none");
			
			$('#non_login').css("display", "block");
			$('#title_nonmember').css("display", "block");
		}
	})
	
	$('input[type="submit"]').click(function(){
		let id = $('#username').val();
		let pw = $('#password').val();
		$('.alert').remove();
		if(id.length<1){
			$('.links').prepend("<p class='alert p-0 m-0 ml-5 pl-3'> 아이디를 입력하세요.")
		}else if(pw.length<1){
			$('.links').prepend("<p class='alert p-0 m-0 ml-5 pl-3'> 비밀번호를 입력하세요.")
		}else{
		let result = 0;
		$.ajax({
			url : "registercustomer/customeridcheck/"+id
			,dataType : "json"
			,async: false
			,success:function(data){
				console.log(data);
				result = data;
			}
			,error:function(e){
				console.log(e);
			}
		});
		if(result<1){
			$('.links').prepend("<p class='alert p-0 m-0 ml-5 pl-3'> 아이디가 존재하지 않습니다..")
			}else{
				$.ajax({
					url : "registercustomer/customerpwcheck/"+id+"/"+pw
					,dataType : "json"
					,async: false
					,success:function(data){
						console.log(data);
						result = data;
					}
					,error:function(e){
						console.log(e);
					}
				});
				if(result>0){
				$('form').submit();
				}else{
				$('.links').prepend("<p class='alert p-0 m-0 ml-5 pl-3'> 비밀번호를 다시 확인해 주세요.")
				}
		}
		}
		event.preventDefault();
	})		
});
</script>
</head>
<body>
	<header>
		<jsp:include page="Registration/Regheader.jsp" />
	</header>
	
	<div class="mx-auto mt-5 mb-5 row align-items-center " style="width: 490px;">
		<div class="col">
		
		<form method="post" action="${pageContext.request.contextPath}/login">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		
		<a href="${pageContext.request.contextPath}"><img alt="home" src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
		
		<div class="statusbox"></div>
		<div class="location"><a href="${pageContext.request.contextPath}">홈</a> > <strong>로그인</strong></div>
		
	
		<h3>
                <span id="title_member" class="title_login" style="display: block;">로그인</span>
                <span id="title_nonmember" class="sp_nomember title" style="display: none;">비회원 주문내역 조회</span>
        </h3>
	            <div class="member-select tt_min">
			    	<label for="member_y">
			    		<input type="radio" class="radio" name="member_yn" id="member_y" value="Y" checked> 회원
			    	</label>
			    	<label for="member_n">
			    		<input type="radio" class="radio" name="member_yn" id="member_n" value="N"> 비회원
			    	</label>
		    	</div>
		    <!-- ------------- -->	
		    <div id="mem_login" style="display: block;">	
		    	<div class="login-input">
				    <div class="user-input">
					    <label for="username">
					    <span class="txt">아이디</span>
					    <input style="width:174px;" type="text" name="username" id="username" required="required" placeholder="아이디" maxlength="10">
					    </label> 
						<label for="password">
						<span class="txt">비밀번호</span>
						<input style="width:174px;" type="password" name="password" id="password" required="required" placeholder="비밀번호는 6자 이상 ~ 15자 이하" maxlength="15">
						</label>
					</div>
				    <div class="option">
				        <label for="saveid">
                            <input type="checkbox" class="checkbox" id="saveid" name="saveid">아이디 저장
						</label>
					</div>
					<div class="btn-login">
					    <!-- <button type="submit" title="login" class="button_login"><span>로그인</span></button> -->
					    <input class="btn btn-secondary button_login" type="submit" value="로그인">
					</div>
				</div>
		    	<div class="links">
                   <p class="member">
                    <a id="goFindID" href="${pageContext.request.contextPath}/userlogin/FindID">아이디찾기</a>
                    <a id="goFindPassword" href="${pageContext.request.contextPath}/userlogin/FindPW">비밀번호찾기</a>
                    <a id="goDefault" href="RegistrationBuyer" class="join">회원가입</a>
                   </p>
					<div class="box__social-links mt-3">
                    	<a href="${apiURL}"><img id="naverlogin" src="${pageContext.request.contextPath}/resources/img/naverlogin.PNG"/></a>
                    </div>
				</div>

			</div>
			<!-- ------------- -->
			<div class="non_login" id="non_login" style="display: none;">
			    <!-- 비회원로그인폼 -->
				<div class="login-input" id="NonLogInInPut" style="display:block;">
				    <div class="user-input">
                        <label for="buyer_nm" title="비회원 구매자명 입력">
					    	<span class="txt">구매자명</span>
						    <input type="text" name="buyer_nm" id="buyer_nm" maxlength="50" style="width:174px;">
					    </label>
                        <label for="buyer_tel_no1" class="buyer_tel_no1">
						    <span class="txt">휴대폰번호</span>
						    <input type="text" style="width:48px;" name="buyer_tel_no1" id="buyer_tel_no1" maxlength="3">
                            <span class="dash">-</span>
                            <input type="text" style="width:49px;" name="buyer_tel_no2" id="buyer_tel_no2" maxlength="4">
                            <span class="dash">-</span>
                            <input type="text" style="width:49px;" name="buyer_tel_no3" id="buyer_tel_no3" maxlength="4">
					    </label>
                        <label for="nonmem_passwd" title="주문비밀번호 입력">
						    <span class="txt">주문비번</span>
							<input type="password" name="nonmem_passwd" id="nonmem_passwd" maxlength="10" style="width:174px;">
						</label>
					    <button type="button" id="nonmemPasswdPopup" class="button_find-order-password" tabindex="-1"><span>주문비밀번호 찾기</span></button>
					</div>
					<div class="btn-login">
					    <input class="btn btn-secondary button_login" type="submit" value="로그인">
					</div>
				</div>
 			 </div>				
		</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>
</body>
</html>