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
tr td {
	border-collapse: collapse;
	border: 1px solid silver;
}
</style>
<script>
	$(document).ready(
			/* 
			$('.alert').alert(); */
			
			function() {

				$('.search_btn').click(function() {
					event.preventDefault();
					if (search_word()) {
						$('form').submit();
					}
				})

				var vnum = /^[0-9]+$/
				function search_word() {
					if ($('#search_order').val().length == 0	|| !vnum.test($('#search_order').val())) {
						alert('유효한 주문번호를 입력해주세요');
						return false;
					} else {
						return true;
					}
				}
				
	$('#order_update').on('click', function(){
		$('#order_update').remove();
		
		$('#delivery_state').empty();
		
		let d_s = '<input type="hidden" name="order_code" value="${dto.order_code}">'; 
d_s+='	<select class="form-control" id="delivery_state" name="delivery_state" >                    ';
d_s+='	<option value="${dto.delivery_state}" selected="selected">${dto.delivery_state}</option>    ';
d_s+='	<option value="배송준비">배송준비</option>                                                       ';
d_s+='	<option value="배송중">배송중</option>                                                          ';
d_s+='	<option value="배송완료">배송완료</option>                                                      ';
d_s+='	<option value="반품대기">반품대기</option>                                                      ';
d_s+='	<option value="반품완료">반품완료</option>                                                      ';
d_s+='	<option value="교환요청">교환요청</option>                                                      ';
d_s+='	<option value="반송대기">반송대기</option>                                                      ';
d_s+='	<option value="반송완료 및 배송준비">반송완료 및 배송준비</option>                                       ';
d_s+='	<option value="배송중">배송중</option>                                                          ';
d_s+='	<option value="배송 및 교환완료">배송 및 교환완료</option>                                             ';
d_s+='	<option value="결제취소(판매자사유)">결제취소(판매자사유)</option>                                      ';
d_s+='	<option value="결제취소(구매자사유)">결제취소(구매자사유)</option>                                      ';
d_s+='	<option value="결제취소완료">결제취소완료</option>                                                  ';
d_s+='	</select>																					';
		
		$('#delivery_state').append(d_s);
		
		$('#tracking_no').empty();
		$('#tracking_no').append('<input type="text" name="tracking_no" value="${dto.tracking_no}">');

		$('#to_name').empty();
		$('#to_name').append('<input type="text" name="to_name" value="${dto.to_name}">');

		$('#shipping_zip').empty();
		$('#shipping_zip').append('<input type="text" name="shipping_zip" value="${dto.shipping_zip}">');

		$('#message').empty();
		$('#message').append('<textarea id="message" name="message" cols="50">${dto.message}</textarea>');
		
		$('#order_update_div').append('<input type="submit"class="btn btn-info" value="완료">');
		
		
	})			
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

				<div class="alert alert-primary  alert-dismissable show fade"
					role="alert">유효한 주문번호를 입력해주세요 ㅡ화면에 표시되지 않을 경우 주문번호를 한 번 더
					확인해주세요!ㅡ</div>





				<form
					action="${pageContext.request.contextPath}/seller/searchOrderView"
					class="d-none d-sm-inline-block form-inline mr-auto  my-2  mw-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small"
							name="search_order" id="search_order" placeholder="조회 할 주문번호 입력"
							aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary search_btn" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
				
				
			
				
				<div style="margin:">	<form method="post" id="searchupdate" action="${pageContext.request.contextPath}/seller/tq" >
				<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
					<table class="table table-bordered">
				
						<thead>
							<tr style="background-color: #ededed;">
								<th style="text-align: center;" scope="col">주문번호</th>
								<th style="text-align: center;" scope="col">${dto.order_code}</th>
								<th style="text-align: center;" scope="col">주문상태</th>
								<th id="delivery_state" style="text-align: center;" scope="col">${dto.delivery_state}</th>
								<th>	<div id="order_update_div">
					<button id="order_update" class="btn btn-info">수정</button>
				</div>
				</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">배송사</td>
								<td align="center">${dto.shipping_company}</td>
								<td align="center">운송장번호</td>
								<td colspan="2" id="tracking_no" align="center">${dto.tracking_no }</td>
								
							</tr>

							<tr>
								<td scope="row" colspan="5" align="center"
									style="background-color: #ededed;"><b>배송지</b></td>
							</tr>
							<tr>
								<td align="center">받으시는분</td>
								<td id="to_name" align="center">${dto.to_name}</td>
								<td align="center">우편번호</td>
								<td colspan="2" id="shipping_zip" align="center">${dto.shipping_zip}</td>
							</tr>
							<tr>
								<td align="center">배송 주소</td>
								<td id="shipping_addr1" align="center" colspan="4">${dto.shipping_addr1}${dto.shipping_addr2}
									${dto.shipping_addr3}</td>

							</tr>
							
							<tr>
								<td align="center">배송 메세지</td>
								<td id="message" align="center" colspan="4">${dto.message}</td>
							</tr>
							<tr>
								<td scope="row" colspan="5" align="center"
									style="background-color: #ededed;"><b>구매상품 내역</b></td>
							</tr>
							<tr>
								<td align="center">상품번호</td>
								<td align="center">상품이름</td>
								<td  colspan="2" align="center">옵션1/옵션2/추금</td>
								<td align="center">수량</td>
							</tr>
							<c:forEach var="i" items="${list}">

								<tr>
									<td align="center">${i.product_code}</td>
									<td align="center">${i.product_name}</td>
									<td  colspan="2" align="center">${i.option1}/${i.option2} /
										${i.add_price}</td>
									<td align="center">${i.quantity}///${i.price}</td>
								</tr>
							</c:forEach>
							<tr>
								<td align="center">배송비</td>
								<td align="center">${dto.shipping_cost}</td>
								<td align="center"><b>총금액</b></td>
								<td colspan="2" lign="center"><b>${dto.price}</b></td>
							</tr>

						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>