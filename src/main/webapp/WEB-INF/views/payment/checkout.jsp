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
<!-- Magnific Popup -->
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/checkout.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<!-- 	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
<!-- iamport.payment.js -->


<style>
.content ul li {
	font-size: 0.9em !important;
	margin-bottom: 5px !important;
}
</style>
<script>
//팝업 API
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
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
	console.log($('#shipping_addr2').val(roadAddrPart2));
	console.log($('#shipping_addr1').val(roadAddrPart1));
	console.log($('#shipping_addr3').val(addrDetail));
	
	console.log($('#shipping_zip').val(zipNo));
};

</script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>
<body>
	<form role="form" method="post">
		<sec:authorize access="isAuthenticated()">
			<input type="hidden" name="id" class="id"
				value='<sec:authentication property="principal.UserInfo.id"/>'>
		</sec:authorize>
	</form>


	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="${pageContext.request.contextPath }">스삐제<i
									class="ti-arrow-right"></i></a></li>
							<li class="active">결제</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- Start Checkout -->

	<section class="shop checkout section">

		<!-- Form -->
		<form method="post" name="payform" id="payform"
			onsubmit="return requestPay()" class="form">

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="container">
				<div class="row">



					<div class="col-lg-8 col-12">
						<div class="checkout-form">

							<h2>주문자 정보</h2>
							<p>주문하시는 분의 정보를 확인해주세요</p>
							<div class="row">

								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label for="name1">주문자<span>*</span></label> <input
											class="form-control" type="text" name="name1" id="name1"
											placeholder="" value="${userinfo.name }" required="required"
											readonly="readonly">
										<div class="hiddenname1 is-invalid invalid-feedback">*이름을
											입력해주세요</div>

									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>휴대전화<span>*</span></label> <input type="text"
											class="form-control" name="tel" id="tel" placeholder=""
											required value="${userinfo.tel }" >
										<div class="hiddentel is-invalid invalid-feedback">*휴대전화를
											입력해주세요('-' 제외,숫자만 입력)</div>


									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>이메일<span>*</span></label> <input type="email"
											name="email" id="email" placeholder="" required="required"
											readonly="readonly" value="${userinfo.email }">
										<div class="hiddenemail is-invalid invalid-feedback">*이메일
											형식에 맞게 입력해주세요</div>
									</div>
								</div>
							</div>



							<div class="checkout-form">
								<h2>배송지 입력</h2>
								<p>받는 분의 배송지를 입력해주세요</p>
								<!-- Form -->
								<div class="row">

									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<a href="#" class="btn btn-secondary active" role="button">나의
												배송지</a>
										</div>
									</div>


								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>받으시는 분<span>*</span></label> <input type="text"
												name="to_name" id="to_name" placeholder=""
												required="required">
											<div class="hiddenname2 is-invalid invalid-feedback">*받는
												분의 이름을 적어주세요</div>
										</div>
									</div>


								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 col-2">
										<div class="form-group">
											<label>주소<span>*</span></label> <input type="text"
												name="shipping_zip" id="shipping_zip" placeholder=""
												required="required" value="${userinfo.zip }" readonly="readonly">
											<button type="button" onclick="goPopup();"
												style="position: relative; left: 330px; bottom: 44px;"
												class="btn btn-secondary btn-lg">주소 찾기</button>
											
										</div>
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input type="text" name="shipping_addr1" id="shipping_addr1"
											placeholder="" required="required" readonly="readonly"
											value="${userinfo.address1}">

										<div class="hiddenaddr1 is-invalid invalid-feedback">
													*주소를 입력하세요
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input type="text" name="shipping_addr2" id="shipping_addr2"
											placeholder="" required="required" readonly="readonly"
											value="${userinfo.address2}">


									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input type="text" name="shipping_addr3" id="shipping_addr3"
											placeholder="" required="required" readonly="readonly"
											value="${userinfo.address3}">


									</div>
								</div>
							</div>

							<label>배송시 요청사항</label>

							<div class="form-group">

								<textarea id="message" name="message" class="form-control"
									aria-label="With textarea" rows="2" style="width: 500px;"></textarea>

							</div>







							<!--/ End Form -->
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="order-details">
							<!-- Order Widget -->
							<div class="single-widget">
								<h2>구매목록</h2>
								<div class="content">
									<c:set var="sum" value="0" />
									<c:set var="sum2" value="0"/>
								
								<c:forEach var="pdto" items="${pdto }" begin="0" end="${getCount-1 }">									
								 	 <ul><li>업체명<span>${pdto.seller_name }</span></li></ul>
								 	
								 	<c:forEach var="odto" items="${odto }" >
										<c:if test="${pdto.seller_code == odto.seller_code }">
								
									<ul class="bb">
										
										<li style="display: none">상품코드<span  class="prod">${odto.product_code }</span></li>
										<li style="display: none">업체코드<span  class="prod">${odto.seller_code }</span></li>
										<li style="width:200px;  position: relative; left:85px; bottom:15px; "><img src="${pageContext.request.contextPath }/${odto.thumb_img }"></li>
								
										<li>상품명<span>${odto.product_name }</span><li>
										<li>상품 금액<span>${odto.price+odto.add_price} 원</span></li>
										<li>옵션1<span>${odto.option1 }</span></li>
										<li>옵션2<span>${odto.option2 }</span></li>
										<li>수량<span>${odto.cart_quantity } 개</span>
										<li>배송비<span>${odto.shipping_cost } 원</span></li>
									
										<li class="last" style="color:#f7941d; font-weight: 700;">총 금액<span>${(odto.price+odto.add_price)*odto.cart_quantity} 원</span></li>
										
										</ul>
										
										<c:set var="sum" value="${sum+(odto.price+odto.add_price)*odto.cart_quantity}" />
										
										</c:if>
									</c:forEach>
									<c:set var="sum2" value="${sum2+(pdto.shipping_cost)}"/>
								</c:forEach>			
									<ul>
										
										<li>(+) 총 배송비<span>${sum2} 원</span></li>
										
										
									</ul>
									
								<ul>
									<li style="font-size: 1.2em !important; ">결제 금액<span>${sum+sum2}원</span></li>
								</ul> 
								</div>
							</div>
							<!--/ End Order Widget -->
							<!-- Order Widget -->
							<div class="single-widget">
								<h2>결제 수단</h2>
								<div class="content">
									<div class="checkbox">
										<label class="checkbox-inline" for="1"><input
											name="updates" id="1" type="checkbox"> 신용/체크카드</label>
										<!--  <label
											class="checkbox-inline" for="2"><input name="news"
											id="2" type="checkbox"> PayPal</label> -->
									</div>
								</div>
							</div>
							<!--/ End Order Widget -->
							<!-- Payment Method Widget -->
							<div class="single-widget payement">
								<div class="content">
									<img
										src="${pageContext.request.contextPath }/resources/images/payment-method.png"
										alt="#">
								</div>
							</div>
							<!--/ End Payment Method Widget -->
							<!-- Button Widget -->
							<div class="single-widget get-button">
								<div class="content">
									<div class="button">
										<!-- <button onclick="requestPay(name1,tel,email,name2,addr1,addr2,addr3)">결제</button> -->
										<input class="btn btn-sm" type="button" onclick="requestPay()"
											value="결제하기" style="color: #333;">
									</div>
								</div>
							</div>
							<!--/ End Button Widget -->

						</div>

					</div>

				</div>

			</div>
		</form>
	</section>
	<script>
	
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init("imp09596317"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
		var regtel = /^[0-9]+$/;
		var regEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var csrfHeaderName= "${_csrf.headerName}";
		var csrfTokenValue= "${_csrf.token}"
		//IMP.request_pay(param, callback) 호출
		function requestPay() {

			if (name1.value == null || name1.value == "") {

				$('.hiddenname1').show(200);
				$('#name1').keydown(function(event) {
					$('.hiddenname1').hide(444);
				})

				return false;

			}

			else if (!regtel.test(tel.value)) {
				$('.hiddentel').show(200);
				$('#tel').keydown(function(event) {
					$('.hiddentel').hide(444);
				})

				return false;
			}

			else if (!regEm.test(email.value)) {
				$('.hiddenemail').show(200);
				$('#email').keydown(function(event) {
					$('.hiddenemail').hide(444);
				})
				return false;
			} else if (to_name.value == null || to_name.value == "") {
				$('.hiddenname2').show(200);
				$('#to_name').keydown(function(event) {
					$('.hiddenname2').hide(444);
				})
				return false;
			} else if ($('input:checkbox[name=updates]').is(":checked") == false) {

				return false;
			 
			} else if(shipping_addr1.value == null || shipping_addr1.value ==" "){
				alert('네이버회원은 기본 배송지를 입력하셔야 합니다.');
				
				return false;
			} 
			 
	
			else {
				// name1: 주문자
				// tel: 휴대전화
				// email: 이메일
				// name2: 받는 사람
				// addr1 addr2 addr3 주소
				// shiptext: 배송 시 요청사항
				let today= new Date();
				let year = today.getFullYear();
				let month = today.getMonth()+1;
				let date = today.getDate();
				let hours = today.getHours();
				let minutes = today.getMinutes();
				
				if(month<10){
					month='0'+month;
				}
				if(date<10){
					date='0'+date;
				}
				if(hours<10){
					hours='0'+hours;
				}
				if(minutes<10){
					minutes='0'+minutes;
				}
				
				var generateRandom = function(min,max){
					var ranNum = Math.floor(Math.random()*(max-min+1))+ min;
					return ranNum;
				}
				var message = $('#message').val();
			
				/* var codes = new Array();				
				let bbb= $('.bb').length;
				for(i=0;i<bbb;i++){
					let aaaa= $('.prod').eq(i).text();
					codes.push(aaaa);
					
				}
				
				console.log(codes); */
				var product_codes = new Array();
				var quantities = new Array();
				var options1 = new Array();
				var options2 = new Array();
				var add_prices = new Array(); 
				var seller_code = new Array();
				var total_price = new Array();
				var shipping_cost_per_seller = new Array();
				var cart_no = new Array();
				
				 <c:forEach var="item2" items="${pdto}">
				 seller_code.push(${item2.seller_code});		
					shipping_cost_per_seller.push(${item2.shipping_cost}); 
					/* console.log(${item2.seller_code});
					console.log(${item2.shipping_cost}); */
				</c:forEach>
						/* console.log(${pdto}) */
				
				<c:forEach var="item" items="${odto}">
					product_codes.push(${item.product_code});
					quantities.push(${item.cart_quantity});
					options1.push("${item.option1}");
					options2.push("${item.option2}");
					add_prices.push(${item.add_price});
					cart_no.push(${item.cart_no});
					
				</c:forEach>
				
				
				
				
				IMP.request_pay({ // param
					pg : "inicis",
					pay_method : "card",
					merchant_uid : ""+year+month+date+hours+minutes+generateRandom(100,999),
					name : "${odto[0].product_name}",
					amount : "${sum+sum2}",
					buyer_email : email.value,
					buyer_name : name1.value,
					buyer_tel : tel.value,
					buyer_addr : shipping_addr1.value+shipping_addr3.value,
					buyer_postcode : shipping_zip.value
				}, function(rsp) { // callback
					
				
					if (rsp.success) {
						let status= "결제완료";
						let pay_name= "카드";
						let userid = "${userinfo.id}";
						// 결제 성공 시 로직,
						var allData={"order_code":rsp.merchant_uid,
									"delivery_state":status,
									"order_way":pay_name,
									"id": userid,
									"message": message,
								    "product_codes": product_codes,
									"quantities": quantities,
									"options1": options1,
									"options2": options2,
									"add_prices": add_prices,
									"shipping_zip": "${userinfo.zip}",
									"to_name": to_name.value,
									"shipping_addr1": shipping_addr1.value,
									"shipping_addr2": shipping_addr2.value,
									"shipping_addr3": shipping_addr3.value,
									"shipping_name": "나의 배송지",
									"seller_codes": seller_code,
									
									
									"shipping_cost_per_sellers": shipping_cost_per_seller,
									"cart_nos": cart_no
									};
						console.log(allData);
						
						
						$.ajax({
							url:"${pageContext.request.contextPath}/checkout/complete"
							,type: 'POST'	
							,dataType: 'JSON'
							,contentType: "application/json; charset=utf-8"
							,data: JSON.stringify(allData)
							,beforeSend: function(xhr){
								xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
							}
						
								
							
								
							
								//imp_uid : rsp.imp_uid,
							   // 'order_code': rsp.merchant_uid,
								//product_name: rsp.name,
								//price: rsp.amount,
								
								//'delivery_state': rsp.status,
								//'order_way': rsp.pay_method,
								//name: rsp.buyer_name,
								//'tracking_no': name2.value,
						
								//tel: rsp.buyer_tel,
								//shipping_addr2: rsp.buyer_addr,
								//shipping_zip: rsp.buyer_postcode,
								//'message': shiptext.value 
								// 기타 데이터들 추가 전달
							
							
						});/* .done(function(data) {
				    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				    		if ( everythings_fine ) {
				    			var msg = '결제가 완료되었습니다.';
				    			msg += '\n고유ID : ' + rsp.imp_uid;
				    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
				    			msg += '\결제 금액 : ' + rsp.paid_amount;
				    			msg += '카드 승인번호 : ' + rsp.apply_num;
								
				    			alert(msg);
				    		
				    			
				    		} else {
				    			//[3] 아직 제대로 결제가 되지 않았습니다.
				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				    		}
				    	}); */
						
						
						 var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num; 
						
						location.href="${pageContext.request.contextPath}/";
					} else {

						// 결제 실패 시 로직,
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;

					}
				});
				
			}
			return true;
			
		}
		
	</script>
	<!--/ End Checkout -->
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

	<script
		src="${pageContext.request.contextPath}/resources/js/nicesellect.js"></script>
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