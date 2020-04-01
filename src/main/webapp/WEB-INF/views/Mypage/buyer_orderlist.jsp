<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script>
$(document).ready(function(){
	
	genRowspan("td.ocode");

	 function genRowspan(){
		$("td.ocode").each(function(){
			var rows= $("td.ocode:contains('"+$(this).text()+"')");
			if(rows.length>1){
				
				rows.eq(0).attr("rowspan",rows.length);
				rows.not(":eq(0)").remove();
			}
		});
	}
});

function orderDetail(order_code){
	location.href="${pageContext.request.contextPath}/mypage/orderdetail/"+order_code;
}


function godetailreview(order_no){
	var pop = window.open("${pageContext.request.contextPath}/customerdetailreview?order_no="+order_no, "pop","width=560,height=380, scrollbars=yes, resizable=yes");
}

function goinsertreview(order_no){
	console.log(order_no)
    var pop = window.open("${pageContext.request.contextPath}/insertreviewform?order_no="+order_no, "pop","width=560,height=530, scrollbars=yes, resizable=yes");  
};
function jusoCallBack(review_content, order_no, review_star){
	console.log(review_content);
	console.log(order_no);
	console.log(review_star);
	location.href="${pageContext.request.contextPath}/insertreview?review_content="+review_content+"&order_no="+order_no+"&review_star="+review_star;
}
</script>
</head>
<body>
	<section class="product-area shop-sidebar shop section">

		<div class="user-title" style="left:100px !important; ">
			<h3>주문/배송내역</h3>
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
								<li><a href="${pageContext.request.contextPath }/mypage/info">회원정보 변경</a></li>
								<li><a href="#">회원탈퇴</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/seller_register">판매 회원전환</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				<table class="table" style="position: relative;  width:850px; top:30px;">
					<thead>
						<tr>
							<th scope="col" style="width:80px; text-align: center;">주문번호</th>
							<th scope="col" style="width:60px; text-align: center;">상품정보</th>
							<th scope="col" style="text-align: center; width:190px;">상품명</th>
							<th scope="col" style="text-align: center;">상품금액(수량)</th>
							<th scope="col">배송비</th>
							<th scope="col" style="width:80px; text-align: center;">주문상태</th>
							<th scope="col">상품평</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="pay" items="${buylist }" >
						<tr class="ordertable">
							<td class="ocode" style="width:180px; vertical-align: middle; text-align: center;">${pay.order_code }
								
								<button type="button" style="padding: 3px 10px;"  onclick="orderDetail(${pay.order_code})">상세정보</button>
								
							</td>
							
							<td ><img src="${pageContext.request.contextPath }/${pay.thumb_img }"></td>
							<td style="vertical-align: middle; text-align: center;"><a href="${pageContext.request.contextPath}/detailview2?product_code=${pay.product_code}">${pay.product_name }</a></td>
							<td style="vertical-align: middle; text-align: center;">${(pay.price+pay.add_price)*pay.quantity}원  (${pay.quantity })</td>
							<td style="vertical-align: middle;">${pay.basic_shipping_cost}원</td>
							<td style="vertical-align: middle;">${pay.delivery_state}</td>
							<td style="vertical-align: middle;"><c:if test="${empty pay.review_no and pay.delivery_state eq '결제완료'}"><button type="button" style="padding :3px 10px; background-color: #fbab60;" onclick="goinsertreview(${pay.order_no});">상품평 작성</button></c:if><c:if test="${not empty pay.review_no}"><button type="button" style="padding :3px 10px;" onclick="godetailreview(${pay.order_no});">상품평 보기</button></c:if></td>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
				
			</div>
			
				<nav aria-label="Page navigation example" style="position: relative; left:650px; top:50px;">
  <ul class="pagination">
  	<c:if test="${page.prev}">
    <li class="page-item"><a class="page-link" href="order?currPage=${page.startBlock-1}&psize=${page.sizePerPage}">이전</a></li>
    </c:if>
    
    	<c:forEach var="i" begin="${page.startBlock}"
						end="${page.endBlock}">
    		
    		<c:if test="${i == page.currPage}">
									
    		<li class="page-item"><a class="page-link" href="#">${i}</a></li>
    		</c:if>
    		<c:if test="${i != page.currPage }">
    		<li class="page-item"><a class="page-link" href="order?currPage=${i}&psize=${page.sizePerPage}">${i}</a></li>
    			</c:if>
    
    	</c:forEach>
   	 <c:if test="${page.next}">
   		 <li class="page-item"><a class="page-link" href="order?currPage=${page.endBlock+1}&psize=${page.sizePerPage}">다음</a></li>
   	  </c:if>
  </ul>
  
</nav>

		</div>
		



	</section>


</body>
</html>