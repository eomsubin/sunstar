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
</style>

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
								class="form-control" id="inputEmail4" value="${dto.seller_code}" readonly="readonly">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">아이디</label> <input type="text"
								class="form-control" id="inputPassword4" value="${dto.id}" readonly="readonly">
						</div>

						<div class="col-md-4 mb-3">
							<label for="validationDefault01">업체명</label> <input type="text"
								class="form-control" id="validationDefault01"
								value="${dto.seller_name}" readonly="readonly" required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">전화번호</label> <input type="text"
								class="form-control" id="validationDefault02"
								value="${dto.seller_tel}" required>
						</div>
						<div class="col-md-4 mb-3">
							<label for="validationDefault02">이메일</label> <input type="text"
								class="form-control" id="validationDefault02"
								value="${dto.seller_email}" required>
						</div>
						<div class="col-md-9">
							<label for="validationDefault03">주소</label> <input type="text"
								class="form-control" id="validationDefault03"
								value="${dto.seller_addr}" required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">우편번호</label> <input type="text"
								class="form-control" id="validationDefault05"
								value="${dto.seller_zip}" required>
						</div>
						<div class="col-md-3 mb-1">
							<label for="validationDefault05">은행</label>
								
						<select class="form-control" id="validationDefault05"
								required>>
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
								class="form-control" id="validationDefault03"
								value="${dto.bank_no}" required>
						</div>
						
						<div class="form-group col-md-6">
							<label for="inputEmail4">사업자 등록번호</label> <input type="text"
								class="form-control" id="inputEmail4" readonly="readonly" 
								value="${dto.business_license}">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">판매기한
							
				<input type="button" class="btn btn-info" value="연장" style="font-size:0.66em; padding:2px 4px 1px 3px; margin: 0 !important;">
						
							</label> 
							
							<input type="date"
								class="form-control" id="inputPassword4"
								value="${dto.seller_deadline}">
						</div>
						<button type="submit" class="btn btn-primary">Sign in</button>

					</div>
				</form>
				<!-- 내용 끝 -->
			</div>
		</div>
	</div>
</body>
</html>