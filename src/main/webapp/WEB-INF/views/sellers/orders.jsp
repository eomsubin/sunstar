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
.btnabs {
	position: absolute;
	margin-left: 3px;
}

.newtrackingbtn {
	display: none;
}
</style>
<script>
	$(document).ready(function() {
		$('#all').on('click', function() {
			if ($('#all').prop('checked')) {
				$('input[type=checkbox]').prop('checked', true);
			} else {
				$('input[type=checkbox]').prop('checked', false);
			}
		});

						$('#btnupdateinventorymodal').on('click', function() {
							$('#updateinventorymodal').modal();
						})

						$('#btndeletemodal').on('click', function() {
							$('#deletemodal').modal();
						})
		$('#btndelete').on('click', function() {
			$("input[name=pcode]:checked").each(function() {
				var pcode = $(this).val();
				console.log(pcode);
				location.href = "${pageContext.request.contextPath}/seller/deleteproduct/"+ pcode;
		});
});

						//운송장입력 버튼을 누르면, 체크한 상품들의 운송장 번호를 
$('.trackingbtn').on('click', function() {
	let items = new Array();
	$('.trackingbtn').hide();
	$('.newtrackingbtn').show();

	$('input:checkbox[name="order_no"]:checked').each( function(item) {
		let checked_items = $(this).val();
	
		let trc = $(this).parent().parent().find('td').eq(14);
	
		console
				.log($(
						this)
						.parent()
						.parent()
						.find(
								'td')
						.eq(
								13)
						.text());

										trc.empty();
										trc
												.append('<input type="text" name="tracking_no">');
										items
												.push(checked_items);
									});

				})

						/*  */
						genRowspan("td .ocode");
						function genRowspan(className) {
							$('.ocode').each(
									function() {
										var rows = $(".ocode:contains('"+ $(this).text() + "')");

										if (rows.length > 1) {
											rows.eq(0).attr("rowspan", rows.length);//중복되는 첫번째 td에 rowspan값 세팅 
											rows.not(":eq(0)").remove();//중복되는 td를 삭제 
										}
									});

						}

						/*  */
					})
</script>
<script>
	function allprint() {
		let state = 'all';
		location.href = "${pageContext.request.contextPath}/seller/orderexcel/"
				+ state;
	}

	function shippingprint() {
		let state = 'shipping_list';
		location.href = "${pageContext.request.contextPath}/seller/orderexcel/"
				+ state;
	}

	function checkprint() {
		let ckbox = document.getElementsByName("order_no");
		let ckboxlengh = ckbox.length;
		let checked = 0;

		let state = new Array();

		for (i = 0; i < ckboxlengh; i++) {
			if (ckbox[i].checked == true) {
				let ocode = ckbox[i].value;

				state.push(ocode);
				console.log(ckbox[i].value);
				checked += 1;
			}
		}
		console.log("--state--");
		console.log(state);
		console.log("+state++");

		location.href = "${pageContext.request.contextPath}/seller/orderexcel/" + state;
	}

	function changeStep(step) {
		let stp = step;
		let ckbox = document.getElementsByName("order_no");
		let ckboxlengh = ckbox.length;
		let checked = 0;

		let wantChangeOrderNo = new Array();

		for (i = 0; i < ckboxlengh; i++) {
			if (ckbox[i].checked == true) {
				let ocode = ckbox[i].value;

				wantChangeOrderNo.push(ocode);
				console.log(ckbox[i].value);
				checked += 1;
			}
		}
		console.log("--변경할주문번호--");
		console.log(wantChangeOrderNo);
		console.log("++step++");
		console.log(stp);
		location.href = "${pageContext.request.contextPath}/seller/change_step/" + stp + "/" + wantChangeOrderNo;
	}

	function viewStep(step){
		let stp = step;
		
		location.href = "${pageContext.request.contextPath}/seller/view_step/" + stp
	}
	
	function arrr() {

		let ckbox = document.getElementsByName("order_no");
		let tracking = document.getElementsByName("tracking_no");
		let ckboxlengh = ckbox.length;
		let checked = 0;

		console.log(tracking.length);
		console.log("length", ckboxlengh);

		let codes = new Array();
		let trackings = new Array();

		let i = 0;
		let j = 1;
		let ono = '';
		let tnum = '';
		let count = 0;

		
		while (i < ckboxlengh) {
			if (ckbox[i].checked == true) {
				ono = ckbox[i].value;
				codes.push(ono);
				count++; //체크박스가 true 인 갯수
				tnum = tracking[count - 1].value;
				trackings.push(tnum);
			}
			i++;
		}
		console.log("ono", ono);
		console.log("trackings", trackings);

		location.href = "${pageContext.request.contextPath}/seller/updateTracking/" + codes + "/" + trackings;
	}
