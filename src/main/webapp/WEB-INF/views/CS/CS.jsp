<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customer_css/customer.css" />
<script>
	$(document).ready(function() {
		hidecontent();

		function hidecontent() {
			$('.bcontent').hide();
		}

		$('.topcontent').on('click', function() {
			$(this).siblings('.bcontent').hide();
			$(this).next('.bcontent').toggle();
		});

	});
</script>

<title>SBBJ - 고객센터</title>
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
			자주 묻는 질문 HOT 10 <a href="${pageContext.request.contextPath}/faq">
				<span>더보기 <i class="fas fa-greater-than"></i>
			</span>
			</a>
		</h5>
		
		<div id="faq">
			<table class="table table-hover">
				<thead>
					<tr style="text-align: center">
						<th colspan="1">분류</th>
						<th colspan="*" class="lefttext">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="faq" items="${faq}">
						<tr style="text-align: center;" class="topcontent">
							<td>${faq.faq_head}</td>
							<td class="lefttext">${faq.faq_title}</td>
						</tr>
						<tr class="bcontent">
							<td colspan="2">${faq.faq_content}</td>
						</tr>
					</c:forEach>
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
					<tr style="text-align: center">
						<th scope="col">분류</th>
						<th scope="col" class="lefttext">제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${notice}">
						<tr style="text-align: center;" class="topcontent">
							<td>${notice.notice_category}</td>
							<td class="lefttext">${notice.notice_title}</td>
						</tr>
						<tr class="bcontent">
							<td colspan="2">${notice.notice_content}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>