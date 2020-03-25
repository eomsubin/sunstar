<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
tr td {
	border-collapse: collapse;
	border: 1px solid silver;
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

				<form
					action="${pageContext.request.contextPath}/seller/searchOrderView"
					class="d-none d-sm-inline-block form-inline mr-auto  my-2  mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							name="search_order" id="search_order" placeholder="조회 할 주문번호 입력"
							aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				<div style="margin:">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th scope="col">주문번호</th>
								<th scope="col">${dto.order_code}</th>
								<th scope="col">주문상태</th>
								<th scope="col">${dto.delivery_state}</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>배송사</td>
								<td>${dto.shipping_company}</td>
								<td>운송장번호</td>
								<td>${dto.tracking_no }</td>
							</tr>
							
							<tr>
								<td scope="row" colspan="4" >배송지</td>
							</tr>
							<tr>
								<td>받으시는분</td>
								<td>${dto.to_name}</td>
								<td>우편번호</td>
								<td>${dto.shipping_zip}</td>
							</tr>
							<tr>
								<td>배송 주소</td>
								<td colspan="3">${dto.shipping_addr1} ${dto.shipping_addr2} ${dto.shipping_addr3}</td>
							
							</tr>
							<tr>
								<td scope="row" colspan="4">구매상품 내역</td>
							</tr>
								<tr>
									<td>상품번호</td>
									<td>상품이름</td>
									<td>옵션1/옵션2/추금</td>
									<td>수량</td>
								</tr>
							<c:forEach var="i" items="${list}">
							
								<tr>
									<td>${i.product_code}</td>
									<td>${i.product_name}</td>
									<td>${i.option1} / ${i.option2} / ${i.add_price}</td>
									<td>${i.quantity} /// ${i.price}</td>
								</tr>
							</c:forEach>
							<tr>
								<td>배송비</td>
								<td>${dto.shipping_cost}</td>
								<td>총금액</td>
								<td>${dto.price}</td>
							</tr>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>