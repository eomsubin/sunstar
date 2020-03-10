<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--  Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap"
	rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<!-- Themify Icons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		var cart_quantity = $(".numBox");
		console.log(product_code);
		
		var data = {
				product_code : product_code
			,   cart_quantity : cart_quantity
		};
		
		$.ajax({
			url : "/shop/view/addCart"
			, type : "post"
			, data : data
			, success : function(result){
					alert("장바구니에 상품을 담았습니다.");
					$(".numBox").val("1");				
			}
			, error : function(){
				alert("장바구니에 담을 수 없습니다.")		
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
			<form role="form"="post">
				<input type="hidden" name="product_code" value="product_code" >
			</form>

			<div class="goods">
				<div class="thumb_img">
					<img src="${view.thumb_img}">
				</div>

				<div class="goodinfo">

					<p class="level">
						<span>카테고리</span>${view.lv1} > ${view.lv2} > ${view.lv3}
					</p>

					<p class="seller_code">
						<span> 판매자코드 </span>${view.seller_code}</p>

					<p class="product_name">
						<span> 상품명 </span>${view.product_name}</p>

					<p class="price">
						<span> 판매가 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.price}" />
						원
					</p>

					<p class="color">
						<span> 색상 </span>${view.color}</p>

					<p class="size">
						<span> 사이즈 </span>${view.size}</p>

					<p class="inventory">
						<span>재고</span>
						<fmt:formatNumber pattern="###,###,###" value="${view.inventory}" />
						EA
					</p>

					<p class="add_price">
						<span> 추가금액 </span>
						<fmt:formatNumber pattern="###,###,###" value="${view.add_price}" />
						원
					</p>

					<p class="cartStock">
						<span> 구입수량 </span>
						<button type="button" class="minus">-</button>
						<input type="number" class="numBox" min="1"
							max="${view.inventory}" value="1" />
						<button type="button" class="plus">+</button>
					</p>

					<p class="addToCart">
						<button type="button" class="addToCart"> 장바구니 담기 </button>
					</p>
					
					<p class="buyItNow">
						<button type="button"> 구매하기 </button>
					</p>
				</div>
			</div>
		</section>
	</div>


	<!-- Popper.js first, then Bootstrap JS -->

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>


