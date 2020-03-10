<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css"> 
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/responsive.css">
     <style>
	.topbar {
		border-bottom: 1px solid #eee !important; 
		height : 49px;
	}
</style>
</head>
<body>
<header class="header shop">
<div class="topbar">
			<div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-12">
						<!-- Top Left -->
						<div class="top-left">
							<ul class="list-main">
								<li><a href="${pageContext.request.contextPath}"><img style="width:60px; height:25px;" src="${pageContext.request.contextPath}/resources/img/logo.png" alt="logo"></a></li>
							</ul>
						</div>
						<!--/ End Top Left -->
					</div>
					<div class="col-lg-8 col-md-12 col-12">
						<!-- Top Right -->
						<div class="right-content">
							<ul class="list-main">
								<!-- <li><i class="ti-location-pin"></i> Store location</li>
								<li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li> -->
								
								 <sec:authorize access="isAnonymous()"><li><i class="ti-user"></i> <a href="${pageContext.request.contextPath}/RegistrationBuyer">회원가입</a></li></sec:authorize>
								 <sec:authorize access="isAuthenticated()"><li><i class="ti-user"></i> <a href="#">마이페이지</a></li></sec:authorize>
								 
								 <sec:authorize access="isAnonymous()"><li><i class="ti-power-off"></i><a href="${pageContext.request.contextPath}/userlogin">로그인</a></li></sec:authorize>
								 <sec:authorize access="isAuthenticated()"><sec:authentication property="principal.UserInfo.name"/>님<li><i class="ti-power-off"></i><a href="${pageContext.request.contextPath}/userlogout">로그아웃</a></li></sec:authorize>
							</ul>
						</div>
						<!-- End Top Right -->
					</div>
				</div>
			</div>
		</div>
		<!-- End Topbar -->
		</header>
</body>
</html>