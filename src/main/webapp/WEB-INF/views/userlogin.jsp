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
		width:130px; height : 40px;}
	.logbtn{
		width:130px; 
	}
	input[type="submit"] {
	color : white !important;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="Registration/Regheader.jsp" />
	</header>
	<div class="mx-auto mb-5 row align-items-center " style="width: 400px; height: 500px;">
		<div class="col">
		<form method="post" action="${pageContext.request.contextPath}/login">
		<a href="${pageContext.request.contextPath}"><img alt="home" src="${pageContext.request.contextPath}/resources/img/logo.png"></a>
				<label for="username"></label> 
				<input type="text" name="username" id="username" required="required" placeholder="아이디">
				<br>
				<label for="password"></label> 
				<input type="password" name="password" id="password" required="required" placeholder="비밀번호는 6자 이상 ~ 20자 이하">
				<br>
				<input class="btn btn-secondary" type="submit" value="로그인">
				<br>
				<a href="#">아이디찾기</a> | <a href="#">비밀번호찾기</a> | <a href="RegistrationBuyer">회원가입</a>
				<br>
				<a href="${apiURL}"><img id="naverlogin" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>			
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer2.jsp" />
	</footer>
</body>
</html>