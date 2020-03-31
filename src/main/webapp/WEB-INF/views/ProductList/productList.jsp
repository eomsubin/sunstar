<%@page import="java.util.ArrayList"%>
<%@page import="com.sunstar.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	/* Sinlge Product */
	.single-product{
		margin-top:50px;
	}
	.single-product .product-img {
	  position: relative;
	  overflow: hidden;
	  cursor:pointer;
	}
	.single-product .product-img a {
	  display: block;
	  position: relative;
	}
	.single-product .product-img a img {
	  width: 100%;
	}
	.single-product .product-img a img.hover-img {
	  position: absolute;
	  left: 0;
	  top: 0;
	  z-index: 1;
	  opacity: 0;
	  transition: opacity 0.5s ease, transform 2s cubic-bezier(0, 0, 0.44, 1.18), -webkit-transform 2s cubic-bezier(0, 0, 0.44, 1.18);
	}
	.single-product .product-img a span.price-dec {
		background-color: #f6931d;
		display: inline-block;
		font-size: 11px;
		color: #fff;
		right: 20px;
		top: 20px;
		padding: 1px 16px;
		font-weight: 700;
		border-radius: 0;
		text-align: center;
		position: absolute;
		text-transform: uppercase;
		border-radius: 30px;
		height: 26px;
		line-height: 25px;
	}
	.single-product .product-img a span.new {
		background-color: #8493ca;
		display: inline-block;
		font-size: 11px;
		color: #fff;
		right: 20px;
		top: 20px;
		padding: 1px 16px;
		font-weight: 700;
		border-radius: 0;
		text-align: center;
		position: absolute;
		text-transform: uppercase;
		border-radius: 30px;
		height: 26px;
		line-height: 24px;
	}
	.single-product .product-img a span.out-of-stock {
		background-color: #ed1b24;
		display: inline-block;
		font-size: 11px;
		color: #fff;
		right: 20px;
		top: 20px;
		padding: 1px 16px;
		font-weight: 700;
		border-radius: 0;
		text-align: center;
		position: absolute;
		text-transform: uppercase;
		border-radius: 30px;
		height: 26px;
		line-height: 24px;
	}
	.single-product .product-img .product-action {
		display: inline-block;
		position: absolute;
		right: 0;
		bottom: 0;
		z-index: 99;
		border-radius: 3px;
	}
	.single-product .product-img .product-action a {
		background-color: transparent;
		color: #333;
		display: block;
		font-size: 16px;
		display: inline-block;
		margin-right: 15px;
		text-align: right;
		height: 52px;
		position: relative;
		top: 2px;
	}
	.single-product .product-img .product-action a:last-child{
		margin-right:0;
		border:none;
	}
	.single-product .product-img .product-action a i {
	  line-height: 40px;
	}
	.single-product .product-img .product-action a span {
		visibility: hidden;
		position: absolute;
		background: #F7941D !important;
		color: #fff !important;
		text-align: center;
		padding: 5px 12px;
		z-index: 3;
		opacity: 0;
		-webkit-transition: opacity .6s, margin .3s;
		-o-transition: opacity .6s, margin .3s;
		transition: opacity .6s, margin .3s;
		font-size: 11px;
		right: 0;
		line-height: 14px;
		top: -12px;
		margin-top: -5px;
		margin-right: 0;
		display: inline-block;
		width: 120px;
		border-radius:15px 0 0 15px;
	}
	.single-product .product-img .button-head .product-action a span::after {
		position: absolute;
		content: "";
		right: 0;
		bottom: -12px;
		border: 6px solid #F7941D;
		border-left:0px solid transparent;
		border-right:6px solid transparent;
		border-bottom:6px solid transparent;
	}
	.single-product .product-img .product-action a:hover {
		color:#F7941D;
	}
	.single-product .product-img .product-action a:hover span {
	  visibility: visible;
	  opacity: 1;
	  color:#333;
	  background:#fff;
	  margin-top: -12px;
	}
	.single-product .product-img .product-action.pro-action-width-dec a {
	  width: 30px;
	  height: 30px;
	  font-size: 14px;
	}
	.single-product .product-img .product-action.pro-action-width-dec a i {
	  line-height: 30px;
	}
	.single-product .product-img .product-action.pro-action-width-dec-2 {
	  bottom: 45px;
	}
	.single-product .product-img .product-action-2 {
		position: absolute;
		left: 0;
		bottom: 0;
		text-align: left;
		z-index: 99;
		-webkit-transition: all 250ms ease-out;
		-o-transition: all 250ms ease-out;
		transition: all 250ms ease-out;
	}
	.single-product .product-img .product-action-2 a {
		display: block;
		background-color: transparent;
		color: #333;
		text-align: left;
		font-size: 12px;
		font-weight: 600;
		text-transform: uppercase;
		line-height: 1;
		display: inline-block;
	}
	.single-product .product-img .product-action-2 a:hover {
	  color:#F7941D;
	}
	.single-product .button-head {
		background: #fff;
		display: inline-block;
		height: 40px;
		width: 100%;
		position: absolute;
		left: 0;
		bottom: -50px;
		z-index: 9;
		height: 50px;
		line-height: 50px;
		-webkit-transition:all 0.4s ease;
		-moz-transition:all 0.4s ease;
		transition:all 0.4s ease;
	}
	.single-product:hover .button-head{
		bottom:0;
	}
	.single-product .product-img .shop-list-quickview {
	  position: absolute;
	  top: 50%;
	  -webkit-transform: translateY(-50%);
	  -ms-transform: translateY(-50%);
	  transform: translateY(-50%);
	  left: 0;
	  right: 0;
	  text-align: center;
	  z-index: 99;
	  margin-top: 20px;
	  visibility: hidden;
	  opacity: 0;
	  -webkit-transition: all .35s ease 0s;
	  -o-transition: all .35s ease 0s;
	  transition: all .35s ease 0s;
	}
	.single-product .product-img .shop-list-quickview a {
	  color: #000;
	  background-color: #fff;
	  display: inline-block;
	  width: 50px;
	  height: 50px;
	  border-radius: 100%;
	  font-size: 18px;
	}
	.single-product .product-img .shop-list-quickview a:hover {
	  background-color: #222;
	  color: #fff;
	}
	.single-product .product-img .shop-list-quickview a i {
	  line-height: 50px;
	}
	.single-product .product-content{
		margin-top:20px;
	}
	.single-product .product-img:hover.default-overlay::before {
	  background-color: rgba(38, 38, 38, 0.2);
	  z-index: 9;
	  -webkit-transition: all 250ms ease-out;
	  -o-transition: all 250ms ease-out;
	  transition: all 250ms ease-out;
	  pointer-events: none;
	  opacity: 1;
	}
	.single-product .product-img:hover.default-overlay.metro-overlay::before {
	  background-color: rgba(38, 38, 38, 0.4);
	  z-index: 9;
	  -webkit-transition: all 250ms ease-out;
	  -o-transition: all 250ms ease-out;
	  transition: all 250ms ease-out;
	  pointer-events: none;
	  opacity: 1;
	}
	.single-product .product-img:hover img.hover-img {
	  opacity: 1;
	}
	.single-product .product-content h3 {
	    line-height: 22px;
	}
	.single-product .product-content h3 a {
		font-size: 14px;
		font-weight: 500;
		margin: 0;
	}
	.single-product .product-content h3 a:hover{
		color:#F7941D;
	}
	.single-product .product-content .product-price {
	  margin: 6px 0 0 0;
	}
	.single-product .product-content .product-price span {
		font-size: 15px;
		font-weight: 500;
	}
	.single-product .product-content .product-price span.old {
	  text-decoration: line-through;
	  opacity: .6;
	  margin-right: 2px;
	}
	.shop-sidebar .single-widget {
	margin-top: 30px;
	background: #F6F7FB;
	padding: 30px;
}
.shop-sidebar .single-widget:first-child {
	margin-top: 0;
}
.shop-sidebar .single-widget .title {
	position: relative;
	font-size: 18px;
	font-weight: 500;
	text-transform: capitalize;
	margin-bottom: 25px;
	display: block;
	border-bottom: 1px solid #ddd;
	padding-bottom: 15px;
}
/* Shop Price */
.shop .range .price-filter {
	display: block;
	margin-top: 20px;
}
.shop .range #slider-range {
	box-shadow: none;
	border: none;
	height: 4px;
	background: #F7941D;
	color: #F7941D;
	border-radius: 0px;
}
.shop .range #slider-range .ui-slider-range {
	box-shadow: none;
	background: #222;
	border-radius: 0px;
	border: none;
}
.shop .range .ui-slider-handle.ui-state-default.ui-corner-all {
	width: 14px;
	height: 14px;
	line-height: 10px;
	background: #222;
	border: none;
	border-radius: 100%;
	top: -5px;
}
.shop .range .label-input {
	margin-top: 15px;
}
.shop .range .label-input span{
	margin-right:5px;
	color:#282828;
}
.shop .range .ui-slider-handle.ui-state-default.ui-corner-all {
	background: #F7941D;
	color: #F7941D;
	cursor:pointer;
}
.shop .range .label-input input {
	border: none;
	margin: 0;
	font-weight: 600;
	font-size: 14px;
	color: #222;
	background: transparent;
}
.shop .range .check-box-list {
	margin-top: 15px;
}
.shop .range .check-box-list li {
	margin-bottom: 5px;
}
.shop .range .check-box-list li:last-child{
	margin:0;
}
.shop .range .check-box-list li label input {
	display: inline-block;
	margin-right: 6px;
	position: relative;
	top: 1px;
}
.shop .range .check-box-list li label {
	margin: 0;
	font-size: 14px;
	font-weight: 400;
	color:#333;
	cursor:pointer;
}
.shop .range .check-box-list .count{
	margin-left:5px;
	color:#666;
}
/* Category List */
.shop-sidebar .categor-list {
	margin-top: 10px;
}
.shop-sidebar .categor-list li{
	
}
.shop-sidebar .categor-list li {
	margin-bottom: 10px;
}
.shop-sidebar .categor-list li:last-child{
	margin-bottom:0px;
}
.shop-sidebar .categor-list li a {
	display: inline-block;
	color: #666;
	font-weight: 400;
	font-size: 14px;
	text-transform: capitalize;
}
.shop-sidebar .categor-list li a:hover{
	color:#F7941D;
}
/* Recent Post */
.shop-sidebar .single-post {
	position: relative;
	margin-top: 30px;
    padding-bottom: 30px;
	border-bottom: 1px solid #ddd;
}
.shop-sidebar .single-post.first{
	padding-top:0px;
}
.shop-sidebar .single-post:last-child{
	padding-bottom:0px;
	border:none;
}
.shop-sidebar .single-post .image img{
	height: 80px;
	width: 80px;
	position:absolute;
	left:0;
	top:0;
	border-radius:100%;
}
.shop-sidebar .single-post .content{
	padding-left:100px;
}
.shop-sidebar .single-post .content h5 {
	line-height: 18px;
}
.shop-sidebar .single-post .content h5 a {
	color: #222;
	font-weight: 500;
	font-size: 14px;
	font-weight: 500;
	display: block;
}
.shop-sidebar .single-post .content h5 a:hover{
	color:#F7941D;
}
.shop-sidebar .single-post .content .price {
	display: block;
	color: #333;
	font-weight: 500;
	margin: 5px 0 0px 0;
	text-transform: uppercase;
	font-size: 14px;
}
.shop-sidebar .single-post .reviews li{
	display:inline-block;
}
.shop-sidebar .single-post .reviews li i{
	color:#999;
}
.shop-sidebar .single-post .reviews li.yellow i{
	color:#F7941D;
}
/* Shop Topbar */
.shop .shop-top {
	clear: both;
	background: #f6f7fb;
	padding: 18px 20px 50px 20px;
}
.shop .shop-shorter {
	float: left;
}
.shop .single-shorter {
	display: inline-block;
	margin-right: 10px;
}
.shop .single-shorter:last-child{
	margin:0;
}
.shop .single-shorter label {
	display: inline-block;
	float: left;
	margin: 4px 5px 0 0;
	font-weight:500;
}
.shop .single-shorter option{}
.shop .nice-select {
	clear: initial;
	display: inline-block;
	margin: 0;
	border: 1px solid #e6e6e6;
	border-radius: 0px;
	height: auto;
	width: auto;
	border-radius: 0px;
}
.shop .nice-select::after{
	border-color:#888;
}
.shop .nice-select .list {
	border-radius:0px;
}
.shop .nice-select .option.selected {
	font-weight: 500;
}
.shop .nice-select .list li{
	color:#666;
	border-radius:0px;
}
.shop .nice-select .list li:hover{
	background:#F7941D;
	color:#fff;
}
.shop .view-mode {
	float: right;
}
.shop .view-mode li {
	display: inline-block;
	margin-right: 5px;
}
.shop .view-mode li:last-child{
	margin:0;
}
.shop .view-mode li a {
	width: 43px;
	height: 32px;
	background: transparent;
	border: 1px solid #77777775;
	text-align: center;
	display: block;
	line-height: 32px;
	color: #888;
	border-radius: 0px;
}
.shop .view-mode li.active a,
.shop .view-mode li:hover a {
	background: #F7941D;
	color:#fff;
	border-color:transparent;
}
	.page-link{
	color: black;
	border: 0px solid silver;
	background-color: #f6f7fb;
}
	.pagination > .disabled > a{
	background-color: #f6f7fb !important;
}
.navidiv{
	background: #f6f7fb;
	padding: 18px 20px 18px 20px;
	margin-top: 50px;
	clear: both;
}
.page-item.active .page-link {
    z-index: 3;
    color: #fff;
    background-color: #fbab60;
    border-color: #fbab60;
    border-radius: 20px;
}
.page-item a:hover {
	color: #fbab60;
}
.shippingcost{
    font-size: 12px;
    line-height: 18px;
    letter-spacing: -0.4px;
    color: #666;
}
}
</style>
<script>
	$(document).ready(function(){
		console.log($(location).attr('href'));
		console.log($('#${map.lv1}').selected);
	})
