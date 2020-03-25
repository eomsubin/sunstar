<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
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
	href="${pageContext.request.contextPath}/resources/css/reset.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
	
</head>
<body>
	<section class="product-area shop-sidebar shop section">
	<div class="container">
			<div class="row">

				<!-- sidebar -->
				<div class="col-lg-3 col-md-4 col-12">
					<div class="shop-sidebar">
						<!-- Single Widget -->
						<div class="single-widget category ">
							<h3 class="title">마이페이지</h3>
							<ul class="categor-list">
								<li><a href="${pageContext.request.contextPath }/mypage/info">회원정보 변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/seller_register">판매 회원전환</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				</div>
				</div>
				</section>
</body>
</html>