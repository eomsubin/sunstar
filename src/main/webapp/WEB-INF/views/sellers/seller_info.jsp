<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
body {
	font-size: 0.77em;
}

.change-border{

 border: 2px solid #4e73df; 
}

</style>

<script>

let colname = new Array();
let newvalues = new Array();

$(document).ready(function(){
	//폼에 변화가 생기면
	$('.form-control').on('change', function(){
		console.log('move!');
		
		//굵은 테두리 css 추가
		$(this).addClass('change-border');

		//name이 뭔지 파악하고
	/* 	let name = $(this).attr('name');
		let value = $(this).text($('input').attr('name')).val();
		
		console.log(name);
		console.log(value);

		colname.push(name);
		newvalues.push(value);		 */
	})
	
	/* $('#changeInfo').on('click', function(){
		console.log(colname);
		console.log(newvalues);
		location.href = "${pageContext.request.contextPath}/seller/changeInfo/"+colname+ "/"+newvalues;
	}) */
})

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
	
	console.log($('#seller_address1').val(roadAddrPart1));
	console.log($('#seller_address2').val(roadAddrPart2));
	console.log($('#seller_address3').val(addrDetail));
	console.log($('#zip').val(zipNo));
	
	
	colname.push("seller_address1");
	newvalues.push(roadAddrPart1);	
	colname.push("seller_address2");
	newvalues.push(roadAddrPart2);	
	colname.push("seller_address3");
	newvalues.push(addrDetail);	
	colname.push("seller_zip");
	newvalues.push(zipNo);	
};


/* function changeInfo(){
	
	location.href = "${pageContext.request.contextPath}/seller/changeInfo/"+colname+ "/"+newvalues;
}
	 */
</Script>
<script>

$(document).ready(function(){
	
	$('.updateinfo').click(function(){
		event.preventDefault();
		if(telcheck() && bank_no_check()){
			$('form').submit();
		}
	})	
	
	var vnum = /^[0-9]+$/
	function telcheck(){
		if($('#seller_tel').val().length != 11 || !vnum.test($('#seller_tel').val())){
			alert(' - 없이  숫자만 입력해주세요.');
			return false;
		}else{
			return true;
		}	
	}
	
	function bank_no_check(){
		
		if($(!vnum.test($('#bank_no').val())){
			alert(' - 없이  숫자만 입력해주세요.');
			return false;
		}else{
			return true;
		}	
		
	}
})




</script>


</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">정보 확인</h1>
		<p class="mb-4">
			내 정보를 확인하고 수정 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body " style="padding-left: 30px;">

				<!-- 내용 -->
				<form action="${pageContext.request.contextPath}/seller/changeInfo" method="post" name="form">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-row col-md-12">

						<div class="form-group col-md-6">
							<label for="inputEmail4">판매자 코드</label> <input type="text"
								class="form-control" name="seller_code" id="seller_code" value="${dto.seller_code}" readonly="readonly">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">아이디</label> <input type="text"
								class="form-control" name="id" id="id" value="${dto.id}" readonly="readonly">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationDefault01">업체명</label> <input type="text"
								class="form-control" id="seller_name" name="seller_name"
								value="${dto.seller_name}" readonly="readonly" required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">전화번호</label> <input type="text"
								class="form-control" id="seller_tel" name="seller_tel"
								value="${dto.seller_tel}" required>
						</div>
						
						
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">이메일</label> <input type="email"
								class="form-control" id="seller_email" name="seller_email"
								value="${dto.seller_email}" required>
						</div>
						
						<div class="col-md-8">
							<label for="validationDefault03">주소</label> 
							<input type="text" 	class="form-control mb-1" id="seller_address1" name="seller_address1" onclick="goPopup()"
								value="${dto.seller_address1}" required>
								<input type="text" 	class="form-control mb-1" id="seller_address2" name="seller_address2" onclick="goPopup()"
								value="${dto.seller_address2}" required>
								<input type="text" 	class="form-control mb-1" id="seller_address3" name="seller_address3" onclick="goPopup()"
								value="${dto.seller_address3}" required>
						</div>
						
						<div class="col-md-4 mb-1">
							<label for="validationDefault05">우편번호</label> <input type="text"
								class="form-control" id="seller_zip" name="seller_zip"
								value="${dto.seller_zip}" required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">은행</label>
								
						<select class="form-control" id="bank" name="bank"
								required>
								<option selected="selected" value="${dto.bank}" > ${dto.bank}</option>
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
								value="${dto.bank_no}" required>
						</div>
						
						<div class="form-group col-md-6">
							<label for="business_license">사업자 등록번호</label> <input type="text"
								class="form-control" id="business_license" name="business_license" readonly="readonly" 
								value="${dto.business_license}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">판매기한
							
				<input type="button" class="btn btn-info" value="연장" style="font-size:0.66em; padding:2px 4px 1px 3px; margin: 0 !important;"  data-toggle="modal" data-target="#staticBackdrop">


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </div>
  </div>
</div>
						
						
							</label> 
							
							<input type="date"
								class="form-control" id="seller_deadline" name="seller_deadline"
								value="${dto.seller_deadline}">
						</div>
						
						
						<div class="col-md-4">
							<label for="validationDefault05">계약 택배사</label>
								
						<select class="form-control" id="shipping_company" name="shipping_company" >
							<option value="${dto.shipping_company}" selected="selected">현재 - ${dto.shipping_company}</option>
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
								class="form-control" id="basic_shipping_cost" name="basic_shipping_cost" placeholder="${dto.basic_shipping_cost}" >
						</div>
						<div class="col-md-4">
							<label for="free_shipping_cost">무료 배송 기준액</label>
							 <input type="text"
								class="form-control" id="free_shipping_cost" name="free_shipping_cost" placeholder="${dto.free_shipping_cost}" >
						</div>
						
						
						
						<div></div>
						<label></label>
						<br>
						<input type="button" class="btn btn-primary updateinfo" style="margin-top: 10px; margin-left: 5px;" value="정보 업데이트">
						<div class="col" style="text-align:right;top:20px; ">
							<a href="${pageContext.request.contextPath}/mypage/info"> 업체 관련 정보 변경이 아닌 [회원 정보]를 변경 하시려면 여기를 클릭하세요 </a>

						</div>

					</div>
				</form>
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>