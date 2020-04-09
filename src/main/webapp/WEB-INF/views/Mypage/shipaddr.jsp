
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
	href="${pageContext.request.contextPath}/resources/css/reset.css">  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">
	
	
<style>
.shipinfo{
	background-color:#FBEFEF;
	position: relative;
	left:110px;
	width:700px;
	padding: 15px;
}
.addbtn{
	text-align:center;
	position: relative;
	left:403px;
	width:700px;
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
$(document).ready(function(){
	$('#shipadd').on('click',function(){
		
		var shipping_addr1= $('#address1').val();
		var shipping_addr2= $('#address2').val();
		var shipping_addr3= $('#address3').val();
		var shipping_zip= $('#zip').val();
		var shipping_name= $('#shipping_name').val();
		var to_name=$('#to_name').val();
		var csrfHeaderName= "${_csrf.headerName}";
		var csrfTokenValue= "${_csrf.token}";
		
		var adddata={ "shipping_addr1": shipping_addr1,
				 "shipping_addr2": shipping_addr2,
				 "shipping_addr3": shipping_addr3,
				 "shipping_zip": shipping_zip,
				 "id": "${info.id}",
				 "shipping_name": shipping_name  ,
				 "to_name": to_name }
			
		console.log(adddata);
		
		 
		
		 $.ajax({
			url:"${pageContext.request.contextPath}/mypage/addshipaddr",
			dataType:"JSON",
			data: JSON.stringify(adddata),
			contentType: "application/json; charset=utf-8",
			type: 'POST',
			beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			},
			success:function(data){
				
			
				location.href="${pageContext.request.contextPath}/mypage/shipaddr";
			},
			error:function(data){
				location.href="${pageContext.request.contextPath}/mypage/shipaddr";
			}
		 });
		
	});
	
	$('#updateship').on('click',function(){
		
		let shipping_name=$('input[name=radiobox]:checked').val();
		console.log(shipping_name);
		
		if(shipping_name==""|| shipping_name==null){
			alert("배송지를 선택해주세요");	
		}else{
		
		location.href= "${pageContext.request.contextPath}/updateShip/"+shipping_name;
		}
		/* 
		let aa=$(this).parent().parent().parent().parent().parent().find('div').eq(7).find('h5').eq(0).text();
		console.log(aa); */
	});
	
	
	
});

function deleteShip(){
	
	
	let shipping_name=$('input[name=radiobox]:checked').val();
	console.log(shipping_name);
	
	if(shipping_name==""|| shipping_name==null){
		alert("배송지를 선택해주세요");	
	}else{
	
		alert("배송지가 삭제되었습니다.")
		location.href="${pageContext.request.contextPath}/deleteship/"+shipping_name;
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
	<section class="product-area shop-sidebar shop section">

		<div class="user-title" >
			<h3> 배송지 관리</h3>
			
			<button type="button" id="btnup"  class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" style="margin-right:23px; margin-top:20px;">배송지 설정</button>
			
		
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
								<li><a href="${pageContext.request.contextPath }/mypage/order">주문/배송내역</a></li>
								<li><a href="${pageContext.request.contextPath }/cartList">장바구니</a>
								<li><a href="${pageContext.request.contextPath }/mypage/info">회원정보 변경</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/shipaddr">배송지관리</a></li>
								<li><a href="${pageContext.request.contextPath }/mypage/seller_register">판매 회원전환</a></li>
									<li><a href="${pageContext.request.contextPath }/CS/inquiry">Q&A</a>
								<li><a href="${pageContext.request.contextPath }/mypage/userdrop">회원탈퇴</a></li>
							</ul>
						</div>
						<!--/ End Single Widget -->
					</div>
				</div>
				<div class="shipinfo">
				<br>
					<h5>${info.name }</h5>
					<br>
					<button type="button"  class="btn btn-secondary">기본 배송지</button>
					<br><br>
					<h5>${info.address1 } ${info.address2 } ${info.address3 } </h5>
					<br><br>
					<h5>${info.tel }</h5>
					
				</div>
				<div class="addbtn">
					<button type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#exampleModalLong">배송지 추가</button>
				</div>
				
				<c:forEach var="slist" items="${slist }">
				
				<div class="shipinfo" style="margin-top:20px; left:403px;">
				 
				<br>
					
				    <input type="radio" name="radiobox" value="${slist.shipping_name }" >
					<h5 class="getshipname">${slist.shipping_name }</h5><h5>(${slist.to_name})</h5>
					<br>
				
				
					<button type="button" class="btn btn-secondary" onclick="deleteShip()">배송지 삭제</button> 
					<br><br>
			
					<h5>${slist.shipping_addr1  } ${slist.shipping_addr2 } ${slist.shipping_addr3  } </h5>
					<br><br>
					<h5>${info.tel}</h5>
					<br>
				</div>
					
					</c:forEach>
				
	






				</div>
				</div>
				</section>
				
				

</body>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document" style="width:600px;">
    <div class="modal-content">
      
      <div class="modal-body" style="max-height: 250px;">
       	 <p style="font-size: 24px; position: relative; padding:10px;top:50px; ">기본 배송지로 변경 하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="updateship">확인</button>
      </div>
    </div>
  </div>
</div>


			<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document" style="width:500px;">
    <div class="modal-content">
      <div class="modal-header">
       
       
      </div>
      <div class="modal-body">
      	<div class="form-group" >
      					<div class="info-form2" style="position: relative; left:20px;">
      						<label>배송지 이름</label>
      						<input type="text" class="form-control" name="shipping_name"
								id="shipping_name" >
      						
      					</div>
      					
      					
      					
      					<div class="info-form2" style="position: relative; left:20px;">
      						<label>받는사람</label>
      						<input type="text" class="form-control" name="to_name"
								id="to_name" >
      						
      					</div>
      					<br>
      					
							<div class="info-form2" style="position: relative; left:20px;">
							 <input type="text" class="form-control" name="zip"
								id="zip"  readonly="readonly" onclick="goPopup();">
							<button type="button"  onclick="goPopup();" style="position: relative; left:330px; bottom:44px;"class="btn btn-secondary btn-lg" >주소 찾기</button>
						</div>
						<div class="form-group" style="width:300px; position: relative; left:20px;">
								 <input type="text" class="form-control" name="address1"
								id="address1"  readonly="readonly" onclick="goPopup();">
						
						</div>
						<div class="form-group" style="width:300px; position: relative; left:20px;">
						 <input type="text" class="form-control" name="address2"
								id="address2"  readonly="readonly" onclick="goPopup();">
						 
						</div>
						  <input type="text" class="form-control" name="address3" style="width:300px; position: relative; left:20px;"
								id="address3"  readonly="readonly" onclick="goPopup();">
					</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="shipadd" >추가</button>
      </div>
    </div>
  </div>
</div>

</html>