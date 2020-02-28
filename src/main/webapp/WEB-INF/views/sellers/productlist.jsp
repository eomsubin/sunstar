<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
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
			상품을 일괄 변경 및 삭제 할 수 있습니다.
			<a target="_blank" href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<!-- 	<button type="button" id="btnaddinventory" class="btn btn-primary">선택 재고 추가</button> -->
						<button type="button" id="btns" class="btn btn-secondary"></button>
						<button type="button" id="btnupdate"class="btn btn-success">선택 수정</button>
						<button type="button"  class="btn btn-danger">선택 삭제</button>
						<!-- id="btndelete" -->
						
						
						<!-- update inventory Button trigger modal -->
						<button type="button" id="btnupdateinventorymodal" class="btn btn-primary">
						  재고 추가 모달 테스트
						</button>
						
						
						<!-- update Modal -->
				        <form>
						
						<div class="modal fade" id="updateinventorymodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						        <button type="button" class="btn btn-primary" id="btnupdateinventory"  onclick="uptest()"> 버트니다 </button>
						        
						        
						      </div>
						    </div>
						  </div>
						</div>
						
						</form>
						
						<!-- delete Button trigger modal -->
						<button type="button" id="btndeletemodal"class="btn btn-danger" > <!-- data-toggle="modal" data-target="#exampleModal" -->
						     삭제 모달 테스트
						</button>
						
						<!-- delete Modal -->
						<div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"> 경 고 </h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      	 <div>
						      	 	경고!! <br>
						      	 	상품코드가 같은 상품은 모두 삭제됩니다.<br><br>
						      	 	옵션만 삭제할 경우 ㅇㅇㅇ에서 삭제를 실행해주세요<br>
						        	선택한 상품을 정말로 삭제하시겠습니까?
					        	</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						        <button type="button" class="btn btn-primary" id="btndelete">삭제</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="width:50px"><input type="checkbox" id="all"></th>
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
								
								<c:forEach var="i" items="${plist}">
									<tr>
										<td><input type="checkbox" id="pcode" name="pcode"
											value="${i.product_code}"></td>
										<td>${i.product_code }</td>
										<td>${i.product_name}</td>
										<td>${i.price}</td>
										<td>${i.cost}</td>
										<td>${i.shipping_cost}</td>
										<td style="border-left: 2px solid silver">${i.color }</td>
										<td>${i.size }</td>
										<td>${i.inventory }</td>
										<td style="border-right: 2px solid silver;">
											${i.add_price }</td>

										<td>${i.lv1}-${i.lv2}-${i.lv3}</td>
										<td>${i.public_state}</td>
										<td>${i.review_state}</td>
										<td class="center">
										
										<a class="btn btn-success" href="#">
<img src="http://localhost:8080/controller/resources/icons/search.svg" alt="" width="20" height="20" title="Bootstrap">
										

										</a> <a class="btn btn-info" href="#"> 
<img src="http://localhost:8080/controller/resources/icons/pencil.svg" alt="" width="20" height="20" title="Bootstrap">
										
										</a> <a class="btn btn-danger" href="#"> 
<img src="http://localhost:8080/controller/resources/icons/trash-fill.svg" alt="" width="20" height="20" title="Bootstrap">
										
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
				</div>
			</div>
		</div>
	</div>

</body>
</html>