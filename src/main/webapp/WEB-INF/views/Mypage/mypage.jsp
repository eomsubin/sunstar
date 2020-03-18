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
	<form role="form" method="post">
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="id" class="id"
				value='<sec:authentication property="principal.UserInfo.id"/>'>
		</sec:authorize>
	</form>
	<!-- Product Style -->
	<section class="product-area shop-sidebar shop section">

		<div class="user-title">
			<h3> ${info.name }님의 기본 정보</h3>
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
								<li><a href="#">회원정보 변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a href="#">판매 회원전환</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="#">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				<!-- sidebar -->
				<form>
					<div class="info-form">
						<div class="form-group">
							<label for="exampleInputEmail1">이름</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" value="${info.name }" readonly="readonly">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">아이디</label> <input type="text"
								class="form-control" id="exampleInputPassword1" value="${info.id }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>비밀번호</label>
							<button type="button"
								class="btn btn-outline-secondary form-control">비밀번호 변경</button>
						</div>
					</div>
					<h3 class="info-tel">연락처</h3>
					<div class="info-form2">

						<div class="form-group">
							
							<label>휴대폰번호</label> <input type="text" class="form-control"
								id="tel" value="${info.tel }">
							<button type="button" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >변경</button>
						</div>
						<div class="form-group">
							
							<label>이메일</label> <input type="email" class="form-control"
								id="email" value="${info.email }">
							<button type="button" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >변경</button>
						</div>
						
						
					
					</div>	
					<h3 class="info-tel">기본 배송지</h3>
					<div class="info-form2">

						<div class="form-group">
							
							 <input type="text" class="form-control"
								id="zip" value="${info.zip }" readonly="readonly">
							<button type="button" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >주소 찾기</button>
						</div>
						<div class="form-group">
								 <input type="text" class="form-control"
								id="address1" value="${info.address1 }  ${info.address2}" readonly="readonly">
						
						</div>
						 <input type="text" class="form-control"
								id="address2" value="${info.address3 }" readonly="readonly">
						
					
					</div>	
				</form>
			</div>
		</div>
	</section>

	<!-- Slicknav JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<!-- <script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script> -->
	<!-- Countdown JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<!-- 	<script src="${pageContext.request.contextPath}/resources/js/nicesellect.js"></script> -->
	<!-- Flex Slider JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
	<!-- Active JS -->
		<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>


</body>
</html>