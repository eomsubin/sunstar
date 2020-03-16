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
<style>
ul li{
display: inline-block
}
</style>
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
	
	$("select").change(function(){
		var option = $("#selectoption option:selected").val()
		alert(option);
		$(".cresult").append("<p>"+option);
		
		
	});
	
	
	
	$(".cart_btn").click(function(){
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

<div class="nav loc bg-light" style="border: 1px solid #dadada; border-top: 2px solid black; ">
     <ul class="top_link_nav" style="margin-left: 16%" >
      <li class="nav-item">
        <a class="nav-link active" href="#">홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">${view.lv1}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv2}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv3}</a>
        </li>
        </ul>
   </div>
	
	<br><br>
	


	<div class="wrapper">

		<section>
			<form role="form" method="post">
				<input type="hidden" name="product_code" value="${view.product_code}" >
				
				<sec:authorize access="isAuthenticated()">
				<input type="hidden" name="id" class="id" 
				value='<sec:authentication property="principal.UserInfo.id"/>' >
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
										src="${view.thumb_img}"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="http://image.auction.co.kr/itemimage/1b/34/bc/1b34bc2756.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="http://image.auction.co.kr/itemimage/1b/73/14/1b7314f606.jpg"
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
								<div class="p-2 bd-highlight">${view.seller_code}</div>
								<div class="ml-auto p-2 bd-highlight">${view.product_code}</div>
							</div>
						</div>

						<!-- 상품명 -->
						<h1 class="itemtit">
							<span class="text__item-title">${view.product_name}</span>
						</h1>

						<!-- 금액&amp;공유영역 -->
						<div class="price_wrap d-flex">
							<!-- 금액 -->
							<div class="price mr-auto">
								<h2 class="price_real">
								<fmt:formatNumber pattern="###,###,###" value="${view.price}" />
								</h2>
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
								<li class="delivery_item" id="delevery_li" style="width: 100%">
									<button id="delivery_btn" class="btn btn-light btn-block"
										style="text-align: left">
										배송비 &#45; <fmt:formatNumber pattern="###,###,###" value="${view.shipping_cost}"/>원
									</button>
									<div class="delivery_view row">
										<ul style="list-style: none">
											<li><span>조건부 무료  &#58;  </span>200,000원 이상</li>
											<br>
											<li><span>추가 배송비  &#58;  </span>제주도 3,000원</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
								
						
						
	
						
						<!-- 상품 옵션 -->
						<fieldset>
							<legend>옵션선택</legend>
							<!-- 선택옵션전체 -->
							
							<select class="custom-select" id="selectoption">
								<option selected>선택하세요</option>
								<c:forEach items="${view.options}" var="option" varStatus="status">
									<!--선택n)옵션1/옵션2-재고:n개 (+#,###원) -->
									
									<option value="${option}">
									선택${status.index+1}&#41;&#32; ${option.option1} &#47; ${option.option2}&#32;&#45;&#32; 
									재고 &#32;${option.inventory}개 &#40;&#43;
									<fmt:formatNumber pattern="###,###,###" value="${option.add_price}"/>원&#41;
								</c:forEach>
							</select>
							<div class="cresult">
							
							</div>

<%-- 							<!-- 옵션 선택 완료 -->
							<div class="chooselist">
								<ul class="add_items">
									<li class="add_item">
										<p class="area_item">
											<span class="item_options">${view.option1} <br> ${view.option2} <br>
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
							</div> --%>

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
	<div class="nav detail_info_tab bg-light">
     <ul class="info_nav" style="margin-left: 16%" >
  <li class="nav-item">
    <a class="nav-link" href="#">상세정보</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">상품평</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">상품문의</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#">판매자정보</a>
  </li>
</ul>
</div>
</body>
</html>


