<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
				<input type="hidden" name="product_code" value="${view.product_code}" >
				
				<sec:authorize access="isAuthenticated()">
				<input type="hidden" name="id" class="id" value='<sec:authentication property="principal.UserInfo.id"/>' >
				</sec:authorize>
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

					<p class="option1">
						<span> 옵션1 </span>${view.option1}</p>
						
					<p class="option2">
						<span> 옵션2 </span>${view.option2}</p>

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
						<button type="button" class="addCart"> 장바구니 담기 </button>
					</p>
					
					<p class="buyItNow">
						<button type="button"> 구매하기 </button>
					</p>
				</div>
			</div>
		</section>
	</div>
</body>
</html>


