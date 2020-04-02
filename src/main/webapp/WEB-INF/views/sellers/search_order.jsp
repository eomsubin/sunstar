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
$(document).ready(function() {

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
		
	//수정버튼 클릭 했을때
$('#order_update').on('click', function(){
	
	//버튼 삭제하고 새로운 버튼 추가
	$('#order_update').remove();
	$('#order_update_div').append('<input type="submit" style="padding:3px;" class="btn btn-info" value="완료">');


	// 운송장번호
	$('#tracking_no').empty();
	$('#tracking_no').append('<input type="text" name="tracking_no" value="${dto.tracking_no}">');

	//받는사람 
	$('#to_name').empty();
	$('#to_name').append('<input type="text" name="to_name" value="${dto.to_name}">');

	// 우편번호
	$('#shipping_zip').empty();
	$('#shipping_zip').append('<input type="text" name="shipping_zip" value="${dto.shipping_zip}">');

	// 메세지
	$('#message').empty();
	$('#message').append('<textarea id="message" name="message" cols="50">${dto.message}</textarea>');
	
	
	
})	

	/* $('.orderlist_update').on('click',function(){
		
		//$(this).parent().children().remove();
			
		let newbtn = '<input type="submit" value="완료~">';
		$(this).parent().append(newbtn);
		
		
		let addselect = $(this).parent().parent().children().eq(0);
		console.log(addselect);
		
		let d_s = '<input type="hidden" name="order_code" value="${i.order_code}">'; 
		d_s+='	<select class="form-control" id="delivery_state" name="delivery_state" >                    ';
		d_s+='	<option value="${i.delivery_state}" selected="selected">${i.delivery_state}</option>    ';
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
				
		$(addselect).append(d_s);
		
	
																	
	}) */
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
				
				
			
				
				<div style="margin:">	<form method="post" id="searchupdate" action="${pageContext.request.contextPath}/seller/search_order_update" >
				<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" />
					<table class="table table-bordered">
				
						<thead>
							<tr style="background-color: #ededed;">
								<th style="text-align: center;" scope="col" colspan="2">주문번호</th>
								<th style="text-align: center;" scope="col"  colspan="3">${dto.order_code}</th>
								<th  style="text-align: center;" scope="col"  >
								
								<div id="order_update_div">
									<button id="order_update"  style="padding:3px;" class="btn btn-info">수정</button>
								</div>
								</th>
								
							</tr>
						</thead>
						<tbody>
							<tr>
								<td align="center">배송사</td>
								<td align="center"  colspan="2">${dto.shipping_company}</td>
								<td align="center">운송장번호</td>
								<td colspan="2" id="tracking_no" align="center">${dto.tracking_no }</td>
								
							</tr>

							<tr>
								<td scope="row" colspan="6" align="center"
									style="background-color: #ededed;"><b>배송지</b></td>
							</tr>
							<tr>
								<td align="center">받으시는분</td>
								<td  colspan="2" id="to_name" align="center">${dto.to_name}</td>
								<td align="center">우편번호</td>
								<td colspan="2" id="shipping_zip" align="center">${dto.shipping_zip}</td>
							</tr>
							<tr>
								<td align="center">배송 주소</td>
								<td id="shipping_addr1" align="center" colspan="5">${dto.shipping_addr1}${dto.shipping_addr2}
									${dto.shipping_addr3}</td>

							</tr>
							
							<tr>
								<td align="center">배송 메세지</td>
								<td id="message" align="center" colspan="5">${dto.message}</td>
							</tr>
							<tr>
								<td scope="row" colspan="6" align="center"
									style="background-color: #ededed;"><b>구매상품 내역</b></td>
							</tr>
			<c:forEach var="i" items="${list}">
							
							<tr style=" border-top: 2px solid silver;">
							<td style="text-align: center;" scope="col">주문상태</td>
							
								<td align="center">상품번호</td>
								<td align="center">상품이름</td>
								<td  colspan="2" align="center">옵션1/옵션2/추금</td>
								<td align="center">수량</td>
							</tr>
								<tr>
									<td id="delivery_state" style="text-align: center;" scope="col">
									
										<div class="f_select">
											
	<%-- <input type="hidden" name="order_code" value="${i.order_code}"> --%>
	<select class="form-control" id="delivery_state" name="delivery_state" >               
		<option value="${i.delivery_state}" selected="selected">${i.delivery_state}</option>   
		<option value="배송준비">배송준비</option>                                                     
		<option value="배송중">배송중</option>                                                       
		<option value="배송완료">배송완료</option>                                                     
		<option value="반품대기">반품대기</option>                                                     
		<option value="반품완료">반품완료</option>                                                     
		<option value="교환요청">교환요청</option>                                                     
		<option value="반송대기">반송대기</option>                                                     
		<option value="반송완료 및 배송준비">반송완료 및 배송준비</option>                                       
		<option value="배송중">배송중</option>                                                       
		<option value="배송 및 교환완료">배송 및 교환완료</option>                                           
		<option value="결제취소(판매자사유)">결제취소(판매자사유)</option>                                      
		<option value="결제취소(구매자사유)">결제취소(구매자사유)</option>                                      
		<option value="결제취소완료">결제취소완료</option>                                                 
	</select>							
			<button type="button" class="orderlist_update" class="btn btn-secondary" style="padding:2px;">수정</button>
						
										</div>
								
								
									</td>
									<td align="center">${i.product_code}</td>
									<td align="center">${i.product_name}</td>
									<td  colspan="2" align="center">${i.option1}/${i.option2} /
										${i.add_price}</td>
									<td align="center">${i.quantity}///${i.price}</td>
								</tr>
								
							
				<c:if test="${i.refund_bank != null}">
				
						<tr  style="background-color: #e4e4fe;">
							<td  align="center"><b> 특이사항</b><br>(교환/환불/취소)</td>
								<td align="center">환불 계좌 은행</td>
								<td id="to_name" align="center">${i.refund_bank}</td>
								<td align="center">계좌번호</td>
								<td colspan="2" id="shipping_zip" align="center">${i.refund_account}</td>
						</tr>
						<tr  style="background-color: #e4e4fe; border-top: 2px solid #cbcbfb">
						<td align="center"><b>교환/환불/취소 사유</b></td>
								<td id="shipping_addr1" align="center" colspan="5">${i.refund_msg } </td>
						</tr>
				
				
				</c:if>
			</c:forEach>
							<tr>
								<td align="center">배송비</td>
								<td align="center">${dto.basic_shipping_cost}</td>
								<td align="center"><b>총금액</b></td>
								<td colspan="2" lign="center"><b>${dto.price}</b></td>
							</tr>
							
							
							
				<c:forEach var="a" items="${list}">
							
							
							
							
				</c:forEach>			
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>