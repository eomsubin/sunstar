<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

</script>
</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">1:1 문의 관리</h1>
		<p class="mb-4">
			1:1 문의에 답변할수있습니다. <a target="_blank" href="https://datatables.net">추가
				링크 삽입</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">1:1 문의 관리</h6>
			</div>
			<div class="card-body">
				<!-- 여기 내부만 수정하시면 됩니다  -->
				<table class="table  table-bordered">
					<thead>
						<tr>
							<th scope="col">문의번호</th>
							<th scope="col">카테고리</th>
							<th scope="col">주문번호</th>
							<th scope="col">제목</th>
							<th scope="col">아이디</th>
							<th scope="col">이메일</th>
							<th scope="col">답변상태</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach var="i" items="${mlist}">
							<tr>
								<td>${i.no}</td>
								<td>${i.category}</td>
								<td>${i.order_code}</td>
								<td>${i.title}</td>
								<td>${i.id}</td>
								<td>${i.email}</td>
								<td>답변상태</td>
							</tr>
							<tr>
								<td></td>
								<td>문의 내용</td>
								<td colspan="5">${i.content}</td>
							</tr>


							<tr>
								<td></td>
								<td>답변 입력</td>
								<td colspan="4" class="findtext">
									<div class="form-group">

					<form>
					<input type="hidden" value="${i.no}" >
					<input type="hidden" value="${i.email}">
					<textarea class="form-control" name="answer" id="answer" class="answer">asdf</textarea>
					<input type="submit" value="전송">
					</form>
									</div>
								</td>
								<td>

									<%-- <button type="button" class="sendMailBtn btn btn-info"
										onclick="sendMail('${i.no}','${i.email }') ">답변 전송</button> --%>
								</td>
							</tr>


						</c:forEach>

					</tbody>
				</table>


				<!-- 여기 내부만 수정하시면 됩니다  -->
			</div>
		</div>
	</div>
</body>
</html>