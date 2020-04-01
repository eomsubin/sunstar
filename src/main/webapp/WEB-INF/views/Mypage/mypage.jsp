
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
	
<style>

#alert-success{
	display: none;
}

#alert-danger{
	display: none;
}
	

</style>
<script>
//팝업 API
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${pageContext.request.contextPath}/addr","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
};
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2, zipNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	console.log("roadAddrPart1", roadAddrPart1);
	console.log("addrDetail", addrDetail);
	console.log("roadAddrPart2", roadAddrPart2);
	console.log("zipNo", zipNo);
	console.log("roadFullAddr",roadFullAddr);
	console.log($('#roadAddrPart1').val(roadAddrPart1));
	
	console.log($('#address2').val(roadAddrPart2));
	console.log($('#address1').val(roadAddrPart1));
	console.log($('#address3').val(addrDetail));
	console.log($('#zip').val(zipNo));
};


	
	


	
	
	
	

	
	






</script>
<script>

	function pwUpdate(){
		
		var rpw = $('#rpw').val();
		var upw = $('#upw').val();
		var upwcheck =$('#upwcheck').val();
		var password = "${info.password}";
		console.log(rpw);
		console.log(password);
		var Pwreg = /(?=.*\d{1,15})(?=.*[~`!@#$%\^&*()-+=]{1,15})(?=.*[a-zA-Z]{1,50}).{6,15}$/;
		
		if(upw=="" || upw==null){
			alert('변경할 비밀번호를 입력하세요');
		}else if(upw!=upwcheck){
			alert('변경 할 비밀번호가 서로 일치하지 않습니다.');
		}else if(!Pwreg.test(upw)){
			
			alert('띄어쓰기 없는 6~15자의 숫자, 특문 각 1회 이상, 영문은 1개 이상 사용하여  6자리 이상 입력하셔야 합니다.')
			
		}else{
			alert('비밀번호 변경이 성공하였습니다.');
			location.href= "${pageContext.request.contextPath}/mypage/info/"+upw;
			
			
		}
		
	}



</script>

</head>
<body>
	<form role="form" method="post">
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="id" class="id"
				value='<sec:authentication property="principal.UserInfo.id"/>'>
		</sec:authorize>
	</form>
	<!-- Product Style -->
	<section class="product-area shop-sidebar shop section">

		<div class="user-title">
			<h3> ${info.name }님의 기본 정보</h3>
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
								<li><a href="${pageContext.request.contextPath }/mypage/userdrop">회원탈퇴</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/seller_register">판매 회원전환</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>

							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				<!-- sidebar -->
				<form method="post" action="${pageContext.request.contextPath}/info/update">
					<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
					<div class="info-form">
						<div class="form-group">
							<label for="exampleInputEmail1">이름</label> <input type="text"
								class="form-control" id="name1"
								aria-describedby="emailHelp" value="${info.name }" name="name"readonly="readonly">

						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">아이디</label> <input type="text"
								class="form-control" id="id" name="id"value="${info.id }" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>비밀번호</label>
							
						 <input type="password"
								class="form-control" id="upw" name="upw" placeholder="변경 할 비밀번호를 입력하세요">
						</div>
						<div class="form-group">
						
								
						<input type="password"
								class="form-control" id="upwcheck" name="upwcheck" placeholder="변경 할 비밀번호를 확인하세요">
								
							<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
							<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>


						</div>
						<button type="button" 
								class="btn btn-outline-secondary form-control" onclick="pwUpdate()" id="pwup">비밀번호 변경</button>
					</div>
					<h3 class="info-tel">연락처</h3>
					<div class="info-form2">

						<div class="form-group">
							
							<label>휴대폰번호</label> <input type="text" class="form-control"
								id="tel" value="${info.tel }" name="tel">
							<button type="button" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >변경</button>
						</div>
						<div class="form-group">
							
							<label>이메일</label> <input type="email" class="form-control"
								id="email" value="${info.email }" name="email" required="required">
						
						</div>
						
						
					
					</div>	
					<h3 class="info-tel">기본 배송지</h3>
					<div class="info-form2">

						<div class="form-group">
							
							 <input type="text" class="form-control" name="zip"
								id="zip" value="${info.zip }" readonly="readonly" onclick="goPopup();">
							<button type="button"  onclick="goPopup();" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >주소 찾기</button>
						</div>
						<div class="form-group">
								 <input type="text" class="form-control" name="address1"
								id="address1" value="${info.address1 }" readonly="readonly" onclick="goPopup();">
						
						</div>
						<div class="form-group">
						 <input type="text" class="form-control" name="address2"
								id="address2" value="${info.address2}" readonly="readonly" onclick="goPopup();">
						 
						</div>
						  <input type="text" class="form-control" name="address3"
								id="address3" value="${info.address3}" readonly="readonly" onclick="goPopup();">
						
					</div>	
					<div class="info-form" style="margin-top: 60px; text-align: center;">
						<input class="btn btn-primary" type="submit" value="확인" class="form-control" style="text-align: left;">
						<input class="btn btn-primary" type="reset" value="취소" class="form-control">
					</div>
				</form>
			</div>
		</div>
	</section>

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
		<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>


</body>

</html>