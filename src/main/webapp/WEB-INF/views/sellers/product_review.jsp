<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
.content_toggle {
	display: none;
}
</style>
<script>
	$(document).ready(function() {

		///$('.content_toggle').hide();
		$('tr.tgl').on('click', function() {
			$(this).next().children().slideToggle("fast");

			/* 		console.log(this);
			 console.log($(this).next().children()); */
		})

	})
</script>
</head>
<body>


	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">상품관련 문의</h1>
		<p class="mb-4">
			구매자로부터 상품에 대한 문의에 답변을 할수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품 문의</h6>
			</div>
			<div class="card-body " style="padding-left: 30px;">

				<div class="table-responsive">


					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
	<thead>
		<tr>
			<th style="width: 50px"><input type="checkbox" id="all"></th>
			<th>주문번호</th>
			<th>상품번호</th>
			<th>옵션1 / 옵션2</th>
			<th>내용</th>
			<th>이미지</th>
			<th>별점</th>
			<th>작성날짜</th>
			<th>구매자ID</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach var="i" items="${list}">
			<tr class="tgl">
				<td><input type="checkbox" id="review_no" name="review_no" value="${i.review_no}"></td>
				<td>${i.order_code }</td>
				<td>${i.product_code }</td>
				<td>${i.option1} / ${i.option2 }</td>
			
				<td>${i.review_content}</td>
				<td>${i.review_img} </td>
				<td>${i.review_star}</td>
				<td>${i.review_writedate}</td>
				<td>${i.id}</td>
				</tr>
		<tr class="tgl">
		 <td>dd</td>
		</tr>
		</c:forEach>
	</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

</body>
</html>