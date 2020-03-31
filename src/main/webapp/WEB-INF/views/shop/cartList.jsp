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
		// 테이블 스타일
		$('.table tr:last-child').addClass("lasttr");
		$('.table tr:first-child').addClass("firsttr");	
		
		// init-allcheck
		$(".chBox").prop("checked", true);
		$("#allCheck").prop("checked", true);
	
		// init-totalnum
		 totalnum();
		
		// 전체선택 
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked"); // 체크 여부 확인
			if (chk) {
				$(".chBox").prop("checked", true); // 체크 설정
			} else {
				$(".chBox").prop("checked", false); // 체크 해제
			}
		});
		
		
		// 전체선택 해제
		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false)
		});
		
		
		// 셀러 선택 
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
	
			
		// 셀러 선택 해제 
		$(".itemchBox").click(function(){
			var sellercode=$(this).data('seller_code');
			
			$.each($('.sellerchBox'), function(index,value){
				if(sellercode == $(this).val())
				{
					$(this).prop("checked",false);	
			}  
			});
		});		
			
		// 체크값이 없을 시 결제페이지 못넘어가게
		$(".buyit_btn").click(function() {
			if ($(".chBox:checked").size() <= 0) {
				alert('상품을 선택해주세요')
				return false;
			}
		});
		
		
		// 제품 수량 조절(-), 가격 변경
		$(document).on("click","#minus_btn",function(){
			let id=$(".id").val();
			var num = $(this).parent().next().val();
			var minusNum=num-1;
			var cart_no=$(this).data('cart_no');
			var item_amount=$(this).parent().parent().parent().next().data('item_amount'); //상품+옵션가
			var item_free=$(this).data('item_free'); // 무료배송 조건 30000
			var item_basic=$(this).data('item_basic');// 배송비 2000원
			var item_shipping=$(this).parent().parent().parent().next().next().text(); //배송비 출력
			var amount_price= item_amount*minusNum; //상품가 변경
			
			var data={
					"cart_no" : cart_no
					,"cart_quantity" : minusNum
					, "id" : id
			}
			
			if( minusNum < 1){
				$(this).parent().next().val(num);
			}else{
				$(this).parent().next().val(minusNum);//수량 변경
				$(this).parent().parent().parent().next().text(amount_price+"원"); //주문금액 변경
				$(this).parent().parent().parent().parent().find('.itemchBox').data("item_amount", amount_price); //전체 합계 상품금액 변경
				
				
				//무료배송 조건 변경
				if( item_amount*minusNum < item_free){
					$(this).parent().parent().parent().next().next().text(item_basic+"원");
				}else{
					$(this).parent().parent().parent().next().next().text("무료배송");
				}
				
				$.ajax({
					url : "cartList/changeQuantity"
						, data : data
						, async: false
						, success : function(data){
							console.log(data);	
						}
						, error : function(e){
							console.log(e);
						}
				});
				totalprice();
			}
		});
		 
		
		// 제품 수량 조절(+), 가격 변경
		$(document).on('click',"#plus_btn",function(){
			let id=$(".id").val();
			var num =  Number($(this).parent().prev().val()); //현재 수량값
			var plusNum =num+1; 
			var cart_no=$(this).data('cart_no'); //카트 번호
			var item_amount=$(this).parent().parent().parent().next().data('item_amount'); //상품+옵션가
			var item_free=$(this).data('item_free'); // 무료배송 조건 30000
			var item_basic=$(this).data('item_basic');// 2000
			var item_shipping=$(this).parent().parent().parent().next().next().text(); //배송비
			var amount_price=item_amount*plusNum; //가격 변경
			
			var data={
					"cart_no" : cart_no
					,"cart_quantity" : plusNum
					, "id" : id
			}
			
			if( plusNum <=  $(this).parent().prev().data('max')){
				$(this).parent().prev().val(plusNum); // 수량 변경
				$(this).parent().parent().parent().next().text(amount_price+"원"); //합계 변경
				$(this).parent().parent().parent().parent().find('.itemchBox').data("item_amount", amount_price); //전체 합계 상품금액 변경
				//무료배송 조건 변경
				if( item_amount*plusNum >= item_free){
					$(this).parent().parent().parent().next().next().text("무료배송");
				}else{
					$(this).parent().parent().parent().next().next().text(item_basic+"원");
				}
				
				$.ajax({ // db 값 변경
					url : "cartList/changeQuantity"
						, data : data
						, async: false
						, success : function(data){
							console.log(data);
						}
						, error : function(e){
							console.log(e);
						}
				});
				totalprice();
			}else{ 
				$(this).parent().prev().val(num);
			}
		});
		
		
		// 'X'버튼 제품 삭제
		$(document).on('click','.xdel_btn',function(){
			var sellercode=$(this).data('seller_code');
			var isseller=0;
			
			$(this).parent().parent().remove();
			totalnum();
			
			$.each($('.xdel_btn'),function(){
				if(sellercode == $(this).data('seller_code'))
					{
						isseller=1;
					}
			})
			console.log(isseller);			
			// 셀러샵에 제품이 없을때 다 삭제
				if(isseller==0)
					{
						$.each($(".sellerchBox"),function(){
						if($(this).val() == sellercode)
							{
							$(this).parent().parent().parent().remove();
							}
						totalnum();
					})
					
					}
			
			let id=$(".id").val();
			var cart_no=$(this).data("cart_no");
			var seller_code=$(this).data("seller_code");
				
		 	var data={
					"id" : id
					,"cart_no" : cart_no
					,"seller_code" : seller_code
				}  
		 	
			$.ajax({
				url : "cartList/deleteItem"
				, data : data
				, async: false
				, success : function(data){
					alert("상품을 삭제했습니다.");
				}
				, error : function(e){
					console.log(e)
				}
			});
				// 삭제시 테이블 스타일 유지 
				$('.table tr:last-child').addClass("lasttr");
				$('.table tr:first-child').addClass("firsttr");
		});
		
		
		// 전체 갯수
		function totalnum(){
			var chnum=$("input:checkbox[name=cart_no]:checked").length; //선택된 체크박스 수
			 console.log(chnum);
			 $('#total_num').text(chnum); 
		
			 if(chnum==0){
				 $('#total_price').text(0);
			 }
			 else{
				 totalprice()
			}
		}
		//전체 합계
		function totalprice(){
			var chsum=0;
			console.log("call totalprice");
			 $.each($("input:checkbox[name=cart_no]:checked"), function( key, value ) {
				 var chprice=$(this).data("item_amount"); //선택된 상품 가격
				 chsum += chprice; 
				 $('#total_price').text(chsum);
				});
		}
		
	
		// 총 구매 개수 변동시 사용
		 $(document).on('click','input:checkbox',function(){
			 totalnum();
			 
		}); 
		
		
		
		
		// 전체 합계 금액
		/* var total_price;
		 $("input:checkbox[name=cart_no]").each(function(){
			 if($(this).is(':checked'))
		      total_price += 
			 
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
															<label class="custom-control-label" for="${sellerList.key}" style="font-size: 16px; font-weight:bold;">
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
															id="${cartList.cart_no}" value="${cartList.cart_no}" name="cart_no" 
															data-seller_code="${cartList.seller_code}"
															data-item_amount="${(cartList.price + cartList.add_price) * cartList.cart_quantity}"
															data-item_shpping="${cartList.basic_shipping_cost}">
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
															<button type="button" class="btn btn-primary btn-number" id="minus_btn"
															data-cart_no="${cartList.cart_no}" data-item_free="${cartList.free_shipping_cost}" data-item_basic="${cartList.basic_shipping_cost}">
																<i class="ti-minus"></i>
															</button>
														</div>
														<input type="text" class="input-number" data-min="1"
															data-max="${cartList.inventory}"
															value="${cartList.cart_quantity}">
														<div class="button plus">
															<button type="button" class="btn btn-primary btn-number" id="plus_btn" 
															data-cart_no="${cartList.cart_no}" data-item_free="${cartList.free_shipping_cost}" data-item_basic="${cartList.basic_shipping_cost}">
																<i class="ti-plus"></i>
															</button>
														</div>
													</div> <!--/ End Input Order -->
												</td>
												<!-- 합계(배송비 제외) -->
												<td class="total-amount" data-title="Total" data-item_amount="${(cartList.price + cartList.add_price)}">
												<span class="amount">
												${(cartList.price + cartList.add_price) * cartList.cart_quantity}</span>원</td>
												<!-- 배송비 -->
												<td>
													<c:if test="${(cartList.price + cartList.add_price) * cartList.cart_quantity >= cartList.free_shipping_cost}">
													무료배송										
													</c:if>
													<c:if test="${(cartList.price + cartList.add_price) * cartList.cart_quantity < cartList.free_shipping_cost}">
													${cartList.basic_shipping_cost}원
													</c:if>
												</td>
												<!-- 삭제 아이콘 -->
												<td class="remove p-0">
													<button type="button" class="xdel_btn del_btn btn" id="idel_btn" data-cart_no="${cartList.cart_no}"  data-seller_code="${cartList.seller_code}" >
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
												<li>상품수<span id="total_num"></span></li>
												<li>상품금액<span id="total_price">10000</span></li>
												<li>배송비<span id="total_shipping">0</span></li>
												<li class="last">전체 주문금액<span id="final_price">10000</span></li>
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