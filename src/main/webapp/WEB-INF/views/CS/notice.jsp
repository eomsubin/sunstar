<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/notice.css" />
<link rel="stylesheet" href="/controller/resources/css/font-awesome.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="/controller/resources/css/themify-icons.css">
<title>SBBJ</title>
</head>
<body>
	<header>
		<jsp:include page="../Registration/Regheader.jsp" />
	</header>
	<div class="container p-0">
	
		<div id="contenttop">
			<ul class="headnav nav nav-pills nav-fill">
				<li class="nav-item col-sm-3"><a class="nav-link" href="#"
					style="color: white; font-size: 28px; font-weight: 600"> 고객센터</a></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-address-card fa-2x"></i></a> <br> <span> <a
						href="#">회원정보</a><br>
				</span></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-credit-card fa-2x"></i></a> <br> <span> <a
						href="#">주문</a> / <a href="#">결제</a><br>
				</span></li>

				<li class="nav-item col-sm-3 my-3" style="border: 0px"><a
					href="#"><i class="far fa-question-circle fa-2x"></i></a> <br>
					<span> <a href="#">기타</a><br>
				</span></li>
			</ul>
		</div>
	</div>

	<div class="container p-0 my-0 jinwoo">
		<div id="contentbody">
			<div class="row px-3">
				<div class="side col-sm-3">
					<nav class="sidenav nav flex-column px-3">
					<li><a class="nav-link active" href="#">자주 묻는 질문</a></li>
					<li><a class="nav-link" href="#">1:1 문의하기</a></li>
					<li><a class="nav-link" href="#">나의 문의 확인</a></li>
					<li><a class="nav-link" href="#">고객센터 이용안내</a></li>
					<li><a class="nav-link" href="#">공지사항</a></li>
					<section class="time mt-4 p-3 bg-light">
					<h5>
						고객센터<br>업무시간
					</h5>
					<p>
						<strong>09:00~18:00 <span>(평일)</span></strong><br> <em>주말/공휴일
							휴무</em><br> <em>1:1문의 24시간 접수</em>
					</p>
					<p class="desc">
						업무시간 외에는<br> 자주 묻는 질문<br> 또는 1:1문의를<br> 이용해 주세요
					</p>
					</section> </nav>
				</div>
				
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

					<h5 class="notice pt-4 pb-2">공지사항</h5>
				
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
				</div>
			</div>
		</div>
	</div>
	</div>
<footer>
	<jsp:include page="../CSFooter.jsp" />
	</footer>
</body>
</html>