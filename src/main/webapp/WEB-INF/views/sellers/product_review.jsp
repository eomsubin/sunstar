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
		
		$('.review_del').on('click',function(){
			let review_no = $(this).parent().parent().children().eq(0).children().val();
			console.log(review_no);
			
			
			location.href="${pageContext.request.contextPath}/seller/review_del?review_no=" + review_no;
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
			<th>상품번호 (리뷰번호)</th>
			<th>옵션1 / 옵션2</th>
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
				<td class="ocode">${i.order_code }</td>
				<td><a href="${pageContext.request.contextPath}/detailview2?product_code=${i.product_code}">${i.product_code }</a> ( ${i.review_no} )</td>
				<td>${i.option1} / ${i.option2 }</td>
				<td>
					<c:forEach var="img" items="${i.imgdto }" >
						<c:if test="">
						</c:if>
						<p style="font-size: 0.2em;">${img.review_img}</p>
					</c:forEach>
				</td>
				<td>${i.review_star}</td>
				<td>${i.review_writedate}</td>
				<td>${i.id}</td>
				</tr>
		<tr>
		 <td class="content_toggle"><input type="hidden" value="${i.review_no}"></td>
		 <td class="content_toggle ocode">${i.order_code }</td>
		 <td class="content_toggle" colspan="5">${i.review_content }</td>
		 <td class="content_toggle" > <button class="btn btn-danger review_del">삭제</button></td>
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