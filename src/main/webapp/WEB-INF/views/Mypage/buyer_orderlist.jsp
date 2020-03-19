<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.min.css">

<!-- Fancybox -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">

<!-- Nice Select CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/niceselect.css">

<!-- Animate CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css">

<!-- Eshop StyleSheet -->

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
</head>
<body>
	<section class="product-area shop-sidebar shop section">

		<div class="user-title">
			<h3>주문/배송내역</h3>
		</div>

		<div class="container">
			<div class="row">
				<!-- sidebar -->
				<div class="col-lg-3 col-md-4 col-12">
					<div class="shop-sidebar">
						<!-- Single Widget -->
						<div class="single-widget category ">
							<h3 class="title">마이페이지</h3>
							<ul class="categor-list">
								<li><a
									href="${pageContext.request.contextPath }/mypage/info">회원정보
										변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a href="#">판매 회원전환</a></li>
								<li><a href="#">주문/배송내역</a></li>
								<li><a href="#">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				<table class="table" style="position: relative;  width:850px; top:30px;">
					<thead>
						<tr>
							<th scope="col" style="width:120px;">주문번호</th>
							<th scope="col" style="width:150px; text-align: center;">상품정보</th>
							<th scope="col" style="text-align: center; width:200px;">상품명</th>
							<th scope="col">상품금액(수량)</th>
							<th scope="col">배송비</th>
							<th scope="col">주문상태</th>
						</tr>
					</thead>
					<tbody>
						
						<c:forEach var="pay" items="${buylist }">
						<tr>
							<th scope="row" style="width:180px; vertical-align: middle;">${pay.order_code }</th>
							
							
							<td><img src="${pageContext.request.contextPath }/${pay.thumb_img }"></td>
							<td style="vertical-align: middle; text-align: center;">${pay.product_name }</td>
							<td style="vertical-align: middle;">${(pay.price+pay.add_price)*pay.quantity}원  (${pay.quantity })</td>
							<td style="vertical-align: middle;">${pay.shipping_cost}원</td>
							<td style="vertical-align: middle;">${pay.delivery_state}</td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
		</div>
	</section>


</body>
</html>