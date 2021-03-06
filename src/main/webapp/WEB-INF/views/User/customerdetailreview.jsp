<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">

</head>

<style>
	.yellow i {
    color: #F7941D;
	}
	ul li{
		display: inline-block;	
	}
	ul {
	    list-style: none;
		padding: 0;		
    	margin: 0;
	}
	h1 {
	 color: white;
	 background-color: #fbab60;
	 font-size: 30px;
	 padding: 10px 0px;
	}
	img{
		width: 110px;
		height: 150px;
	}
	.content{
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 17px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: normal;
	}
	div .seller{
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 18px;
    white-space: nowrap;
    font-size: 13px;
    color: #bbb;
	}
	div .sellerbox{
	display: 
	}
	.topcontent{
	border-bottom: 3px solid #fbab60;
	}
	button{
	color : white;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
    height: 60px; 
	margin: 10px auto;
	display: flex;
	padding : 0px 50px;
	margin-top: 50px;
	}
</style>
<body>
<h1 class="text-center">상품평 보기</h1>
	<div class="container">
		<div class="row topcontent pb-3">
			<div class="col-3">
			<img class="loadimg" alt="thumb_img" src="${pageContext.request.contextPath }/${detail.thumb_img}">
			</div>
			<div class="col-9 pt-5">
			<span class="seller">[${detail.seller_name}]</span><br>
			<span class="content">${detail.product_name} (${detail.option1}${detail.option2}) [${detail.quantity}개]</span>
			<br>
				<ul class="reviews">
					<c:forEach begin="${1}" end="${detail.review_star}" step="${1}">
						<li class="yellow"><i class="ti-star"></i></li>
					</c:forEach>
					<c:forEach begin="${detail.review_star}" end="${4}" step="${1}">
						<li><i class="ti-star"></i></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<form method="post" action="#">
		<div class="form-group mt-4">
			${detail.review_content}
		</div>
	</form>
	</div>
</body>
</html>