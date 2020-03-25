<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	ul li{
	list-style : none;}
</style>
<script>	
	$(document).ready(function(){
		$('button').trigger("click");
	});
</script>
<body>	
		<form method="post" action="/userlogout">
			<ul>
				<li><button></button></li>
				<li><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></li>
			</ul>
		</form>
</body>
</html>