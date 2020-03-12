<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>



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
							<h2>주문자 정보 입력</h2>
							<p>주문하시는 분의 정보를 입력해주세요</p>
							<div class="row">

								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group ">
										<label for="name1">주문자<span>*</span></label> <input
											class="form-control" type="text" name="name1" id="name1"
											placeholder="" required="required">
										<div class="hiddenname1 is-invalid invalid-feedback">*이름을
											입력해주세요</div>

									</div>
								</div>

								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>휴대전화<span>*</span></label> <input type="text"
											class="form-control" name="tel" id="tel" placeholder=""
											required>
										<div class="hiddentel is-invalid invalid-feedback">*휴대전화를
											입력해주세요('-' 제외,숫자만 입력)</div>


									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>이메일<span>*</span></label> <input type="email"
											name="email" id="email" placeholder="" required="required">
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
												name="name2" id="name2" placeholder="" required="required">
											<div class="hiddenname2 is-invalid invalid-feedback">*받는
												분의 이름을 적어주세요</div>
										</div>
									</div>


								</div>
								<div class="row">
									<div class="col-lg-4 col-md-4 col-2">
										<div class="form-group">
											<label>주소<span>*</span></label> <input type="text"
												name="addr1" id="addr1" placeholder="" required="required"
												readonly="readonly">
										</div>
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input type="text" name="addr2" id="addr2" placeholder=""
											required="required" readonly="readonly">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<input type="text" name="addr3" id="addr3" placeholder=""
											required="required" readonly="readonly">

									</div>
								</div>
							</div>
							<label>배송시 요청사항</label>
							
							<div class="form-group">
								
								<textarea id="shiptext" name="shiptext" class="form-control" aria-label="With textarea" rows="2" style="width:500px;" ></textarea>
								
							</div>
							
	
			




							<!--/ End Form -->
						</div>
					</div>
					<div class="col-lg-4 col-12">
						<div class="order-details">
							<!-- Order Widget -->
							<div class="single-widget">
								<h2>카트</h2>
								<div class="content">
									<ul>
										<li>상품 금액<span>$330.00</span></li>
										<li>(+) 배송비<span>$10.00</span></li>
										<li class="last">총 금액<span>$340.00</span></li>
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
										<input class="btn btn-sm" type="button" onclick="requestPay()" value="결제하기" style="color:#333;">
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
			} else if (name2.value == null || name2.value == "") {
				$('.hiddenname2').show(200);
				$('#name2').keydown(function(event) {
					$('.hiddenname2').hide(444);
				})
				return false;
			} else if ($('input:checkbox[name=updates]').is(":checked") == false) {

				return false;
			}

			else {
				// name1: 주문자
				// tel: 휴대전화
				// email: 이메일
				// name2: 받는 사람
				// addr1 addr2 addr3 주소
				// shiptext: 배송 시 요청사항
				IMP.request_pay({ // param
					pg : "inicis",
					pay_method : "card",
					merchant_uid : "ORD20180131-0000011",
					name : "최솔이 콧물",
					amount : 100,
					buyer_email : email.value,
					buyer_name : name1.value,
					buyer_tel : tel.value,
					buyer_addr : addr2.value + addr3.value,
					buyer_postcode : addr1.value
				}, function(rsp) { // callback
					if (rsp.success) {

						// 결제 성공 시 로직,
						
						$.ajax({
							url:"${pageContext.request.contextPath}/complete"
							,type: 'POST'	
							,dataType: 'JSON'
							,data:{
								imp_uid : rsp.imp_uid
								// 기타 데이터들 추가 전달
							}
							
						}).done(function(data) {
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
				    	});
						
						
						/* var msg = '결제가 완료되었습니다.';
						msg += '고유ID : ' + rsp.imp_uid;
						msg += '상점 거래ID : ' + rsp.merchant_uid;
						msg += '결제 금액 : ' + rsp.paid_amount;
						msg += '카드 승인번호 : ' + rsp.apply_num; */

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
	<script src="${pageContext.request.contextPath}/resources/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
	<!-- Active JS -->
	<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>

</body>
</html>