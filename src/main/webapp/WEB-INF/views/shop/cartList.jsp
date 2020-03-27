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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>
<script>
	$(document).ready(function() {
		
			$('.table tr:last-child').addClass("lasttr");
			$('.table tr:first-child').addClass("firsttr");	
	
			
		/*전체선택*/
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked"); // 체크 여부 확인
			if (chk) {
				$(".chBox").prop("checked", true); // 체크 설정
			} else {
				$(".chBox").prop("checked", false); // 체크 해제
			}
		});
		
		/*전체선택 해제*/
		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false)

		});
		
		/* 셀러 선택 */
		$(".sellerchBox").click(function(){ // 모든 sellerBox
			var sellchk = $(this).val();
			var chk = $(this).prop("checked");
			
			if(chk == false){
				$.each($(".chBox"), function(index,value){
					if(sellchk == $(this).data('seller_code')){
						$(this).prop("checked",false)
					}
				});
			}else{
			$.each($(".itemchBox"), function(index,value){
				if(sellchk == $(this).data('seller_code')){
					$(this).prop("checked",true)
					
					}
				})
			};
			
			})
	
		/* 셀러 선택 해제 */
		$(".itemchBox").click(function(){
			var sellercode=$(this).data('seller_code');
			
			$.each($('.sellerchBox'), function(index,value){
				if(sellercode == $(this).val())
				{
					$(this).prop("checked",false);	
			}  
			});
		});		
	
			

		// 체크값이 없을 시 못넘어가게
		$(".buyit_btn").click(function() {
			if ($(".chBox:checked").size() <= 0) {
				alert('상품을 선택해주세요')
				return false;
			}
		});
		
		
		/*제품 수량 조절(-)*/
		$(document).on("click","#minus_btn",function(){
			var num = $(this).parent().next().val();
			var minusNum=num-1;
			if( minusNum < 1){
				$(this).parent().next().val(num);
			}else{
				$(this).parent().next().val(minusNum);
			}
		});
		 
		$(document).on('click',"#plus_btn",function(){
			var num =  Number($(this).parent().prev().val());
			var plusNum =num+1;
			if( plusNum <=  $(this).parent().prev().data('max')){
				$(this).parent().prev().val(plusNum);
			}else{
				$(this).parent().prev().val(num);
			}
			
			
		});
		
		
		
		/*x버튼 제품 삭제*/
		$(document).on('click','.xdel_btn',function(){
			var sellercode=$(this).data('seller_code');
			var isseller=0;
			
			
			$(this).parent().parent().remove();
			
			$.each($('.xdel_btn'),function(){
				
				if(sellercode == $(this).data('seller_code'))
					{
						isseller=1;
					}
			})
			console.log(isseller);
				if(isseller==0)
					{
						$.each($(".sellerchBox"),function(){
						if($(this).val() == sellercode)
							{
							$(this).parent().parent().parent().remove();
							
							}
					})							
					}
			
				
				$('.table tr:last-child').addClass("lasttr");
				$('.table tr:first-child').addClass("firsttr");
		});
			
			

			
/* 			let id=$(".id").val();
			var cart_no=$("input[name=cart_no]:checked").val();
			var seller_code=$("input[name=cart_no]:checked").data("seller_code");
			
		 	var data={
				"id" : id
				,"cart_no" : cart_no
				,"seller_code" : seller_code
			}  
	 	
 			$.each(data,function(index,value){
				$.ajax({
					url : "cartList/delete"
					, data : data
					, success : function(data){
						alert("상품을 삭제했습니다.");
					}
					, error : function(e){
						console.log(e)
					}
				})
			}); 
		}); */
			
		});
</script>
<!-- Eshop StyleSheet -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/cart_css/cart.css">


</head>

<body class="js">
	<form role="form" method="post">
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="id" class="id"
				value='<sec:authentication property="principal.UserInfo.id"/>'>
		</sec:authorize>
	</form>

	<form method="post"
		action="${pageContext.request.contextPath }/checkout">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<div id="content" class="mx-auto">

			<!-- Shopping Cart -->

			<div class="shopping-cart section">

				<div class="container">
					<div>
						<h1 class="chartheader my-5">장바구니</h1>
					</div>

					<div class="row">
						<div class="col-12">
							<div class="select row mr-1 pb-2 justify-content-between">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="allchBox custom-control-input"
										id="allCheck" value='<sec:authentication property="principal.UserInfo.id"/>'> 
										<label class="custom-control-label ml-4" for="allCheck" >전체 선택</label>
								</div>
