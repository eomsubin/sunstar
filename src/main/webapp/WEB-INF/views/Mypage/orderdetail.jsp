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

 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css"> 
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
					    <li style="display: none">${orderinfo.order_no }</li>
						<tr>
							<th scope="row"></th>
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
							<td>${orderinfo.price+orderinfo.add_price}원/ ${orderinfo.shipping_cost }원</td>
							<td></td>
						</tr>
							<tr>
							<th scope="row"></th>
							<td>배송상태</td>
							<td>${orderinfo.delivery_state }</td>
							<td><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" >결제취소</button></td>
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




</body>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 100;">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
		
</html>