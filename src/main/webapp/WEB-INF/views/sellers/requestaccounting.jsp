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
			<div class="card-body">
			 <c:if test="${dd > 10}">
 			 	<div style="text-align: center;">
				 
					<p>현재는 정산신청 기간이 아닙니다.</p>
					<p><strong>매월 1일부터 10일 사이</strong>에 신청해주세요</p>
				</div>
			
			</c:if>


			 <c:if test="${01 < dd && dd < 11}">
			 <div style="text-align: center;">
			 
				<p>정산신청 기간은 매월 1일부터 10일입니다.</p>
				<p style="color: red; font-size: 1.3em; font-weight: 700;">현재 정산신청 기간입니다.</p>
				<p>아래 항목을 모두 기입 하신 후 신청 해주세요! </p>
			</div>
			
			<!-- 내용 -->

				<form>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label> <input type="email"
								class="form-control" id="inputEmail4">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" id="inputPassword4">
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Address</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="1234 Main St">
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address 2</label> <input type="text"
							class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>...</option>
							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> <input type="text"
								class="form-control" id="inputZip">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me
								out </label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
				<!-- 내용 끝 -->
			</c:if>
				


			</div>
		</div>
	</div>

</body>
</html>