</script>

<style>
body {
	font-size: 0.77em;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">주문 목록</h1>
		<p class="mb-4">
			주문 요청을 확인 할 수 있습니다. <a target="_blank" href="https://datatables.net">자세한
				안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">주문 리스트</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form method="post" id="trac"
						action="${pageContext.request.contextPath}/seller/updateTracking">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<!-- 	<button type="button" id="btnaddinventory" class="btn btn-primary">선택 재고 추가</button> -->
						<!-- 특정 '배송상태'만 프린트 / 선택  프린트 / 선택 단계 변경  / -->
						<button type="button" id="shipping_print" class="btn btn-success"
							onclick="shippingprint()")>배송대기 출력</button>
						<button type="button" id="all_print" class="btn btn-secondary"
							onclick="allprint()">전체출력</button>
						<button type="button" id="check_print" class="btn btn-secondary"
							onclick="checkprint()">선택 출력</button>

						<button type="button" class="btn btn-danger">임시</button>
						<!-- id="btndelete" -->

				
										<div class="btn-group">
				
						<!-- Example single danger button -->
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">단계별 리스트</button>
						<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/seller/orders" class="dropdown-item" >전체보기</a>
						
							<div class="dropdown-divider"></div>
						
						<a class="dropdown-item" onclick="viewStep('step1')">결제대기중</a> 
						<a class="dropdown-item" onclick="viewStep('step2')">결제완료</a> 
							<a class="dropdown-item" onclick="viewStep('step3')">배송준비</a> <a
								class="dropdown-item" onclick="viewStep('step4')">배송중</a> <a
								class="dropdown-item" onclick="viewStep('step5')">배송완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="viewStep('step6')">반품요청</a>
							<a class="dropdown-item" onclick="viewStep('step7')">반품대기</a> <a
								class="dropdown-item" onclick="viewStep('step8')">반품완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="viewStep('step9')">교환요청</a> <a
								class="dropdown-item" onclick="viewStep('step10')">반송대기</a> <a
								class="dropdown-item" onclick="viewStep('step11')">반송완료 및
								배송준비</a> <a class="dropdown-item" onclick="viewStep('step12')">배송중</a>
							<a class="dropdown-item" onclick="viewStep('step13')">배송 및
								교환완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="viewStep('step14')">결제취소 요청(구매자 사유)</a>
							<a class="dropdown-item" onclick="viewStep('step15')">결체취소(판매자사유)</a>
							<a class="dropdown-item" onclick="viewStep('step16')">결제취소 완료</a>
						</div>
				
</div>
						<!-- Example single danger button -->
								<div class="btn-group">
		
						<button type="button" class="btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">선택
							단계 변경</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" onclick="changeStep('step3')">배송준비</a> <a
								class="dropdown-item" onclick="changeStep('step4')">배송중</a> <a
								class="dropdown-item" onclick="changeStep('step5')">배송완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="changeStep('step7')">반품대기</a> <a
								class="dropdown-item" onclick="changeStep('step8')">반품완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="changeStep('step9')">교환요청</a> <a
								class="dropdown-item" onclick="changeStep('step10')">반송대기</a> <a
								class="dropdown-item" onclick="changeStep('step11')">반송완료 및
								배송준비</a> <a class="dropdown-item" onclick="changeStep('step12')">배송중</a>
							<a class="dropdown-item" onclick="changeStep('step13')">배송 및
								교환완료</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" onclick="changeStep('step15')">결체취소(판매자사유)</a>
						</div>
