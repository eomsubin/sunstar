<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">

<style>
.inputsearch {
	display: inline-block;
}
</style>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function(){
		
		
		$('dataTable').DataTable();
	
		$('#all').on('click', function(){
			if($('#all').prop('checked')){
				$('input[type=checkbox]').prop('checked',true);
			}else{
				$('input[type=checkbox]').prop('checked',false);
			}
		})
		
		$('#btnupdateinventorymodal').on('click', function(){
			$('#updateinventorymodal').modal();
		})
		
		
		
//	$('#btnupdateinventory').on('click', function(){
	//		$("input[name=pcode]:checked").each(function(index) {
		//	$('input[type=checkbox]:checked').each(function(index){
				
		//		console.log(index);
				
				
			/* 	console.log($('select option:selected').val());
				
			
				
					/* 
				console.log($('select[name=gesu]')); */
				//$('select[name=gesu]').val();
				/* console.log(gesu); */
	///			let gesu = $('select option:selected').val()
	//			let pcode = $(this).val();
	//			console.log(pcode);
			//	location.href="${pageContext.request.contextPath}/updateinventory/"+pcode+"/"+gesu;
				/* /"+gesu */
		//	})
		
	//	})
		
 		$('#btndeletemodal').on('click', function(){
			$('#deletemodal').modal();
		}) 
		$('#btndelete').on('click', function(){
			$("input[name=pcode]:checked").each(function() {

				var pcode = $(this).val();
				console.log(pcode);
				location.href="${pageContext.request.contextPath}/deleteproduct/"+pcode;

			});
		})
		
		$('#changeSizePerPage').on('change', function(){
		console.log('move!');
		
		let value = $('#changeSizePerPage option:selected').val();
		
		console.log(value);
		
		location.href="${pageContext.request.contextPath}/productlist?value="+value;
		
	})
		
	})

</script>
<script>

function uptest(){
	let ckbox = document.getElementsByName("pcode");
	let ckboxlengh = ckbox.length;
	let checked=0;
	
	for(i=0; i<ckboxlengh;i++){
		if(ckbox[i].checked==true){
			let pcode = ckbox[i].value;
			
			console.log(ckbox[i].value);
			checked +=1;
			
			location.href="${pageContext.request.contextPath}/updateinventory/"+pcode+"/"+3;
		}	
	}
}


function changePublicState(state) {
	let changePublicState = state;
	let ckbox = document.getElementsByName("pcode");
	let ckboxlengh = ckbox.length;
	let checked = 0;

	let pcodes = new Array();

	for (i = 0; i < ckboxlengh; i++) {
		if (ckbox[i].checked == true) {
			let pcode = ckbox[i].value;

			pcodes.push(pcode);
			console.log(ckbox[i].value);
			checked += 1;
		}
	}
	console.log("--state--");
	console.log(pcodes);
	console.log("+state++");

	location.href = "${pageContext.request.contextPath}/changePublicState/"+changePublicState+ "/"+pcodes;
}

