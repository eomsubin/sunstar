<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>


</style>

<script>
$(document).ready(function(){
	$('.deposit-btn').on('click', function(){
		let seller_code = $(this).parent().parent().find('td.deposit-seller-code').text();
		let yymm = $(this).parent().parent().find('.deposit-yymm').text();

		location.href="${pageContext.request.contextPath}/admin/accUpdate/"+ seller_code+"/"+yymm;
	})
})

</script>
</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">정산내역 확인</h1>
		<p class="mb-4">
			과거 정산 내역을 확인 하실 수 있습니다. <a target="_blank" href="https://datatables.net">추가 링크 삽입</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">정산내역 확인</h6>
			</div>
			<div class="card-body">
			<!-- 여기 내부만 수정하시면 됩니다  -->
			<table class="table">
				  <thead class="thead-light">

					<tr>
						<th>판매자코드</th>
						<th scope="col">정산월</th>
						<th scope="col">판매금액</th>
						<th scope="col">수수료</th>
						<th scope="col">정산금액</th>
						<th scope="col">은행</th>
						<th scope="col">계좌번호</th>
						<th scope="col">상태</th>
						<th scope="col"></th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="i" items="${alist}">
					<tr>
					<td class="deposit-seller-code">${i.seller_code }</td>
					<td class="deposit-yymm" scope="row">${i.yyyymm}</td>
					
					<td><fmt:formatNumber pattern="###,###,###" value="${i.total_profit}" />원</td>
					<td><fmt:formatNumber pattern="###,###,###" value="${i.commission}" />원</td>
					<td style="color:red;"><fmt:formatNumber pattern="###,###,###" value="${i.balance_accounts}" />원</td>
					<td>${i.bank}</td>
					<td>${i.bank_no }</td>
					
					
					<td>${i.account_state}</td>
					
					<c:if test="${i.account_state == '정산신청중' }" >
					<td><button class="deposit-btn btn btn-primary ">입금</button></td>
					</c:if>
					</tr>
					</c:forEach>
				</tbody>
			
			</table>
			</div>
		</div>
	</div>
</body>
</html>