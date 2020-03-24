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
								<th>문의번호</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>답변상태</th>
								<th>구매자ID</th>
								<th>상품코드</th>
								<th>작성일</th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="i" items="${list}">
								<tr class="tgl">
									<td><label for="ordercode"></label> <input type="checkbox"
										id="qna_no" name="qna_no" value="${i.qna_no}"></td>

									<td>${i.qna_no }</td>
									<td>${i.qna_title }</td>
									<td>${i.qna_attatch }</td>
									<c:if test="${i.qna_state == '답변대기'}">
										<td style="color: red; font-weight: 700;">${i.qna_state }</td>
									</c:if>
									<c:if test="${i.qna_state == '답변완료'}">
										<td>${i.qna_state }</td>
									</c:if>

									<td>${i.id }</td>
									<td><a
										href="${pageContext.request.contextPath}/detailview2?product_code=${i.product_code }">${i.product_code }
									</a></td>
									<td>${i.write_date}</td>
								</tr>

								<c:if test="${i.qna_state == '답변대기'}">
									<tr>
										<td colspan="8" rowspan="1" class="content_toggle"><br>
											${i.qna_content } <br> <br>
											<form method="post"
												action="${pageContext.request.contextPath}/seller/qna_reply">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" /> <input type="hidden"
													name="qna_no" " value="${i.qna_no}">
												<textarea rows="3" cols="60" placeholder="이곳에 답변을 입력해주세요." class="form-control"
													name="qna_reply"></textarea>
												<br> <input type="submit" class="btn btn-primary"
													value="답변완료"> <input type="reset"
													class="btn btn-secondary" value="취소">
											</form></td>

									</tr>
								</c:if>
								<c:if test="${i.qna_state == '답변완료'}">
									<tr>
										<td colspan="8" rowspan="1" class="content_toggle"><br>
											${i.qna_content } <br> <br> 
											<form method="post"
												action="${pageContext.request.contextPath}/seller/qna_reply_del">
												<input type="hidden" name="${_csrf.parameterName}"
													value="${_csrf.token}" /> <input type="hidden"
													name="qna_no" " value="${i.qna_no}">
											<textarea rows="3" class="form-control"
												cols="60" readonly="readonly"> ${i.qna_reply}</textarea>
												<br>
<input type="submit" class="btn btn-danger" value="삭제">
<br>											
											</form></td>
									</tr>

								</c:if>

							</c:forEach>





						</tbody>
					</table>
				</div>

			</div>
		</div>
	</div>

</body>
</html>