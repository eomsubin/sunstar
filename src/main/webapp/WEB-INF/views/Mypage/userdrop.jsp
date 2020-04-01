<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
</head>
<body>
	<section class="product-area shop-sidebar shop section">
	<div class="user-title">
			<h3> 회원탈퇴 안내</h3>
			</div>
	<div class="container">
			<div class="row">
			
				
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
		
				<div style="margin-left: 7%;">
				<pre>	회원님께서 메일 수신 및 기타 개인정보 등에 대한 불편으로 회원 탈퇴를 원하신다면,
			아래의 방법으로 불편사항을 해결 하실 수 있습니다.
				
		 저희 쓰비제는 고객센터(1599-0110)를 365일 24시간 운영하고 있습니다.
	서비스 이용 중 불편사항은 언제든지 연락 주시면, 최선을 다해 해결 되도록 노력하겠습니다.

		  *회원 탈퇴 시 회원님께서 보유하셨던 비현금성 포인트와 마일리지, 
	   		   칩/쿠폰, 회원정보, 거래정보 등은 모두 삭제 됩니다.
	   		 
		  *회원 탈퇴 후 1개월동안(셀러의 경우 2개월) 회원의 성명,
	 	        주민등록번호(또는 CI), DI, 아이디(ID),비밀번호(Password),
	 	         이메일(E-mail), 연락처 정보를 보관 하며, 로그기록, 
	 	        접속아이피(IP)정보는 12개월간 보관합니다. 거래 정보가 있는 경우,
		  판매 거래 정보관리를 위하여 구매와 관련된 상품정보, 아이디, 
	 	    거래 내역 등에 대한 기본정보는 탈퇴 후 5년간 보관합니다.
		  *회원 탈퇴 후 재가입 시에는 신규 회원 가입으로 처리되며, 
			탈퇴 전의 회원정보와 거래정보 및 포인트, 마일리지,
		 	칩, 쿠폰 정보등은 복구되지 않습니다.

	
	</pre>
				</div>
				
		</div>
		</div>
		</section>

</body>
</html>