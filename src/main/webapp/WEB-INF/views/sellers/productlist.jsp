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
	})

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
						<button type="button" class="btn btn-primary">선택 재고 추가</button>
						<button type="button" class="btn btn-secondary"></button>
						<button type="button" class="btn btn-success">선택 수정</button>
						<button type="button" class="btn btn-danger">선택 삭제</button>
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
							<tfooter>
								<tr>
									<th>Name</th>
									<th>Position</th>
									<th>Office</th>
									<th>Age</th>
									<th>Start date</th>
									<th>Salary</th>
								</tr>
							</tfoot>

							<tbody>

								<c:forEach var="i" items="${plist}">
									<tr>
										<td><input type="checkbox" id="a" name="empno"
											value="${item.empno}"></td>
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