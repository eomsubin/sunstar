<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
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
	href="${pageContext.request.contextPath}/resources/css/reset.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
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
	
	console.log($('#seller_address2').val(roadAddrPart2));
	console.log($('#seller_address1').val(roadAddrPart1));
	console.log($('#seller_address3').val(addrDetail));
	console.log($('#seller_zip').val(zipNo));
};
 function init(){
		alert("이미 판매 회원입니다."); 
		location.href="${pageContext.request.contextPath }/mypage/info";
	}
 function regck(){
		let initresult;
		let id = $('#id').val();
		  $.ajax({
				url : "${pageContext.request.contextPath}/registerseller/selleridcheck/"+id
				,dataType : "json"
				,async: false
				,success:function(data){
					initresult = data;
				}
				,error:function(e){
					console.log(e);
				}
			});
		  if(initresult>0){
			  $(":submit").val("처리중입니다.");
			  $(":input").prop("disabled", "disabled");
		  }
		}
 $(document).ready(function(){
		$("#hasROLE").trigger("click");
		regck();
		if("${m}">0){
			alert("신청이 완료되었습니다. 전환까지 평균 1~2일이 소요되며 완료 시  이메일로 알려드립니다.")
		}
	});
</script>
</head>
<body>
<sec:authorize access="hasRole('ROLE_MANAGER')">
	<div id="hasROLE" onclick="init()"></div>
</sec:authorize>
	<section class="product-area shop-sidebar shop section">
	<div class="user-title">
			<h3> 판매 회원전환</h3>
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
				
		<!-- Page Heading -->
		

		<!-- DataTales Example -->
		

				<!-- 내용 -->
				<div style="width:70%;">
				<form action="${pageContext.request.contextPath}/registerseller" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-row col-md-12">

						
						<div class="form-group col-md-6">
							<label for="inputPassword4">아이디</label> <input type="text"
								class="form-control" name="id" id="id" value="${dto.id}" readonly="readonly">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationDefault01">업체명</label> <input type="text"
								class="form-control" id="seller_name" name="seller_name"
								 required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">전화번호</label> <input type="text"
								class="form-control" id="seller_tel" name="seller_tel"
								 required>
						</div>
						
						
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">이메일</label> <input type="email"
								class="form-control" id="seller_email" name="seller_email"
								 required>
						</div>
						
						<div class="col-md-8">
							<label for="validationDefault03">주소</label> 
							<input type="text" 	class="form-control mb-1" id="seller_address1" name="seller_address1" onclick="goPopup()"
								 required>
								<input type="text" 	class="form-control mb-1" id="seller_address2" name="seller_address2" onclick="goPopup()"
								 required>
								<input type="text" 	class="form-control mb-1" id="seller_address3" name="seller_address3" onclick="goPopup()"
								 required>
						</div>
						
						<div class="col-md-4 mb-1">
							<label for="validationDefault05">우편번호</label> <input type="text"
								class="form-control" id="seller_zip" name="seller_zip"
								required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">은행</label>
								
						<select class="form-control" id="bank" name="bank"
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
							
						</div>
						<div class="col-md-9">
							<label for="validationDefault03">계좌번호</label>
							 <input type="text"
								class="form-control" id="bank_no" name="bank_no"
								 required>
						</div>
						
						<div class="form-group col-md-6">
							<label for="business_license">사업자 등록번호</label> <input type="text"
								class="form-control" id="business_license" name="business_license" readonly="readonly" 
								>
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">판매기한</label>
							
				<input type="button" class="btn btn-info" value="연장" style="font-size:0.66em; padding:2px 4px 1px 3px; margin: 0 !important;"  data-toggle="modal" data-target="#staticBackdrop">
					<input type="date"
								class="form-control" id="seller_deadline" name="seller_deadline"
								required>
						</div>
						
						
						<div class="col-md-4">
							<label for="validationDefault05">계약 택배사</label>
								
						<select class="form-control" id="shipping_company" name="shipping_company" >
								<option value="한진택배">한진택배</option>
								<option value="CJ대한통운">CJ대한통운</option>
								<option value="KGB택배">KGB택배</option>
								<option value="우체국택배">우체국택배</option>
								<option value="롯데택배">롯데택배</option>
								<option value="Fedex">Fedex</option>
							</select>
							
						</div>
						<div class="col-md-4">
							<label for="validationDefault03">기본 배송비</label>
							 <input type="text"
								class="form-control" id="basic_shipping_cost" name="basic_shipping_cost"  required>
						</div>
						<div class="col-md-4">
							<label for="free_shipping_cost">무료 배송 기준액</label>
							 <input type="text"
								class="form-control" id="free_shipping_cost" name="free_shipping_cost"  required>
						</div>
						
						
						
						<div></div>
						<label></label>
						<br>
						<input type="submit" class="btn btn-primary" style="margin-left:330px; margin-top:50px;" value="회원전환">
					</div>
				</form>
					</div>
				
					
				</div>
				</div>
				
				</section>
</body>
</html>