<hr class='my-3'>
								<div class="delBtn">
									<button type="button" class="del_btn btn" id="selectdel_btn">
									선택 삭제</button>
								</div>
							</div>

							<!-- 주문 리스트 -->
							<table class="table shopping-summery">
								<tbody>
									<c:set var="sum" value="0" />
									<!-- 셀러, 체크박스 -->
									<c:forEach var="sellerList" items="${sellerList}" >
										<tr class="seller">
												<td colspan="7" class="sellerinfo px-2 pt-3 bg-">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="sellerchBox chBox custom-control-input"
															id="${sellerList.key}" value="${sellerList.key}" name="seller_code"> 
															<label class="custom-control-label" for="${sellerList.key}">
															${sellerList.value}</label>
													</div>
													<hr class='my-1'>
												</td>
												
											</tr>
									<c:forEach var="cartList" items="${cartList}">
									<!-- 같은 셀러 묶기 -->
									<c:if test="${sellerList.key eq cartList.seller_code}">
											<!-- 제품 리스트 -->
											<tr class="item2 mb-1">
												<td class="image px-3" data-title="No">
													<div class="custom-control custom-checkbox">
														<input type="checkbox" class="chBox itemchBox custom-control-input"
															id="${cartList.cart_no}" value="${cartList.cart_no}" name="cart_no" data-seller_code="${cartList.seller_code}">
														<label class="custom-control-label" for="${cartList.cart_no}">
															<a
															href="${pageContext.request.contextPath}/detailview2?product_code=${cartList.product_code}">
																<img src="${cartList.thumb_img}" class="thumimg" />
														</a>
														</label>
													</div>

												</td>
												<td class="product-des" data-title="Description">
													<!-- 상품명 -->
													<p class="product_code">
														<a href="${pageContext.request.contextPath}/detailview2?product_code=${cartList.product_code}">${cartList.product_name}</a>
													</p> <!-- 옵션 -->
													<p class="product_option">${cartList.option1}&#45;${cartList.option2}&#40;&#43;${cartList.add_price}원&#41;</p>
												</td>
												<!-- 금액 -->
												<td class="price" data-title="Price">
												<fmt:formatNumber pattern="###,###,###" value="${(cartList.price + cartList.add_price)}" />원</td>
												<!-- 수량 -->
												<td class="qty" data-title="Qty">
													<!-- Input Order -->
													<div class="input-group">
														<div class="button minus">
															<button type="button" class="btn btn-primary btn-number"
																id="minus_btn">
																<i class="ti-minus"></i>
															</button>
														</div>
														<input type="text" class="input-number" data-min="1"
															data-max="${cartList.inventory}"
															value="${cartList.cart_quantity}">
														<div class="button plus">
															<button type="button" class="btn btn-primary btn-number"
																id="plus_btn">
																<i class="ti-plus"></i>
															</button>
														</div>
													</div> <!--/ End Input Order -->
												</td>
												<!-- 총합계(배송비 제외) -->
												<td class="total-amount" data-title="Total"><fmt:formatNumber
														pattern="###,###,###"
														value="${(cartList.price + cartList.add_price) * cartList.cart_quantity}" />원</td>
												<!-- 배송비 -->
												<td>
													<c:if test="${cartList.basic_shipping_cost eq 0}">
													무료배송										
													</c:if>
													<c:if test="${cartList.basic_shipping_cost ne 0}">
													<fmt:formatNumber pattern="###,###,###"
															value="${cartList.basic_shipping_cost}" />원
													</c:if>
												</td>
												<!-- 삭제 아이콘 -->
												<td class="remove p-0">
													<button type="button" class="xdel_btn del_btn btn" id="idel_btn" data-seller_code="${cartList.seller_code}" >
														<img
															src='${pageContext.request.contextPath}/resources/icons/close4.png'/>
													</button>
												</td>
											</tr>
											</c:if>
									</c:forEach>
										
									</c:forEach>
								</tbody>
							</table>
							<!--/ End Shopping Summery -->
						</div>
					</div>

					<!-- <hr style="margin-top: 0; margin-bottom: 10px; border:2px solid #fbab60" noshade="noshade"> -->
					
					<!-- 전체 합계 -->
					<div class="row">
						<div class="col-12">
							<!-- Total Amount -->
							<div class="total-amount">
								<div class="row">
									<div class="col-lg-2 left">
										<h2>전체 합계</h2>
									</div>
									<div class="col-lg-10">
										<div class="right">
											<ul>
												<li>상품수<span>1</span></li>
												<li>상품금액<span>10000</span></li>
												<li>배송비<span>0</span></li>
												<li class="last">전체 주문금액<span>10000</span></li>
											</ul>
										</div>
									</div>
									<div class="col-lg-12 mt-4 text-center">
										<button class="buyit_btn" type="submit">주문하기</button>
									</div>
								</div>
							</div>
							<!--/ End Total Amount -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--/ End Shopping Cart -->




</body>
</html>