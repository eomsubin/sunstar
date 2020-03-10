<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/magnific-popup.min.css">

<!-- Fancybox -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/jquery.fancybox.min.css">

<!-- Nice Select CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/niceselect.css">
<!-- Animate CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/slicknav.min.css">
<!-- Eshop StyleSheet -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/checkout.css">
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/reset.css">
<!-- 	<link rel="stylesheet" href="http://localhost:8080/controller/resources/css/style.css"> -->
<link rel="stylesheet"
	href="http://localhost:8080/controller/resources/css/responsive.css">
 <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
</head>
<body>



	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">홈<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">주문/결제</a></li>
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
					<form class="form" method="post" >
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
									<div class="form-group">
										<label>주문자<span>*</span></label> <input type="text"
											name="name1" id="name1" placeholder="" required="required">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>휴대전화<span>*</span></label> <input type="text"
											name="tel" id="tel" placeholder="" required="required">
									</div>
								</div>
								<div class="col-lg-6 col-md-6 col-12">
									<div class="form-group">
										<label>이메일<span>*</span></label> <input type="email"
											name="email" placeholder="" required="required">
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
											<a href="#" class="btn btn-secondary active" role="button">나의 배송지</a>
										</div>
									</div>
									

								</div>
								<div class="row">
								<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>받으시는 분<span>*</span></label> <input type="text"
												name="name2" placeholder="" required="required">
										</div>
								</div>
							
									
								</div>
								<div class="row">
										<div class="col-lg-4 col-md-4 col-2">
										<div class="form-group">
											<label>주소<span>*</span></label> <input type="text"
												name="addr1" placeholder="" required="required" readonly="readonly">
										</div>
									</div>
								</div>
								
								</div>			
								<div class="row">
										<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											 <input type="text"
												name="addr2" placeholder="" required="required" readonly="readonly">
										</div>
									</div>
								</div>
								<div class="row">
										<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											 <input type="text"
												name="addr3" placeholder="" required="required" readonly="readonly">
										</div>
									</div>
								</div>
								
														
								




							<!-- 	
								<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>Country<span>*</span></label>
											<select name="country_name" id="country">
												<option value="AF">Afghanistan</option>
												<option value="AX">Åland Islands</option>
												<option value="AL">Albania</option>
												<option value="DZ">Algeria</option>
												<option value="AS">American Samoa</option>
												<option value="AD">Andorra</option>
												<option value="AO">Angola</option>
												<option value="AI">Anguilla</option>
												<option value="AQ">Antarctica</option>
												<option value="AG">Antigua and Barbuda</option>
												<option value="AR">Argentina</option>
												<option value="AM">Armenia</option>
												<option value="AW">Aruba</option>
												<option value="AU">Australia</option>
												<option value="AT">Austria</option>
												<option value="AZ">Azerbaijan</option>
												<option value="BS">Bahamas</option>
												<option value="BH">Bahrain</option>
												<option value="BD">Bangladesh</option>
												<option value="BB">Barbados</option>
												<option value="BY">Belarus</option>
												<option value="BE">Belgium</option>
												<option value="BZ">Belize</option>
												<option value="BJ">Benin</option>
												<option value="BM">Bermuda</option>
												<option value="BT">Bhutan</option>
												<option value="BO">Bolivia</option>
												<option value="BA">Bosnia and Herzegovina</option>
												<option value="BW">Botswana</option>
												<option value="BV">Bouvet Island</option>
												<option value="BR">Brazil</option>
												<option value="IO">British Indian Ocean Territory</option>
												<option value="VG">British Virgin Islands</option>
												<option value="BN">Brunei</option>
												<option value="BG">Bulgaria</option>
												<option value="BF">Burkina Faso</option>
												<option value="BI">Burundi</option>
												<option value="KH">Cambodia</option>
												<option value="CM">Cameroon</option>
												<option value="CA">Canada</option>
												<option value="CV">Cape Verde</option>
												<option value="KY">Cayman Islands</option>
												<option value="CF">Central African Republic</option>
												<option value="TD">Chad</option>
												<option value="CL">Chile</option>
												<option value="CN">China</option>
												<option value="CX">Christmas Island</option>
												<option value="CC">Cocos [Keeling] Islands</option>
												<option value="CO">Colombia</option>
												<option value="KM">Comoros</option>
												<option value="CG">Congo - Brazzaville</option>
												<option value="CD">Congo - Kinshasa</option>
												<option value="CK">Cook Islands</option>
												<option value="CR">Costa Rica</option>
												<option value="CI">Côte d’Ivoire</option>
												<option value="HR">Croatia</option>
												<option value="CU">Cuba</option>
												<option value="CY">Cyprus</option>
												<option value="CZ">Czech Republic</option>
												<option value="DK">Denmark</option>
												<option value="DJ">Djibouti</option>
												<option value="DM">Dominica</option>
												<option value="DO">Dominican Republic</option>
												<option value="EC">Ecuador</option>
												<option value="EG">Egypt</option>
												<option value="SV">El Salvador</option>
												<option value="GQ">Equatorial Guinea</option>
												<option value="ER">Eritrea</option>
												<option value="EE">Estonia</option>
												<option value="ET">Ethiopia</option>
												<option value="FK">Falkland Islands</option>
												<option value="FO">Faroe Islands</option>
												<option value="FJ">Fiji</option>
												<option value="FI">Finland</option>
												<option value="FR">France</option>
												<option value="GF">French Guiana</option>
												<option value="PF">French Polynesia</option>
												<option value="TF">French Southern Territories</option>
												<option value="GA">Gabon</option>
												<option value="GM">Gambia</option>
												<option value="GE">Georgia</option>
												<option value="DE">Germany</option>
												<option value="GH">Ghana</option>
												<option value="GI">Gibraltar</option>
												<option value="GR">Greece</option>
												<option value="GL">Greenland</option>
												<option value="GD">Grenada</option>
												<option value="GP">Guadeloupe</option>
												<option value="GU">Guam</option>
												<option value="GT">Guatemala</option>
												<option value="GG">Guernsey</option>
												<option value="GN">Guinea</option>
												<option value="GW">Guinea-Bissau</option>
												<option value="GY">Guyana</option>
												<option value="HT">Haiti</option>
												<option value="HM">Heard Island and McDonald Islands</option>
												<option value="HN">Honduras</option>
												<option value="HK">Hong Kong SAR China</option>
												<option value="HU">Hungary</option>
												<option value="IS">Iceland</option>
												<option value="IN">India</option>
												<option value="ID">Indonesia</option>
												<option value="IR">Iran</option>
												<option value="IQ">Iraq</option>
												<option value="IE">Ireland</option>
												<option value="IM">Isle of Man</option>
												<option value="IL">Israel</option>
												<option value="IT">Italy</option>
												<option value="JM">Jamaica</option>
												<option value="JP">Japan</option>
												<option value="JE">Jersey</option>
												<option value="JO">Jordan</option>
												<option value="KZ">Kazakhstan</option>
												<option value="KE">Kenya</option>
												<option value="KI">Kiribati</option>
												<option value="KW">Kuwait</option>
												<option value="KG">Kyrgyzstan</option>
												<option value="LA">Laos</option>
												<option value="LV">Latvia</option>
												<option value="LB">Lebanon</option>
												<option value="LS">Lesotho</option>
												<option value="LR">Liberia</option>
												<option value="LY">Libya</option>
												<option value="LI">Liechtenstein</option>
												<option value="LT">Lithuania</option>
												<option value="LU">Luxembourg</option>
												<option value="MO">Macau SAR China</option>
												<option value="MK">Macedonia</option>
												<option value="MG">Madagascar</option>
												<option value="MW">Malawi</option>
												<option value="MY">Malaysia</option>
												<option value="MV">Maldives</option>
												<option value="ML">Mali</option>
												<option value="MT">Malta</option>
												<option value="MH">Marshall Islands</option>
												<option value="MQ">Martinique</option>
												<option value="MR">Mauritania</option>
												<option value="MU">Mauritius</option>
												<option value="YT">Mayotte</option>
												<option value="MX">Mexico</option>
												<option value="FM">Micronesia</option>
												<option value="MD">Moldova</option>
												<option value="MC">Monaco</option>
												<option value="MN">Mongolia</option>
												<option value="ME">Montenegro</option>
												<option value="MS">Montserrat</option>
												<option value="MA">Morocco</option>
												<option value="MZ">Mozambique</option>
												<option value="MM">Myanmar [Burma]</option>
												<option value="NA">Namibia</option>
												<option value="NR">Nauru</option>
												<option value="NP">Nepal</option>
												<option value="NL">Netherlands</option>
												<option value="AN">Netherlands Antilles</option>
												<option value="NC">New Caledonia</option>
												<option value="NZ">New Zealand</option>
												<option value="NI">Nicaragua</option>
												<option value="NE">Niger</option>
												<option value="NG">Nigeria</option>
												<option value="NU">Niue</option>
												<option value="NF">Norfolk Island</option>
												<option value="MP">Northern Mariana Islands</option>
												<option value="KP">North Korea</option>
												<option value="NO">Norway</option>
												<option value="OM">Oman</option>
												<option value="PK">Pakistan</option>
												<option value="PW">Palau</option>
												<option value="PS">Palestinian Territories</option>
												<option value="PA">Panama</option>
												<option value="PG">Papua New Guinea</option>
												<option value="PY">Paraguay</option>
												<option value="PE">Peru</option>
												<option value="PH">Philippines</option>
												<option value="PN">Pitcairn Islands</option>
												<option value="PL">Poland</option>
												<option value="PT">Portugal</option>
												<option value="PR">Puerto Rico</option>
												<option value="QA">Qatar</option>
												<option value="RE">Réunion</option>
												<option value="RO">Romania</option>
												<option value="RU">Russia</option>
												<option value="RW">Rwanda</option>
												<option value="BL">Saint Barthélemy</option>
												<option value="SH">Saint Helena</option>
												<option value="KN">Saint Kitts and Nevis</option>
												<option value="LC">Saint Lucia</option>
												<option value="MF">Saint Martin</option>
												<option value="PM">Saint Pierre and Miquelon</option>
												<option value="VC">Saint Vincent and the Grenadines</option>
												<option value="WS">Samoa</option>
												<option value="SM">San Marino</option>
												<option value="ST">São Tomé and Príncipe</option>
												<option value="SA">Saudi Arabia</option>
												<option value="SN">Senegal</option>
												<option value="RS">Serbia</option>
												<option value="SC">Seychelles</option>
												<option value="SL">Sierra Leone</option>
												<option value="SG">Singapore</option>
												<option value="SK">Slovakia</option>
												<option value="SI">Slovenia</option>
												<option value="SB">Solomon Islands</option>
												<option value="SO">Somalia</option>
												<option value="ZA">South Africa</option>
												<option value="GS">South Georgia</option>
												<option value="KR">South Korea</option>
												<option value="ES">Spain</option>
												<option value="LK">Sri Lanka</option>
												<option value="SD">Sudan</option>
												<option value="SR">Suriname</option>
												<option value="SJ">Svalbard and Jan Mayen</option>
												<option value="SZ">Swaziland</option>
												<option value="SE">Sweden</option>
												<option value="CH">Switzerland</option>
												<option value="SY">Syria</option>
												<option value="TW">Taiwan</option>
												<option value="TJ">Tajikistan</option>
												<option value="TZ">Tanzania</option>
												<option value="TH">Thailand</option>
												<option value="TL">Timor-Leste</option>
												<option value="TG">Togo</option>
												<option value="TK">Tokelau</option>
												<option value="TO">Tonga</option>
												<option value="TT">Trinidad and Tobago</option>
												<option value="TN">Tunisia</option>
												<option value="TR">Turkey</option>
												<option value="TM">Turkmenistan</option>
												<option value="TC">Turks and Caicos Islands</option>
												<option value="TV">Tuvalu</option>
												<option value="UG">Uganda</option>
												<option value="UA">Ukraine</option>
												<option value="AE">United Arab Emirates</option>
												<option value="US" selected="selected">United Kingdom</option>
												<option value="UY">Uruguay</option>
												<option value="UM">U.S. Minor Outlying Islands</option>
												<option value="VI">U.S. Virgin Islands</option>
												<option value="UZ">Uzbekistan</option>
												<option value="VU">Vanuatu</option>
												<option value="VA">Vatican City</option>
												<option value="VE">Venezuela</option>
												<option value="VN">Vietnam</option>
												<option value="WF">Wallis and Futuna</option>
												<option value="EH">Western Sahara</option>
												<option value="YE">Yemen</option>
												<option value="ZM">Zambia</option>
												<option value="ZW">Zimbabwe</option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>State / Divition<span>*</span></label>
											<select name="state-province" id="state-province">
												<option value="divition" selected="selected">New Yourk</option>
												<option>Los Angeles</option>
												<option>Chicago</option>
												<option>Houston</option>
												<option>San Diego</option>
												<option>Dallas</option>
												<option>Charlotte</option>
											</select>
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>Address Line 1<span>*</span></label>
											<input type="text" name="address" placeholder="" required="required">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>Address Line 2<span>*</span></label>
											<input type="text" name="address" placeholder="" required="required">
										</div>
									</div>
									<div class="col-lg-6 col-md-6 col-12">
										<div class="form-group">
											<label>Postal Code<span>*</span></label>
											<input type="text" name="post" placeholder="" required="required">
										</div>
									</div>  -->

							<!-- <div class="col-12">
										<div class="form-group create-account">
											<input id="cbox" type="checkbox">
											<label>Create an account?</label>
										</div>
									</div> -->

						
						<!--/ End Form -->
					</div>
				</div>
				<div class="col-lg-4 col-12">
					<div class="order-details">
						<!-- Order Widget -->
						<div class="single-widget">
							<h2>CART TOTALS</h2>
							<div class="content">
								<ul>
									<li>Sub Total<span>$330.00</span></li>
									<li>(+) Shipping<span>$10.00</span></li>
									<li class="last">Total<span>$340.00</span></li>
								</ul>
							</div>
						</div>
						<!--/ End Order Widget -->
						<!-- Order Widget -->
						<div class="single-widget">
							<h2>Payments</h2>
							<div class="content">
								<div class="checkbox">
									<label class="checkbox-inline" for="1"><input
										name="updates" id="1" type="checkbox"> Check Payments</label>
									<label class="checkbox-inline" for="2"><input
										name="news" id="2" type="checkbox"> Cash On Delivery</label> <label
										class="checkbox-inline" for="3"><input name="news"
										id="3" type="checkbox"> PayPal</label>
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
							<!-- 	<button onclick="requestPay()">결제</button> -->
							<button onclick="abc(name1,tel)">결제</button>
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
 	function abc(name,tel){
 		
 		let a = name.value;
 		let b = tel.value;
 		
 	/* 	let a = document.getElementById("name").value;
 		let b = document.getElementById("tel").value; */
 		console.log(a);
 		console.log(b);
 	}
	//  var IMP = window.IMP; // 생략해도 괜찮습니다.
	  IMP.init("imp09596317"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
	  
	//IMP.request_pay(param, callback) 호출
	 function requestPay(){
	  IMP.request_pay({ // param
	    pg: "inicis",
	    pay_method: "card",
	    merchant_uid: "ORD20180131-0000011",
	    name: "노르웨이 회전 의자",
	    amount: 64900,
	    buyer_email: "gildong@gmail.com",
	    buyer_name: "홍길동",
	    buyer_tel: "010-4242-4242",
	    buyer_addr: "서울특별시 강남구 신사동",
	    buyer_postcode: "01181"
	  }, function (rsp) { // callback
	    if (rsp.success) {
	        
	        // 결제 성공 시 로직,
	    	 var msg = '결제가 완료되었습니다.';
	         msg += '고유ID : ' + rsp.imp_uid;
	         msg += '상점 거래ID : ' + rsp.merchant_uid;
	         msg += '결제 금액 : ' + rsp.paid_amount;
	         msg += '카드 승인번호 : ' + rsp.apply_num;
	         
	    } else {
	        
	        // 결제 실패 시 로직,
	    	var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	  });

	  }
  	
  
  
  </script>
	<!--/ End Checkout -->
	<script
		src="http://localhost:8080/controller/resources/js/jquery-migrate-3.0.0.js"></script>
	<script
		src="http://localhost:8080/controller/resources/js/jquery-ui.min.js"></script>





	<!-- Slicknav JS -->
	<script
		src="http://localhost:8080/controller/resources/js/slicknav.min.js"></script>
	<!-- Owl Carousel JS -->
	<script
		src="http://localhost:8080/controller/resources/js/owl-carousel.js"></script>
	<!-- Magnific Popup JS -->
	<script
		src="http://localhost:8080/controller/resources/js/magnific-popup.js"></script>
	<!-- Waypoints JS -->
	<!-- <script src="http://localhost:8080/controller/resources/js/waypoints.min.js"></script> -->
	<!-- Countdown JS -->
	<script
		src="http://localhost:8080/controller/resources/js/finalcountdown.min.js"></script>
	<!-- Nice Select JS -->
	<
	<script
		src="http://localhost:8080/controller/resources/js/nicesellect.js"></script>
	<!-- Flex Slider JS -->
	<script
		src="http://localhost:8080/controller/resources/js/flex-slider.js"></script>
	<!-- ScrollUp JS -->
	<script src="http://localhost:8080/controller/resources/js/scrollup.js"></script>
	<!-- Onepage Nav JS -->
	<script
		src="http://localhost:8080/controller/resources/js/onepage-nav.min.js"></script>
	<!-- Easing JS -->
	<script src="http://localhost:8080/controller/resources/js/easing.js"></script>
	<!-- Active JS -->
	<script src="http://localhost:8080/controller/resources/js/active.js"></script>

</body>
</html>