</div>
						<input type="button" class="btnabs trackingbtn btn btn-primary"
							value="선택주문 운송장번호 입력"> <input type="button"
							class="btnabs newtrackingbtn btn btn-primary" value="변경 확정"
							onclick="arrr()">


						<!-- 모달인가? -->
						<!-- 	<button type="button" id="change_state_modal" class="btn btn-primary">선택 단계 변경</button> -->

						<!-- update Modal -->
						<form>

							<div class="modal fade" id="updateinventorymodal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal
												title</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<select name="gesu" id="gesu">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>

											<!--  <input type="text" placehoder="입력하세요"> -->

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary"
												id="btnupdateinventory" onclick="uptest()">버트니다</button>


										</div>
									</div>
								</div>
							</div>

						</form>

						<!-- delete Button trigger modal -->
						<!-- 		<button type="button" id="btndeletemodal" class="btn btn-danger">
							삭제 모달 테스트
						</button> -->

						<!-- delete Modal -->
						<div class="modal fade" id="deletemodal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">경 고</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div>
											경고!! <br> 상품코드가 같은 상품은 모두 삭제됩니다.<br> <br> 옵션만
											삭제할 경우 ㅇㅇㅇ에서 삭제를 실행해주세요<br> 선택한 상품을 정말로 삭제하시겠습니까?
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary" id="btndelete">삭제</button>
									</div>
								</div>
							</div>
						</div>

						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="width: 50px"><input type="checkbox" id="all"></th>



									<th>주문번호</th>
									<th>일련번호</th>
									<th>상품 코드</th>
									<th
										style="border-left: 2px solid silver; border-right: 2px solid silver;">옵션</th>
									<th>구매 수량</th>
									<th>금액</th>
									<th>특이사항</th>
									<th>결제방법</th>
									<th>구매자 이름</th>
									<th>연락처</th>
									<th>배송지</th>
									<th>우편번호</th>

									<th
										style="border-left: 2px solid silver; border-right: 2px solid silver;">주문
										상태</th>
									<th>운송장번호</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="i" items="${orderlist}">
			<tr>
				<td><label for="order_no"></label> <input
					type="checkbox" id="order_no" name="order_no"
					value="${i.order_no}"></td>
					
				<td id="ocode" class="ocode"><a href="${pageContext.request.contextPath}/seller/searchOrderView?search_order=${i.order_code}"> ${i.order_code}</a></td>
				<td id="ono" class="ono">${i.order_no}<input type="hidden" name="ono" id="ono"  ></td>
				<td title="${i.product_name}"><a href="${pageContext.request.contextPath}/detailview2?product_code=${i.product_code}">${i.product_code}</td>
				<td
					style="border-left: 2px solid silver; border-right: 2px solid silver;">${i.option1 }/
					${i.option2 } / ${i.add_price }</td>
				<td>${i.quantity}</td>
				<td>${i.price }</td>
				<td>${i.message }</td>
				<td>${i.order_way}</td>
				<td>${i.to_name}</td>
				<td>${i.tel}</td>
				<td>${i.shipping_addr1}${i.shipping_addr2}
					${i.shipping_addr3}</td>
				<td>${i.shipping_zip }</td>
				<td
					style="border-left: 2px solid silver; border-right: 2px solid silver;">${i.delivery_state }</td>

				<%-- 	<td id="tracking${i.order_code}">${i.tracking_no}</td> --%>

				<td id="ttt">${i.tracking_no}</td>
			</tr>
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