function productallprint(){
	location.href= "${pageContext.request.contextPath}/productExcel/";
	
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
		<h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
		<p class="mb-4">
			상품을 일괄 변경 및 삭제 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">판매자 =</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<!-- 	<button type="button" id="btnaddinventory" class="btn btn-primary">선택 재고 추가</button> -->

						<div class="btn-group">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">선택상품 공개 비공개</button>
							<div class="dropdown-menu">

								<a class="dropdown-item"
									onclick="changePublicState('publicStateTrue')">상품 공개</a> <a
									class="dropdown-item"
									onclick="changePublicState('publicStateFalse')">상품 비공개</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item"
									onclick="changePublicState('reviewStateTrue')">리뷰 공개</a> <a
									class="dropdown-item"
									onclick="changePublicState('reviewStateFalse')">리뷰 비공개</a> 


							</div>
						</div>

						<button type="button" id="all_print" class="btn btn-secondary"
							onclick="productallprint()">전체출력</button>


						<button type="button" id="btnupdate" class="btn btn-success">선택
							수정</button>
						<button type="button" class="btn btn-danger">선택 삭제</button>
						<!-- id="btndelete" -->


						<!-- update inventory Button trigger modal -->
						<button type="button" id="btnupdateinventorymodal"
							class="btn btn-primary">재고 추가 모달 테스트</button>


						<div class="col-md-10" style="margin: 20px 0px;">
							<select class="custom-select col-md-4" id="changeSizePerPage">
								<option selected disabled value="10">표시 건수</option>
								<option value="10">10</option>
								<option value="30">30</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="all">전체</option>
							</select>
					
								
							<div class="inputsearch" >
								
								<input class="form-control col-md-12 " type="search" placeholder="Search"
									aria-label="Search"  style="position: relative; top:2px;">
							</div>
									
							<div class="inputsearch">
								<button class="btn btn-outline-success    col-md-14 "
									type="submit">Search</button>
							</div>
						<!-- update Modal -->
	</div>

						
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
						<button type="button" id="btndeletemodal" class="btn btn-danger">
							<!-- data-toggle="modal" data-target="#exampleModal" -->
							삭제 모달 테스트
						</button>
						

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
											경고!! <br> 상품코드가 같은 상품은 모두 삭제됩니다.<br>
											<br> 옵션만 삭제할 경우 ㅇㅇㅇ에서 삭제를 실행해주세요<br> 선택한 상품을 정말로
											삭제하시겠습니까?
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
									<th>상품코드</th>
									<th>상품이름</th>
									<th>가격</th>
									<th>원가</th>
									<th>배송비</th>
									<th style="border-left: 2px solid silver">컬러</th>
									<th>사이즈</th>
									<th>재고</th>
									<th style="border-right: 2px solid silver;">추가 가격</th>
									<th>카테고리</th>
									<th>공개여부</th>
									<th>리뷰공개여부</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="i" items="${list}">
									<tr>
										<td><input type="checkbox" id="pcode" name="pcode"
											value="${i.product_code}"></td>
										<td>${i.product_code }</td>
										<td>${i.product_name}</td>
										<td>${i.price}</td>
										<td>${i.cost}</td>
										<td>${i.shipping_cost}</td>
										<td style="border-left: 2px solid silver">${i.option1 }</td>
										<td>${i.option2 }</td>
										<td>${i.inventory }</td>
										<td style="border-right: 2px solid silver;">
											${i.add_price }</td>

										<td>${i.lv1}-${i.lv2}-${i.lv3}</td>

										<c:if test="${ i.public_state } == true">
											공개
										</c:if>

										<td><c:if test="${ i.public_state  == true}">
											공개
										</c:if> <c:if test="${ i.public_state  != true}">
											 비공개
										</c:if></td>
										<td><c:if test="${ i.review_state  == true}">
											공개
										</c:if> <c:if test="${ i.review_state  != true}">
											 비공개
										</c:if></td>
										<td class="center"><a class="btn btn-success" href="#">
												<img
												src="http://localhost:8080/controller/resources/icons/search.svg"
												alt="" width="20" height="20" title="Bootstrap">


										</a> <a class="btn btn-info" href="#"> <img
												src="http://localhost:8080/controller/resources/icons/pencil.svg"
												alt="" width="20" height="20" title="Bootstrap">

										</a> <a class="btn btn-danger" href="#"> <img
												src="http://localhost:8080/controller/resources/icons/trash-fill.svg"
												alt="" width="20" height="20" title="Bootstrap">

										</a></td>
										<%-- 			<c:forEach var="opt" items="${i.options }" >
								<td> ${opt.color}  </td>
								<td> ${opt.size}  </td>
								<td> ${opt.inventory }</td>
								<td> ${opt.add_price }</td>
							</c:forEach>  --%>
									</tr>
								</c:forEach>



							</tbody>
						</table>
					</form>

					<c:if test="${page.prev}">
						<a
							href="productlist?currPage=${page.startBlock-1}&category=${page.categori}&txt=${page.txt}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${page.startBlock}"
						end="${page.endBlock}">
						<c:if test="${i == page.currPage}">
		${i}
		</c:if>
						<c:if test="${i != page.currPage }">
							<a
								href="productlist?currPage=${i}&category=${page.categori}&txt=${page.txt}">${i}</a>
						</c:if>
					</c:forEach>


					<c:if test="${page.next}">
						<a
							href="productlist?currPage=${page.endBlock+1}&category=${page.categori}&txt=${page.txt}">다음</a>
					</c:if>

				</div>
			</div>
		</div>
	</div>

</body>
</html>