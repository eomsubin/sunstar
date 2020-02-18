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
	<a class="btn btn-secondary" href="login">로그인</a>
	상태 토큰 : ${state} 유저 접속 토큰 : ${user.access_token} 유저 : ${user} 아이디
	</div>
</body>
</html>