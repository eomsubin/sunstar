<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<!-- Web Font -->


<!-- StyleSheet -->

<!-- Bootstrap -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/header.css">



<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"> -->
<!-- Magnific Popup -->
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<style>
.seller_main_top {
	width: 1140px;
	height: 140px;
	/* 	background-color: silver;
 */
	margin: 10px auto;
	font-size: 2.6em;
	/* 	color: white;
 */
	text-align: center;
	position: relative;
	padding: 50px;
	border-radius: 10px;
}

.seller_nav {
	width: 1140px;
	margin: 10px auto;
}

.noticeevent {
	margin:  0 auto;
}
.noticeevent img {
	width: 25%;
	text-align: center;
	margin: 20px auto;
	padding: 20px;
	align-content: center;
	align-items: center;
}

.optcol {
	display: none;
}

.opt_a {
	color: #143d59;
	background-color: #f4b41a;
}

.opt_b {
	color: #7bd9c1;
	background-color: #200371;
}

.opt_c {
	color: #ff7129;
	background-color: #2e2f29;
}

.opt_d {
	color: #5b0e2e;
	background-color: #fea982;
}

.opt_e {
	color: #5f0020;
	background-color: #01dbda;
}

.opt_f {
	color: #f3b019;
	background-color: #01164f;
}

.opt_g {
	color: #239135;
	background-color: #ffd65a;
}

</style>

<script>
	$(document).ready(function() {

		let a = $('.optcol').val();
		console.log(a);
		if (a == "opt_a") {
			$('.seller_main_top').addClass('opt_a');
		} else if (a == "opt_b") {
			$('.seller_main_top').addClass('opt_b');
		} else if (a == "opt_c") {
			$('.seller_main_top').addClass('opt_c');
		} else if (a == "opt_d") {
			$('.seller_main_top').addClass('opt_d');
		} else if (a == "opt_e") {
			$('.seller_main_top').addClass('opt_e');
		} else if (a == "opt_f") {
			$('.seller_main_top').addClass('opt_f');
		} else if (a == "opt_g") {
			$('.seller_main_top').addClass('opt_g');
		} else if (a == "opt_h") {
			$('.seller_main_top').addClass('opt_h');
		} else if (a == "opt_i") {
			$('.seller_main_top').addClass('opt_i');
		} else if (a == "opt_j") {
			$('.seller_main_top').addClass('opt_j');
		}

	})
</script>
</head>
<body>

	<div class="seller_main_top">${sdto.seller_name }
	<input type="hidden" class="optcol" id="optcol"
								value="${sdto.seller_color}"></div>


	



	<!-- Start Product Area -->
	<div class="product-area section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>공지 / 이벤트</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="noticeevent">
						 <img src="${pageContext.request.contextPath}/${sdto.comm_img1}">
     					 <img src="${pageContext.request.contextPath}/${sdto.comm_img2}">
						 <img src="${pageContext.request.contextPath}/${sdto.comm_img3}">
					</div>
				</div>
			</div>

			<div class="row" style="margin-top: 40px;">
				<div class="col-12">
					<div class="section-title">

						<h2>SBBJ BEST</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="product-info">
						<div class="nav-main">
							<!-- Tab Nav -->
