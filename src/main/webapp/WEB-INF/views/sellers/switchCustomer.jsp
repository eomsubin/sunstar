<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


<script>
	function gotoorders() {
		location.href = "${pageContext.request.contextPath}/seller/orders";
	}
	function gotocustomer() {
		location.href = "${pageContext.request.contextPath}/seller/real_switch_customer";
	}
</script>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">구매자 계정으로 전환</h1>
		<p class="mb-4">
			판매자 권한을 해지하고 구매자 계정으로 전환합니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">구매자 계정 전환</h6>
			</div>
			<div class="card-body">

			<div>
				<c:if test="${!empty order_codes }">
				${order_codes}
				<div>
				<button class=" btn btn-primary" onclick="gotoorders()">주문목록 확인</button></div>
				</c:if>

				<c:if test="${empty order_codes }">
				${order_codes}
				<div>
				<button  class="btn btn-danger" onclick="gotocustomer()">모든 상품 및 판매자로서의 권한을 삭제합니다.</button></div>
				</c:if>
			</div>
			</div>
		</div>
	</div>
</body>
</html>