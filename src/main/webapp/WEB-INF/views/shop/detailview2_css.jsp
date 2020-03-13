<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<script>
$(document).ready(function(){
	$(".plus").click(function(){
		var num = $(".numBox").val();
		var plusNum = Number(num)+1;
		
		if( plusNum > ${view.inventory}){
			$(".numBox").val(num);
		}else{
			$(".numBox").val(plusNum);
		}
		});
	
	$(".minus").click(function(){
		var num = $(".numBox").val();
		var minusNum = Number(num)-1;
		
		if( minusNum < 1){
			$(".numBox").val(num);
		}else{
			$(".numBox").val(minusNum);
		}
		});
	
	$(".addCart").click(function(){
		var product_code = ${view.product_code};
		var cart_quantity = $(".numBox").val();
		console.log(product_code);
		
		let id = $('.id').val();
		console.log(id);
		if(id==null){
			alert("로그인 하십시오.");
		}
		
		var data = {
				"id" : id
				,"product_code" : product_code
				,"cart_quantity" : cart_quantity
		};
		console.log(data);
			
			
	 	$.ajax({
			url : "detailview/addCart"
			, data : data
			, dataType : "json"
			, success : function(data){
					console.log(data);
				 	if(data>0){
				 		alert("장바구니에 상품을 담았습니다.");
				 	}else{
				 		alert("장바구니에 상품을 담기 실패.");
				 	}
			}
			, error : function(e){
				alert("장바구니에 담을 수 없습니다.")
				console.log(e);
			}
		})
	});
	
});

</script>

<title>SBBJ</title>
</head>
<body>
	<div class="wrapper">

		<section>
			<form role="form" method="post">
				<input type="hidden" name="product_code"
					value="${view.product_code}">

				<sec:authorize access="isAuthenticated()">
					<input type="hidden" name="id" class="id"
						value='<sec:authentication property="principal.UserInfo.id"/>'>
				</sec:authorize>
			</form>



			<div class="container p-0">
				<!-- 상단 -->
				<div class="row item-topinfowrap">

					<!-- 좌측 상품상세정보 -->
					<div class="col thumb-gallery">
						<div id="viewerwrap" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" style="width: 600px; height: 600px;">
								<div class="carousel-item active">
									<img
										src="http://image.auction.co.kr/itemimage/1b/c7/b0/1bc7b054d6.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="http://image.auction.co.kr/itemimage/1b/34/bc/1b34bc2756.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img src="http://image.auction.co.kr/itemimage/1b/73/14/1b7314f606.jpg"
										class="d-block w-100" alt="...">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<!-- 우측 상품관련정보 -->
					<div class="col item-topinfo">
						<!-- shop info, 상품코드 -->
						<div class="prod_info">
							<div class="d-flex bd-highlight my-3"
								style="border-bottom: 1px solid #dadada">
								<div class="p-2 bd-highlight">seller</div>
								<div class="ml-auto p-2 bd-highlight">123123</div>
							</div>
						</div>

						<!-- 상품명 -->
						<h1 class="itemtit">
							<span class="text__item-title">3D 입체 사진 1+1+1 / 3장</span>
						</h1>

						<!-- 금액&amp;공유영역 -->
						<div class="price_wrap d-flex">
							<!-- 금액 -->
							<div class="price mr-auto">
								<strong class="price_real">10,000,000<span class="unit">원</span></strong>
							</div>
							<!-- 공유 -->
							<div class="sns_area">
								<button type="button"
									class="share_btn btn btn-outline-primary btn-sm">
									<span>SNS 공유</span>
								</button>
							</div>
						</div>

						<!-- 배송 -->
						<div class="delivery_info bg-light">
							<ul style="list-style: none; padding: 0">
								<li class="delivery_item" id="delevery_li">
									<button id="delivery_btn" class="btn btn-light btn-block"
										style="text-align: left">
										배송비 - <em>주문시 결제</em>
									</button>
									<div class="delivery_view">
										<ul style="list-style: none">
											<li><span>조건부무료</span><span> 20,000 이상 무료</span></li>
											<li><span>추가배송비</span><span> 제주도 3,000원</span></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>

						<!-- 상품 옵션 -->
						<fieldset>
							<legend>옵션선택 폼</legend>
							<!-- 선택옵션전체 -->
							<div class="select-item">
								<!-- 선택옵션 -->
								<div class="select_option_form">
									<!-- 주문옵션 상품-->
									<div class="select_option_wrap"></div>
								</div>
							</div>


							<!-- 옵션 선택 완료 -->
							<div class="chooselist">
								<ul class="add_items">
									<li class="add_item">
										<p class="area_item">
											<span class="item_options">옵션1 <br> 옵션2 <br>
												추가금
											</span>
										</p> <!--수량 조절-->
										<p class="Stock_ctrl">
											<span> 구입수량 </span>
											<button type="button" class="minus">-</button>
											<input type="number" class="numBox" min="1"
												max="${view.inventory}" value="1" />
											<button type="button" class="plus">+</button>
										</p>
									</li>
								</ul>
							</div>

							<!--구매,장바구니 버튼-->
							<div class="ordercart_btn">
								<button class="cart_btn btn btn btn-outline-dark btn-lg"
									type="button" style="width: 45%">장바구니</button>
								<button class="buy_btn btn btn-danger btn-lg" type="button"
									style="width: 45%">구매하기</button>
							</div>
						</fieldset>

					</div>

				</div>
			</div>
		</section>
	</div>
</body>
</html>


