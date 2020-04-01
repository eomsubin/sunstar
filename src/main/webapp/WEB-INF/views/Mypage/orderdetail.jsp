<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="stylesheet"
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
 --%>
<!-- Eshop StyleSheet -->

 <%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
<style>
	#tb{
		position: relative;
		width: 70%;
		left:60px;
		
		

		
	}
	
	#tb1{
	
	position: relative;
		width: 70%;
		left:350px;
		
		border: 0;
	}
	
.tbody1{
		border:0;
	
}




</style>
<script>
	$(document).ready(function(){
		var order_no="";
		var abc="";
		var refund_price="";
		$('.cancel').on('click',function(){
			
			order_no=$(this).parent().parent().parent().children().find('span').eq(0).text();
			abc= $(this).parent().parent().parent().children().find('td').eq(13).text();
			refund_price=abc.substr(0,4);
			
			console.log(order_no);
			console.log(refund_price);
		});
		
		$('#refund').on('click',function(){
			
			let bank=$('#bank').val();
			let account = $('#account').val();
			let refundmsg = $('#refundmsg').val();
			
			
			location.href="${pageContext.request.contextPath}/refund/"+order_no+"/"+bank+"/"+account+"/"+refundmsg+"/"+refund_price;
			
		});
		
	});



</script>
</head>
<body>
	<!-- Product Style -->
	<section class="product-area shop-sidebar shop section">

		<div class="user-title">
			<h3>주문/배송 상세정보</h3>
			(주문번호:${one.order_code})
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
								<li><a
									href="${pageContext.request.contextPath }/mypage/info">회원정보
										변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a
									href="${pageContext.request.contextPath }/mypage/seller_register">판매
										회원전환</a></li>
								<li><a
									href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a
									href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->

					</div>
				</div>
				<c:set var="allprice" value="0" />
				<c:set var="costpersellers" value="0"/>
				<c:forEach var="detail" items="${ orderdetail}">
					<c:set var="allprice" value="${allprice+(detail.price+detail.add_price)*detail.quantity}"/>
				</c:forEach>
				<c:forEach var="price" items="${price }">
					<c:set var="costpersellers" value="${costpersellers+price.shipping_cost_per_seller}" />
				</c:forEach>
				
				<c:set var="allprice" value="${allprice+costpersellers}"/>
				<!-- side bar -->
				
				<!-- 결제정보 -->
				<table class="table" id="tb">
					<thead class="thead-dark">
						<tr>
							<th scope="col"></th>
							<th scope="col">결제정보</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody class="tbody1">
						<tr>
							<th scope="row"></th>
							<td>결제수단</td>
							<td>${one.order_way }</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>배송지 주소</td>
							<td>${one.shipping_addr1 } ${one.shipping_addr2 } ${one.shipping_addr3 }</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>총 결제 금액(배송비 포함)</td>
							<td>${allprice} 원</td>
							<td></td>
						</tr>
						
					</tbody>
				</table>
				
				<!-- 상품 정보 -->
				
				<table class="table" id="tb1">
					<c:forEach var="orderinfo" items="${orderdetail }">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">상품정보</th>
							<th scope="col"></th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody class="tbody1">
					    
						<tr>
							<th scope="row"><span class="orderno" style="display: none;" >${orderinfo.order_no }</span></th>
							<td>상품명</td>
							<td>${orderinfo.product_name }</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>업체명</td>
							<td>${orderinfo.seller_name}</td>
							<td></td>
						</tr>
						<tr>
							<th scope="row"></th>
							<td>수량</td>
							<td>${orderinfo.quantity } 개</td>
							<td></td>
						</tr>
							<tr>
							<th scope="row"></th>
							<td>옵션</td>
							<td>${orderinfo.option1 } / ${orderinfo.option2 }</td>
							<td></td>
						</tr>
							<tr>
							<th scope="row"></th>
							<td>상품금액/배송비</td>
							<td>${orderinfo.price+orderinfo.add_price}원/ ${orderinfo.basic_shipping_cost }원</td>
							<td></td>
						</tr>
							<tr>
							<th scope="row"></th>
							<td>배송상태</td>
							<td>${orderinfo.delivery_state }</td>
							<td><c:if test="${orderinfo.delivery_state=='결제완료'}"><button type="button" class="btn btn-danger cancel" data-toggle="modal" data-target="#exampleModal"  >결제취소</button></c:if></td>
						</tr>
						
					</tbody>
					</c:forEach>
				</table>
				
				
			</div>
		</div>

	</section>

	<%-- ${one.order_code}
	${one.order_way}
	${one.shipping_addr1 }
	${one.shipping_addr2 }
	${one.shipping_addr3 }
	
	 <c:forEach var="detail" items="${orderdetail }">
		${detail.quantity}
		${detail.product_name }
		${detail.delivery_state }
		${detail.price }
		${detail.add_price }
		${detail.quantity }
		${detail.shipping_cost }
		${detail.option1 }
		${detail.option2 }
     </c:forEach> --%>

<!-- Modal -->

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
     
      <div class="modal-body" style="margin-top: 100px;" >
         	
        	<label>은행명</label><select class="form-control"  id="bank" name="bank"
                        required>
                        
                        <option value="카카오뱅크">카카오뱅크</option>
                        <option value="국민은행">국민은행</option>
                        <option value="기업은행">기업은행</option>
                        <option value="농협은행">농협은행</option>
                        <option value="신한은행">신한은행</option>
                        <option value="산업은행">산업은행</option>
                        <option value="우리은행">우리은행</option>
                        <option value="한국씨티은행">한국씨티은행</option>
                        <option value="하나은행">하나은행</option>
                        <option value="SC제일은행">SC제일은행</option>
                        <option value="경남은행">경남은행</option>
                        <option value="광주은행">광주은행</option>
                        <option value="대구은행">대구은행</option>
                        <option value="도이치은행">도이치은행</option>
                        <option value="뱅크오브아메리카">뱅크오브아메리카</option>
                        <option value="부산은행">부산은행</option>
                        <option value="산림조합중앙회">산림조합중앙회</option>
                        <option value="저축은행">저축은행</option>
                        <option value="새마을금고중앙회">새마을금고중앙회</option>
                        <option value="수협은행">수협은행</option>
                        <option value="신협중앙회">신협중앙회</option>
                        <option value="우체국">우체국</option>
                        <option value="전북은행">전북은행</option>
                        <option value="제주은행">제주은행</option>
                        <option value="중국건설은행">중국건설은행</option>
                        <option value="중국공상은행">중국공상은행</option>
                        <option value="BNP파리바은행">BNP파리바은행</option>
                        <option value="HSBC은행">HSBC은행</option>
                        <option value="JP모간체이스은행">JP모간체이스은행</option>
                        <option value="케이뱅크">케이뱅크</option>
                     </select>
        	<label>환불계좌입력</label><input type="text" id="account" class="form-control" required="required">
        	<label>환불사유</label><textarea rows="3" cols="1" id="refundmsg"  required="required"></textarea>
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-secondary"  data-dismiss="modal">취소</button>
        
        <button type="button" class="btn btn-primary" id="refund">요청</button>
      </div>
     
    </div>
  </div>
</div>

</body>

		
</html>