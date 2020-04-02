<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">판매자 신청 현황</h1>
		<p class="mb-4">
			<!-- 페이지 설명 <a target="_blank" href="https://datatables.net">추가 링크 삽입</a>. -->
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">판매자 신청 현황</h6>
			</div>
			<div class="card-body">
				<!-- 여기 내부만 수정하시면 됩니다  -->
				<div class="table-responsive">
					<form>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<!-- 
						<button type="button" id="all_print" class="btn btn-secondary"
							onclick="productallprint()">전체출력</button>
 						-->
				<table class="table table-bordered" id="dataTable"
							style="width: 100%;" cellspacing="0">
							<thead>
								<tr>
									<th style="width: 50px"><input type="checkbox" id="all"></th>
									<th>고유번호</th>
									<th>아이디</th>
									<th>업체명</th>
									<th>이메일</th>
									<th style="border-left: 2px solid silver" colspan="3">주소</th>
									<th style="border-right: 2px solid silver;">전화번호</th>
									<th>거래은행</th>
									<th>사업자등록번호</th>
									<th>판매가능기한</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach var="i" items="${list}">
									<tr>
										<td><input type="checkbox" id="pcode" name="pcode" value="${i.seller_code}"></td>
										<td>${i.seller_code}</td>
										<td>${i.id}</td>
										<td>${i.seller_name}</td>
										<td>${i.seller_email}</td>
										<td style="border-left: 2px solid silver" colspan="3">${i.seller_address1}</td>
										<td style="border-right: 2px solid silver;">${i.seller_tel}</td>
										<td>${i.bank}</td>
										<td>${i.business_license}</td>
										<td>${i.seller_deadline}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
										<%-- <td ><a class="btn btn-success detailmdl"
											data-toggle="modal" data-target=".bd-example-modal-lg"> <img
												src="${pageContext.request.contextPath}/resources/icons/search.svg"
												alt="" width="20" height="20" title="Bootstrap"> <img
												src="${pageContext.request.contextPath}/resources/icons/pencil.svg"
												alt="" width="20" height="20" title="Bootstrap">


										</a> <a class="btn btn-danger" href="#"> <img
												src="${pageContext.request.contextPath}/resources/icons/trash-fill.svg"
												alt="" width="20" height="20" title="Bootstrap">
										</a></td> --%>						
					</form>

	<!-- 페이징 -->
					<c:if test="${page.prev}">
						<a href="productlist?currPage=${page.startBlock-1}&psize=${page.sizePerPage}&txt=${page.txt}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${page.startBlock}"
						end="${page.endBlock}">
						<c:if test="${i == page.currPage}"></c:if>
						<c:if test="${i != page.currPage }"><a href="productlist?currPage=${i}&psize=${page.sizePerPage}&txt=${page.txt}"></a></c:if>
					</c:forEach>

					<c:if test="${page.next}">
						<a href="productlist?currPage=${page.endBlock+1}&psize=${page.sizePerPage}&txt=${page.txt}">다음</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>