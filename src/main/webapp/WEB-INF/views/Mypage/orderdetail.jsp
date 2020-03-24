<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
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

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css"> --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
	
</head>
<body>
	<!-- Product Style -->
	<section class="product-area shop-sidebar shop section">

		<div class="user-title">
			<h3> 주문/배송 상세정보</h3>(주문번호:${one.order_code})
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
								<li><a href="#">회원정보 변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a href="#">판매 회원전환</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
						
					</div>
				</div>
				<!-- side bar -->
					<table class="table" >
  <thead class="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry</td>
      <td>the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
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
</html>