</script>
</head>
<body>
<!-- category list -->
<div class="breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<ul class="bread-list">
								<li><a href="${pageContext.request.contextPath}/">홈<i class="ti-arrow-right"></i></a></li>
								<!-- lv1 category -->
								<li><a href="${pageContext.request.contextPath}/list?category=${map.lv1}">${map.lv1}</a></li>
								<!-- lv2 category -->
								<c:if test="${not empty map.lv2}"><li><a href="${pageContext.request.contextPath}/list?category=${map.lv2code}"><i class="ti-arrow-right"></i>${map.lv2}</a></li></c:if>
								<!-- lv3 category -->
								<c:if test="${not empty map.lv3}"><li><a href="${pageContext.request.contextPath}/list?category=${map.category}"><i class="ti-arrow-right"></i>${map.lv3}</a></li></c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
<section class="product-area shop-sidebar shop section pt-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-4 col-12">
						<div class="shop-sidebar">
								<!-- Single Widget -->
								<div class="single-widget category">
									<h3 class="title">카테고리</h3>
									<ul class="categor-list">
										<!-- category -->
											<li><a style="font-weight: bolder" href="${pageContext.request.contextPath}/list?category=${map.lv1}&ps=${map.page.sizePerPage}&sort=${map.sort}">${map.lv1}</a></li>
										<c:if test="${not empty map.lv2}">
											<li><a style="font-weight: bolder" href="${pageContext.request.contextPath}/list?category=${map.lv2code}&ps=${map.page.sizePerPage}&sort=${map.sort}">${map.lv2}</a></li>
										</c:if>
										<c:if test="${not empty map.lv3}">
											<li><a style="font-weight: bolder" href="${pageContext.request.contextPath}/list?category=${map.category}&ps=${map.page.sizePerPage}&sort=${map.sort}">${map.lv3}</a></li>
										</c:if>
										<c:if test="${empty map.lv3}">
										<c:forEach var="category" items="${map.categorymap}">
											<li class="pl-3"><a href="${pageContext.request.contextPath}/list?category=${category.value}&ps=${map.page.sizePerPage}&sort=${map.sort}">${category.key}</a></li>
										</c:forEach>
										</c:if>
									</ul>
								</div>
								<!--/ End Single Widget -->
								<!-- Shop By Price -->
									<!-- <div class="single-widget range">
										<h3 class="title">가격</h3>
										<div class="price-filter">
											<div class="price-filter-inner">
												<div id="slider-range" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all">
													<div class="ui-slider-range ui-widget-header ui-corner-all" style="width: 26%; left: 24%;"></div>
													<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 24%;"></span>
													<span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0" style="left: 50%;"></span>
												</div>
													<div class="price_slider_amount">
													<div class="label-input">
														<span>범위:</span><input type="text" id="amount" name="price" placeholder="Add Your Price">
													</div>
												</div>
											</div>
										</div>
										<ul class="check-box-list">
											<li>
												<label class="checkbox-inline" for="1"><input name="news" id="1" type="checkbox">$20 - $50<span class="count">(3)</span></label>
											</li>
											<li>
												<label class="checkbox-inline" for="2"><input name="news" id="2" type="checkbox">$50 - $100<span class="count">(5)</span></label>
											</li>
											<li>
												<label class="checkbox-inline" for="3"><input name="news" id="3" type="checkbox">$100 - $250<span class="count">(8)</span></label>
											</li>
										</ul>
									</div> -->
									<!--/ End Shop By Price -->
								<!-- Single Widget -->
								<!-- <div class="single-widget recent-post">
									<h3 class="title">최근 본 상품</h3>
									Single Post
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">Girls Dress</a></h5>
											<p class="price">$99.50</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									End Single Post
									Single Post
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">Women Clothings</a></h5>
											<p class="price">$99.50</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									End Single Post
									Single Post
									<div class="single-post first">
										<div class="image">
											<img src="https://via.placeholder.com/75x75" alt="#">
										</div>
										<div class="content">
											<h5><a href="#">Man Tshirt</a></h5>
											<p class="price">$99.50</p>
											<ul class="reviews">
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
												<li class="yellow"><i class="ti-star"></i></li>
											</ul>
										</div>
									</div>
									End Single Post
								</div> -->
								<!--/ End Single Widget -->
								<!-- Single Widget -->
								<div class="single-widget category">
									<h3 class="title">판매자</h3>
									<ul class="categor-list">
									<c:forEach var="sellername" items="${map.sellername}">
											<c:if test="${map.s eq sellername}"><li><a style="font-weight:600;" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${sellername}&ps=${map.page.sizePerPage}&sort=${map.sort}">${sellername}</a></li></c:if>
											<c:if test="${map.s ne sellername}"><li><a href="${pageContext.request.contextPath}/list?category=${map.category}&s=${sellername}&ps=${map.page.sizePerPage}&sort=${map.sort}">${sellername}</a></li></c:if>
									</c:forEach>
									</ul>
								</div>
								<!--/ End Single Widget -->
						</div>
					</div>
					<div class="col-lg-9 col-md-8 col-12">
						<div class="row">
							<div class="col-12">
								<!-- Shop Top -->
								<div class="shop-top">
									<div class="shop-shorter">
										<div class="single-shorter">
											<label>노출 :</label>
											<div class="nice-select" tabindex="0">
											<span class="current">${map.page.sizePerPage}</span>
												<ul class="list">
													<c:forEach var="size" items="${map.pagesize}">
													<a href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&ps=${size}&sort=${map.sort}"><li class="option">${size}</li></a>
													</c:forEach>
												</ul>
											</div>
										</div>
										<div class="single-shorter">
											<label>정렬 :</label>
											<div class="nice-select" tabindex="0">
											<span class="current">${map.sort}</span>
												<ul class="list">
													<c:forEach var="sort" items="${map.sortlist}">
													<a href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&ps=${map.page.sizePerPage}&sort=${sort}"><li class="option">${sort}</li></a>
													</c:forEach>
												</ul>
											</div>
										</div>
									</div>
									<!-- <ul class="view-mode">
										<li class="active"><a href="shop-grid.html"><i class="fa fa-th-large"></i></a></li>
										<li><a href="shop-list.html"><i class="fa fa-th-list"></i></a></li>
									</ul> -->
								</div>
								<!--/ End Shop Top -->
							</div>
						</div>
						<div class="row">
							<c:forEach var="plist" items="${productlist}">
							<div class="col-lg-4 col-md-6 col-12">
								<div class="single-product">
								
									<div class="product-img">
										<a href="${pageContext.request.contextPath}/detailview2?product_code=${plist.product_code}">
											<img class="default-img" src="${pageContext.request.contextPath}/${plist.thumb_img}" alt="${plist.explains}">
											<img class="hover-img" src="${pageContext.request.contextPath}/${plist.thumb_img}" alt="${plist.explains}">
										</a>
										<!-- <div class="button-head">
											<div class="product-action">
												<a data-toggle="modal" data-target="#exampleModal" title="Quick View" href="#"><i class=" ti-eye"></i><span>Quick Shop</span></a>
												<a title="Wishlist" href="#"><i class=" ti-heart "></i><span>Add to Wishlist</span></a>
												<a title="Compare" href="#"><i class="ti-bar-chart-alt"></i><span>Add to Compare</span></a>
											</div>
											<div class="product-action-2">
												<a title="Add to cart" href="#">Add to cart</a>
											</div>
										</div> -->
									</div>
									<div class="product-content">
										<a href="${pageContext.request.contextPath}/detailview2?product_code=${plist.product_code}">${plist.product_name} ${plist.seller_name}</a>
										<div class="product-price">
											<span><fmt:formatNumber pattern="###,###,###" value="${plist.price}"/>원</span>
										</div>
										<span class="shippingcost"><c:if test="${plist.basic_shipping_cost eq 0}">무료배송</c:if>
											   <c:if test="${plist.basic_shipping_cost ne 0}">배송비 <fmt:formatNumber pattern="###,###,###" value="${plist.basic_shipping_cost}"/>원</c:if></span>
									</div>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="row justify-content-center navidiv"><!--  mt-5 justify-content-center -->
							<nav aria-label="Page navigation">
							  <ul class="pagination ">
							    <!-- 이전 블록 -->
						   		    <c:if test="${map.page.prev}"><li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${map.page.startBlock-1}&ps=${map.page.sizePerPage}&sort=${map.sort}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li></c:if>
								    <c:if test="${!map.page.prev}"><li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${map.page.startBlock-1}&ps=${map.page.sizePerPage}&sort=${map.sort}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li></c:if> 
							    <!-- 현재 리스트 -->
							    <c:forEach var="index" begin="${map.page.startBlock}" end="${map.page.endBlock}">
										<c:if test="${map.page.currPage eq index}"><li class="page-item active"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${index}&ps=${map.page.sizePerPage}&sort=${map.sort}">${index}</a></li></c:if>
										<c:if test="${map.page.currPage ne index}"><li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${index}&ps=${map.page.sizePerPage}&sort=${map.sort}">${index}</a></li></c:if>
								</c:forEach>
							    <!-- 다음 블록 -->
							    	<c:if test="${map.page.next}"><li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${map.page.endBlock+1}&ps=${map.page.sizePerPage}&sort=${map.sort}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li></c:if>
								    <c:if test="${!map.page.next}"><li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/list?category=${map.category}&s=${map.s}&curr=${map.pageendBlock+1}&ps=${map.page.sizePerPage}&sort=${map.sort}" aria-label="Previous"><span aria-hidden="true">&raquo;</span></a></li></c:if>
							  </ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</section>
</body>
</html>