<!-- 							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#man" role="tab">패션</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#women" role="tab">디지털/가전</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#kids" role="tab">가구/인테리어</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#accessories" role="tab">식품</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#essential" role="tab">반려동물</a></li>

							</ul> -->
							<!--/ End Tab Nav -->
						</div>
						<div class="tab-content" id="myTabContent">
							<!-- Start Single Tab -->
							<div class="tab-pane fade show active" id="man" role="tabpanel">
								<div class="tab-single">
									<div class="row">

										<!-- ** -->
										<c:forEach var="p" items="${productlist}">
											<div class="col-xl-3 col-lg-4 col-md-4 col-12">
												<div class="single-product">
													<div class="product-img">
														<a href="${pageContext.request.contextPath}/detailview2?product_code=${p.product_code }"><img
															src="${pageContext.request.contextPath}/${p.thumb_img}"> <!-- 	<img class="hover-img" src="${pageContext.request.contextPath}/resources/images/product1.jpg" alt="#"> -->
														</a>
													</div>
													<div class="product-content">
														<h3>
															<a href="product-details.html">${p.product_name}</a>
														</h3>
														<div class="product-price">
															<span><fmt:formatNumber pattern="###,###,###" value="${p.price}" />원</span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- ** -->

									</div>
								</div>
							</div>
							
							
							
							
							<!--/ End Single Tab -->
					
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Product Area -->

	<!-- Start Midium Banner  -->
	<section class="midium-banner">
		<div class="container">
			<div class="row">
				<!-- Single Banner  -->
				<!-- <div class="col-lg-6 col-md-6 col-12">
					<div class="single-banner">
						<img src="https://via.placeholder.com/600x370" alt="#">
						<div class="content">
							<p>Man's Collectons</p>
							<h3>Man's items <br>Up to<span> 50%</span></h3>
							<a href="#">Shop Now</a>
						</div>
					</div>
				</div> -->
				<!-- /End Single Banner  -->
				<!-- Single Banner  -->
				<!-- <div class="col-lg-6 col-md-6 col-12">
					<div class="single-banner">
						<img src="https://via.placeholder.com/600x370" alt="#">
						<div class="content">
							<p>shoes women</p>
							<h3>mid season <br> up to <span>70%</span></h3>
							<a href="#" class="btn">Shop Now</a>
						</div>
					</div>
				</div> -->
				<!-- /End Single Banner  -->
			</div>
		</div>
	</section>
	<!-- End Midium Banner -->

	<!-- Start Most Popular -->
	<div class="product-area most-popular section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>최신 상품</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="owl-carousel popular-slider">
						<!-- Start Single Product -->
						
						<c:forEach var="n" items="${newlist }">
						<div class="single-product">
							<div class="product-img">
								<a href="${pageContext.request.contextPath}/detailview2?product_code=${n.product_code }"> <img class="default-img"
									src="${pageContext.request.contextPath}/${n.thumb_img}" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
									<span class="new">New</span>
								</a>
								
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">${n.product_name}</a>
								</h3>
								<div class="product-price">
									<!-- <span class="old">$60.00</span> --> <span>
									<fmt:formatNumber pattern="###,###,###" value="${n.price}" />원</span>
								</div>
							</div>
						</div>
						</c:forEach>
						<!-- End Single Product -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Most Popular Area -->


	<!-- Start Cowndown Area -->
	<!-- <section class="cown-down">
		<div class="section-inner ">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-6 col-12 padding-right">
						<div class="image">
							<img src="https://via.placeholder.com/750x590" alt="#">
						</div>	
					</div>	
					<div class="col-lg-6 col-12 padding-left">
						<div class="content">
							<div class="heading-block">
								<p class="small-title">Deal of day</p>
								<h3 class="title">Beatutyful dress for women</h3>
								<p class="text">Suspendisse massa leo, vestibulum cursus nulla sit amet, frungilla placerat lorem. Cars fermentum, sapien. </p>
								<h1 class="price">$1200 <s>$1890</s></h1>
								<div class="coming-time">
									<div class="clearfix" data-countdown="2021/02/30"></div>
								</div>
							</div>
						</div>	
					</div>	
				</div>
			</div>
		</div>
	</section> -->
	<!-- /End Cowndown Area -->

	<!-- Start Shop Blog  -->
	<!--  <section class="shop-blog section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>From Our Blog</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-6 col-12">
					Start Single Blog 
					<div class="shop-single-blog">
						<img src="https://via.placeholder.com/370x300" alt="#">
						<div class="content">
							<p class="date">22 July , 2020. Monday</p>
							<a href="#" class="title">Sed adipiscing ornare.</a>
							<a href="#" class="more-btn">Continue Reading</a>
						</div>
					</div>
					End Single Blog 
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					Start Single Blog 
					<div class="shop-single-blog">
						<img src="https://via.placeholder.com/370x300" alt="#">
						<div class="content">
							<p class="date">22 July, 2020. Monday</p>
							<a href="#" class="title">Man’s Fashion Winter Sale</a>
							<a href="#" class="more-btn">Continue Reading</a>
						</div>
					</div>
					End Single Blog 
				</div>
				<div class="col-lg-4 col-md-6 col-12">
					Start Single Blog 
					<div class="shop-single-blog">
						<img src="https://via.placeholder.com/370x300" alt="#">
						<div class="content">
							<p class="date">22 July, 2020. Monday</p>
							<a href="#" class="title">Women Fashion Festive</a>
							<a href="#" class="more-btn">Continue Reading</a>
						</div>
					</div>
					End Single Blog 
				</div>
			</div>
		</div>
	</section> -->
	<!-- End Shop Blog  -->

	<!-- Start Shop Services Area -->
	 <section class="shop-services section home">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>무료배송</h4>
						<p>${sdto.free_shipping_cost }원 이상 구매시</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>무료 교환&반품 서비스</h4>
						<p>수령 10일 이내</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-crown"></i>
						<h4>최상의 품질</h4>
						<p>저렴한 가격</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>저렴한 가격</h4>
						<p>최상의 품질</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section> 
	<!-- End Shop Services Area -->

	<!-- Start Shop Newsletter  -->
	<!-- <section class="shop-newsletter section">
		<div class="container">
			<div class="inner-top">
				<div class="row">
					<div class="col-lg-8 offset-lg-2 col-12">
						Start Newsletter Inner
						<div class="inner">
							<h4>Newsletter</h4>
							<p> Subscribe to our newsletter and get <span>10%</span> off your first purchase</p>
							<form action="mail/mail.php" method="get" target="_blank" class="newsletter-inner">
								<input name="EMAIL" placeholder="Your email address" required="" type="email">
								<button class="btn">Subscribe</button>
							</form>
						</div>
						End Newsletter Inner
					</div>
				</div>
			</div>
		</div>
	</section> -->
	<!-- End Shop Newsletter -->

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

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