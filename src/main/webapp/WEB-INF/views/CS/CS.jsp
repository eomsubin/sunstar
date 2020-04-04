<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/customer.css" />
<title>SBBJ - 고객센터 </title>
</head>
<body>
				 <div class="col-sm-9">
					<nav class="navbar navbar-light  bg-light mt-3">
					<div class="input-group p-2">
						<input type="text" class="form-control"
							aria-label="Example text with button addon"
							aria-describedby="button-addon1">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button">검색</button>
						</div>
					</div>
					</nav>

					<hr class="my-4">


					<h5 class="faq pt-4 pb-2">
						자주 묻는 질문 HOT 10 <a
							href="${pageContext.request.contextPath}/faq"> <span>더
								보기 <i class="fas fa-greater-than"></i>
						</span></a>
					</h5>

					<div id="faq">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">분류</th>
									<th scope="col">질문</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>4</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>5</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>6</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>7</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>8</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>9</td>
									<td>Mark</td>
								</tr>
								<tr>
									<td>10</td>
									<td>Mark</td>
								</tr>
							</tbody>
						</table>
					</div>



					<h5 class="notice pt-4 pb-2">
						공지사항 <a href="${pageContext.request.contextPath}/notice"> <span>더
								보기 <i class="fas fa-greater-than"></i>
						</span></a>
					</h5>

					<div id="notice">
						<table class="table table-hover">
							<thead>
								<tr>
									<th scope="col">분류</th>
									<th scope="col">제목</th>
									<th scope="col">작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Mark</td>
									<td>Mark</td>

								</tr>
								<tr>
									<th scope="row">2</th>
									<td>Mark</td>
									<td>Mark</td>

								</tr>
								<tr>
									<th scope="row">3</th>
									<td>Mark</td>
									<td>Mark</td>

								</tr>
								<tr>
									<th scope="row">4</th>
									<td>Mark</td>
									<td>Mark</td>

								</tr>
								<tr>
									<th scope="row">5</th>
									<td>Mark</td>
									<td>Mark</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> 
			<!-- </div>
		</div>
	</div> -->

</body>
</html>