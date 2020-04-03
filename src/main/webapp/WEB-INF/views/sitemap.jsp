<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>

<!-- Web Font -->


<!-- StyleSheet -->

<!-- Bootstrap -->
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css"> -->
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.min.css">

<!-- Fancybox -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">

<!-- Nice Select CSS -->
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/niceselect.css">
 --%>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/body.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<style>
.all_container{
	width: 1140px;
	margin: 0 auto;
	padding:20px;
	
}


.all_container h2{
	padding:20px;
	text-align: center;
}
.list-group{
	display: inline-block;
	width: 33%;
	padding:1%;
}
</style>
</head>
<body>

<div class="all_container" >

<h2> 스삐제 사이트맵 </h2>
							<div class="dropdown-divider"></div>

<div class="list-group align-top">
  <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-success ">
    	<b>회원</b>
  </a>
  <a href="${pageContext.request.contextPath}/userlogin" class="list-group-item list-group-item-action">로그인</a>
  <a href="${pageContext.request.contextPath}/RegistrationBuyer" class="list-group-item list-group-item-action">회원가입</a>
  <a href="${pageContext.request.contextPath}/userlogin/FindID" class="list-group-item list-group-item-action">아이디 찾기</a>
  <a href="${pageContext.request.contextPath}/userlogin/FindPW" class="list-group-item list-group-item-action">비밀번호 찾기</a>
  <a href="${pageContext.request.contextPath}/mypage/info" class="list-group-item list-group-item-action">회원 정보 변경</a>
  <a href="${pageContext.request.contextPath}/mypage/shipaddr" class="list-group-item list-group-item-action">배송지 관리</a>
  <a href="${pageContext.request.contextPath}/mypage/userdrop" class="list-group-item list-group-item-action">회원 탈퇴</a>
  <a href="${pageContext.request.contextPath}/mypage/seller_register" class="list-group-item list-group-item-action">판매 회원으로 전환</a>
  <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action">판매회원 탈퇴(구매회원으로 전환)</a>
</div>

<div class="list-group align-top">
  <a href="${pageContext.request.contextPath}/mypage/info" class="list-group-item list-group-item-success "><b>마이페이지</b></a>
  <a href="${pageContext.request.contextPath}/mypage/info" class="list-group-item list-group-item-action">회원정보 변경</a>
  <a href="${pageContext.request.contextPath}/mypage/order" class="list-group-item list-group-item-action">주문/배송 내역</a>
  <a href="${pageContext.request.contextPath}/mypage/order" class="list-group-item list-group-item-action">취소/반품/교환 신청</a>
  <a href="${pageContext.request.contextPath}/mypage/shipaddr" class="list-group-item list-group-item-action">배송지 관리</a>
  <a href="${pageContext.request.contextPath}/mypage/userdrop" class="list-group-item list-group-item-action">회원 탈퇴</a>
</div>




<div class="list-group align-top">
  <a href="${pageContext.request.contextPath}/CS" class="list-group-item list-group-item-success ">
    	<b>고객센터</b>
  </a>
  <a href="${pageContext.request.contextPath}/notice" class="list-group-item list-group-item-action">공지사항</a>
  <a href="${pageContext.request.contextPath}/faq" class="list-group-item list-group-item-action">FAQ</a>
  <a href="${pageContext.request.contextPath}/CS/inquiry" class="list-group-item list-group-item-action">1:1 문의하기</a>
  <a href="${pageContext.request.contextPath}/CS/inquiry/inquirylist" class="list-group-item list-group-item-action">1:1 문의 내역</a>
</div>



</div>



							<div class="dropdown-divider"></div>



<div class="all_container" >

<div class="list-group align-top">
  <a href="${pageContext.request.contextPath}/seller/seller" class="list-group-item list-group-item-primary ">
    	<b>상품관리</b>
  </a>
  <a href="${pageContext.request.contextPath}/seller/productlist" class="list-group-item list-group-item-action">상품 목록</a>
  <a href="${pageContext.request.contextPath}/seller/addproduct" class="list-group-item list-group-item-action">상품 추가</a>
  <a href="${pageContext.request.contextPath}/seller/product_qna" class="list-group-item list-group-item-action">상품 문의 답변</a>
</div>
<div class="list-group align-top">


  <a href="${pageContext.request.contextPath}/seller/seller" class="list-group-item list-group-item-primary ">
    	<b>주문관리</b>
  </a>
  <a href="${pageContext.request.contextPath}/seller/orders" class="list-group-item list-group-item-action">주문목록 확인</a>
  <a href="${pageContext.request.contextPath}/seller/search_order" class="list-group-item list-group-item-action">단일 주문건 확인</a>
  <a href="${pageContext.request.contextPath}/seller/product_review" class="list-group-item list-group-item-action">상품평 관리</a>
</div>

<div class="list-group align-top">
  <a href="${pageContext.request.contextPath}/seller/seller" class="list-group-item list-group-item-primary ">
    	<b>기타</b></a>
  <a href="${pageContext.request.contextPath}/seller/charts" class="list-group-item list-group-item-action">통계</a>
  <a href="${pageContext.request.contextPath}/seller/requestaccounting" class="list-group-item list-group-item-action">정산 신청</a>
  <a href="${pageContext.request.contextPath}/seller/accounting" class="list-group-item list-group-item-action">정산신청 내역</a>
  <a href="${pageContext.request.contextPath}/seller/sellerinfo" class="list-group-item list-group-item-action">내정보확인  </a>
  <a href="${pageContext.request.contextPath}/seller/sellersetting" class="list-group-item list-group-item-action">설정  </a>
</div>


</div>









	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

	<!-- Slicknav JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<!-- <script src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script> -->
	<!-- Countdown JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<!-- 	<script src="${pageContext.request.contextPath}/resources/js/nicesellect.js"></script> -->
	<!-- Flex Slider JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
	<!-- Active JS -->
	<%-- 	<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
 --%>


</body>
</html>