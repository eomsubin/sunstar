<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/notice.css" />
<title>SBBJ - 공지사항</title>
</head>
<body>			
				<div class="col-sm-9">

					<h5 class="notice pt-4 pb-4">공지사항</h5>
				
					<div id="notice">
						<table class="table table-hover">
							<colgroup>
								<col width="7%;">
								<col width="13%;">
								<col width="*">
								<col width="20%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">공지분류</th>
									<th scope="col" class="lefttext">제목</th>
									<th scope="col">공지일자</th>
								</tr>
							</thead>
							<tbody>
								
								<c:forEach var="noticelist" items="${noticeList }">
								<tr>
									<th scope="row">${noticelist.notice_no}</th>
									<td>${noticelist.notice_category}</td>
									<td class="lefttext">${noticelist.notice_title}</td>
									<td>${noticelist.notice_date}</td>
								</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
					
					<hr class="my-4">
					
					<nav class="navbar" style="width: 50%; margin: 0px auto;">
					<div class="input-group p-2">
						<input type="text" class="form-control" aria-label="Example text with button addon" aria-describedby="button-addon1">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button">검색</button>
						</div>
					</div>
					</nav>
				</div>
</body>
</html>