<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	function returnorder(order_code)
	{
	      opener.jusoCallBack(order_code);
	      window.close();
	}
</script>
<style>
ul li {
list-style: none;
margin: 1%;
font-family: '고딕';
font-size: 13px;
margin-right: 2%;
}

h3{
margin-left: 40px;
margin-bottom: 2px;
}

hr{
border: 1px solid #fbab60}

img{
width: 55px;
height: 75px;
}

span{
padding-right: 2%;
}

.none{
margin:6%;
}

</style>
</head>
<body>

<h3>주문내역</h3>
<hr>
<c:if test="${list[0] eq null}">
 <div class="none">주문 내역이 없습니다.</div>
 </c:if>

<c:if test="${list ne null}">
<ul>
<c:forEach var="item" items="${list}">
<li><span><img src="/${item.thumb_img}" class="thumimg"/></span><a href="javascript:returnorder(${item.order_code})">${item.order_code}</a>
	<span>${item.product_name}</span>${quantity}
</li>
</c:forEach>
</ul>
</c:if>
<hr>
	
</body>
</html>