<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	background-color: silver;
	margin: 10px auto;
	font-size: 2.6em;
	color: white;
	text-align: center;
	position: relative;
	padding: 50px;
	border-radius: 10px;
}

 .seller_nav{
	width: 1140px;
	margin: 10px auto;
	
	
}

.seller_nav_search{

	
}
</style>

</head>
<body>

	<div class="seller_main_top ">물망초의 꽃말</div>
	
	<div class="seller_nav">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Navbar</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-item nav-link active" href="#">Home <span
						class="sr-only">(current)</span></a> <a class="nav-item nav-link"
						href="#">Features</a> <a class="nav-item nav-link" href="#">Pricing</a>
					<a class="nav-item nav-link disabled" href="#" tabindex="-1"
						aria-disabled="true">Disabled</a>
						<div style="position:relative; left:445px;">
					<form class="form-inline my-2 my-lg-0" >
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
					</div>
				</div>
	
			</div>
		</nav>
	</div>



	<!-- Start Product Area -->
	<div class="product-area section">
		<div class="container">
			<div class="row">
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
							<ul class="nav nav-tabs" id="myTab" role="tablist">
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

							</ul>
							<!--/ End Tab Nav -->
						</div>
						<div class="tab-content" id="myTabContent">
							<!-- Start Single Tab -->
							<div class="tab-pane fade show active" id="man" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="${pageContext.request.contextPath}/resources/images/product1.jpg"
														alt="#"> <!-- 	<img class="hover-img" src="${pageContext.request.contextPath}/resources/images/product1.jpg" alt="#"> -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- 	<!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ End Single Tab -->
							<!-- Start Single Tab -->
							<div class="tab-pane fade" id="women" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ End Single Tab -->
							<!-- Start Single Tab -->
							<div class="tab-pane fade" id="kids" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ End Single Tab -->
							<!-- Start Single Tab -->
							<div class="tab-pane fade" id="accessories" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ End Single Tab -->
							<!-- Start Single Tab -->
							<div class="tab-pane fade" id="essential" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/ End Single Tab -->
							<!-- Start Single Tab -->
							<div class="tab-pane fade" id="prices" role="tabpanel">
								<div class="tab-single">
									<div class="row">
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Hot Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Pink Show</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="new">New</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Women Pant Collectons</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Bags Collection</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="price-dec">30% Off</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Awesome Cap For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Polo Dress For Women</a>
													</h3>
													<div class="product-price">
														<span>$29.00</span>
													</div>
												</div>
											</div>
										</div>
										<div class="col-xl-3 col-lg-4 col-md-4 col-12">
											<div class="single-product">
												<div class="product-img">
													<a href="product-details.html"> <img
														class="default-img"
														src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
														<span class="out-of-stock">Hot</span>
													</a>
													<div class="button-head">
														<div class="product-action">
															<a data-toggle="modal" data-target="#exampleModal"
																title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
																	Shop</span></a> <a title="Wishlist" href="#"><i
																class=" ti-heart "></i><span>Add to Wishlist</span></a> <a
																title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add
																	to Compare</span></a>
														</div>
														<div class="product-action-2">
															<a title="Add to cart" href="#">Add to cart</a>
														</div>
													</div>
												</div>
												<div class="product-content">
													<h3>
														<a href="product-details.html">Black Sunglass For
															Women</a>
													</h3>
													<div class="product-price">
														<span class="old">$60.00</span> <span>$50.00</span>
													</div>
												</div>
											</div>
										</div>
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
						<div class="single-product">
							<div class="product-img">
								<a href="product-details.html"> <img class="default-img"
									src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
									<span class="out-of-stock">Hot</span>
								</a>
								<div class="button-head">
									<div class="product-action">
										<a data-toggle="modal" data-target="#exampleModal"
											title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
												Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
												to Wishlist</span></a> <a title="Compare" href="#"><i
											class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#">Add to cart</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">Black Sunglass For Women</a>
								</h3>
								<div class="product-price">
									<span class="old">$60.00</span> <span>$50.00</span>
								</div>
							</div>
						</div>
						<!-- End Single Product -->
						<!-- Start Single Product -->
						<div class="single-product">
							<div class="product-img">
								<a href="product-details.html"> <img class="default-img"
									src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
								</a>
								<div class="button-head">
									<div class="product-action">
										<a data-toggle="modal" data-target="#exampleModal"
											title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
												Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
												to Wishlist</span></a> <a title="Compare" href="#"><i
											class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#">Add to cart</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">Women Hot Collection</a>
								</h3>
								<div class="product-price">
									<span>$50.00</span>
								</div>
							</div>
						</div>
						<!-- End Single Product -->
						<!-- Start Single Product -->
						<div class="single-product">
							<div class="product-img">
								<a href="product-details.html"> <img class="default-img"
									src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
									<span class="new">New</span>
								</a>
								<div class="button-head">
									<div class="product-action">
										<a data-toggle="modal" data-target="#exampleModal"
											title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
												Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
												to Wishlist</span></a> <a title="Compare" href="#"><i
											class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#">Add to cart</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">Awesome Pink Show</a>
								</h3>
								<div class="product-price">
									<span>$50.00</span>
								</div>
							</div>
						</div>
						<!-- End Single Product -->
						<!-- Start Single Product -->
						<div class="single-product">
							<div class="product-img">
								<a href="product-details.html"> <img class="default-img"
									src="https://via.placeholder.com/550x750" alt="#"> <!-- <img class="hover-img" src="https://via.placeholder.com/550x750" alt="#">  -->
								</a>
								<div class="button-head">
									<div class="product-action">
										<a data-toggle="modal" data-target="#exampleModal"
											title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick
												Shop</span></a> <a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add
												to Wishlist</span></a> <a title="Compare" href="#"><i
											class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
									</div>
									<div class="product-action-2">
										<a title="Add to cart" href="#">Add to cart</a>
									</div>
								</div>
							</div>
							<div class="product-content">
								<h3>
									<a href="product-details.html">Awesome Bags Collection</a>
								</h3>
								<div class="product-price">
									<span>$50.00</span>
								</div>
							</div>
						</div>
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
	<!-- <section class="shop-blog section">
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
	<!-- <section class="shop-services section home">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					Start Single Service
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>Free shiping</h4>
						<p>Orders over $100</p>
					</div>
					End Single Service
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					Start Single Service
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>Free Return</h4>
						<p>Within 30 days returns</p>
					</div>
					End Single Service
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					Start Single Service
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>Sucure Payment</h4>
						<p>100% secure payment</p>
					</div>
					End Single Service
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					Start Single Service
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>Best Peice</h4>
						<p>Guaranteed price</p>
					</div>
					End Single Service
				</div>
			</div>
		</div>
	</section> -->
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span class="ti-close" aria-hidden="true"></span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row no-gutters">
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
							<!-- Product Slider -->
							<div class="product-gallery">
								<div class="quickview-slider-active">
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
									<div class="single-slider">
										<img src="https://via.placeholder.com/569x528" alt="#">
									</div>
								</div>
							</div>
							<!-- End Product slider -->
						</div>
						<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
							<div class="quickview-content">
								<h2>Flared Shift Dress</h2>
								<div class="quickview-ratting-review">
									<div class="quickview-ratting-wrap">
										<div class="quickview-ratting">
											<i class="yellow fa fa-star"></i> <i
												class="yellow fa fa-star"></i> <i class="yellow fa fa-star"></i>
											<i class="yellow fa fa-star"></i> <i class="fa fa-star"></i>
										</div>
										<a href="#"> (1 customer review)</a>
									</div>
									<div class="quickview-stock">
										<span><i class="fa fa-check-circle-o"></i> in stock</span>
									</div>
								</div>
								<h3>$29.00</h3>
								<div class="quickview-peragraph">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Mollitia iste laborum ad impedit pariatur esse optio
										tempora sint ullam autem deleniti nam in quos qui nemo ipsum
										numquam.</p>
								</div>
								<div class="size">
									<div class="row">
										<div class="col-lg-6 col-12">
											<h5 class="title">Size</h5>
											<select>
												<option selected="selected">s</option>
												<option>m</option>
												<option>l</option>
												<option>xl</option>
											</select>
										</div>
										<div class="col-lg-6 col-12">
											<h5 class="title">Color</h5>
											<select>
												<option selected="selected">orange</option>
												<option>purple</option>
												<option>black</option>
												<option>pink</option>
											</select>
										</div>
									</div>
								</div>
								<div class="quantity">
									<!-- Input Order -->
									<div class="input-group">
										<div class="button minus">
											<button type="button" class="btn btn-primary btn-number"
												disabled="disabled" data-type="minus" data-field="quant[1]">
												<i class="ti-minus"></i>
											</button>
										</div>
										<input type="text" name="quant[1]" class="input-number"
											data-min="1" data-max="1000" value="1">
										<div class="button plus">
											<button type="button" class="btn btn-primary btn-number"
												data-type="plus" data-field="quant[1]">
												<i class="ti-plus"></i>
											</button>
										</div>
									</div>
									<!--/ End Input Order -->
								</div>
								<div class="add-to-cart">
									<a href="#" class="btn">Add to cart</a> <a href="#"
										class="btn min"><i class="ti-heart"></i></a> <a href="#"
										class="btn min"><i class="fa fa-compress"></i></a>
								</div>
								<div class="default-social">
									<h4 class="share-now">Share:</h4>
									<ul>
										<li><a class="facebook" href="#"><i
												class="fa fa-facebook"></i></a></li>
										<li><a class="twitter" href="#"><i
												class="fa fa-twitter"></i></a></li>
										<li><a class="youtube" href="#"><i
												class="fa fa-pinterest-p"></i></a></li>
										<li><a class="dribbble" href="#"><i
												class="fa fa-google-plus"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal end -->

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