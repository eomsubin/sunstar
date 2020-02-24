<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<div class="mx-auto" style="width: 500px;">
	<h1>Hello SBBJ User!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<c:if test="${empty userinfo}"><a class="btn btn-secondary" href="login">로그인</a></c:if>
	<c:if test="${!empty userinfo}"><a class="btn btn-secondary" href="logout">로그아웃</a>${userinfo.response.name}님 환영합니다.</c:if>
</div>
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active"><!-- style="width:976px;height:400px" -->
      <img src="resources/img/SBBJcat.png" width="976" height="400" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/img/SBBJcat.png" width="976" height="400" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="resources/img/SBBJcat.png" width="976" height="400" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" style="width:46px;height:70px;" aria-hidden="true"></span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" style="width:46px;height:70px;" aria-hidden="true"></span>
  </a>
</div>
</div>
</body>
</html>