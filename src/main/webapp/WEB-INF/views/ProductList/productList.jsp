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
${productlist}
<br><br>
<c:forEach var="list" items="${productlist}">
	${list.product_name}
	<br>
</c:forEach>
</body>
</html>