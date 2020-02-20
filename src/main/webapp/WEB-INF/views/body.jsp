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
<div class="mx-auto" style="width: 500px;">
	<h1>Hello SBBJ User!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<c:if test="${empty userinfo}"><a class="btn btn-secondary" href="login">로그인</a></c:if>
	<c:if test="${!empty userinfo}"><a class="btn btn-secondary" href="logout">로그아웃</a>${userinfo.response.name}님 환영합니다.</c:if>
	</div>
</body>
</html>