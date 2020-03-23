<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

$(document).ready(function(){
	
	let colname = new Array();
	let newvalues = new Array();
	
	//폼에 변화가 생기면
	$('.form-control').on('change', function(){
		console.log('move!');
		
		//굵은 테두리 css 추가
		$(this).addClass('change-border');

		//name이 뭔지 파악하고
		let name = $(this).attr('name');
		let value = $(this).text($('input').attr('name')).val();
		
		console.log(name);
		console.log(value);

		colname.push(name);
		newvalues.push(value);		
	})
	
	$('#changeInfo').on('click', function(){
		

		console.log(colname);
		console.log(newvalues);
		location.href = "${pageContext.request.contextPath}/seller/changeInfo/"+colname+ "/"+newvalues;
	})
	
})


	
</Script>
<script>

function changeInfo(){
	
	location.href = "${pageContext.request.contextPath}/seller/changeInfo/"+colname+ "/"+newvalues;
}

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
				<form>
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
						<div class="col-md-9">
							<label for="validationDefault03">주소</label> <input type="text" 
								class="form-control" id="seller_addr" name="seller_addr"
								value="${dto.seller_addr}" required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">우편번호</label> <input type="text"
								class="form-control" id="seller_zip" name="seller_zip"
								value="${dto.seller_zip}" required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">은행</label>
								
						<select class="form-control" id="bank" name="bank"
								required>
								<option value="${dto.bank} selected="selected"> ${dto.bank}</option>
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
        <h5 class="modal-title" id="staticBackdropLabel">파일 보내기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="${pageContext.request.contextPath}/seller/deadline" method="post" >
  <div class="form-group">
    <label for="deadline_file">파일첨부</label>
    <input type="file" class="form-control" name="deadline_file" id="deadline_file" aria-describedby="emailHelp">
  </div>
  <div class="form-group">
    <label for="deadline">날짜 확인</label>
    <input type="date" class="form-control" name="deadline" id="deadline">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">이용 약관에 동의합니다.</label>
  </div>
  <button type="submit" class="btn btn-primary">보내기</button>
</form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">보내기</button>
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
						<button type="button" id="changeInfo" class="btn btn-primary" style="margin-top: 10px; margin-left: 5px;">정보 업데이트</button>
						<div class="col-sm-10" style="text-align: left;top:25px; ">
							<a href="#"> 업체 관련 정보 변경이 아닌 [회원 정보]를 변경 하시려면 여기를 클릭하세요 </a>

						</div>

					</div>
				</form>
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>