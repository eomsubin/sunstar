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
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/customer.css" />
<title>SBBJ - 고객센터 </title>
</head>
<body>
	<div class="container p-0">

		<div id="contenttop">
			<ul class="headnav nav nav-pills nav-fill">
				<li class="nav-item col-sm-3"><a class="nav-link" href="${pageContext.request.contextPath}/CS"
					style="color: white; font-size: 28px; font-weight: 600">고객센터</a></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-address-card fa-2x"></i></a> <br> <span> <a
						href="#">정보변경</a><br> <a href="#">비밀번호 변경</a><br> <a
						href="#">탈퇴</a>
				</span></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-credit-card fa-2x"></i></a> <br> <span> <a
						href="#">주문</a><br> <a href="#">결제</a><br>
				</span></li>

				<li class="nav-item col-sm-3 my-3" style="border: 0px"><a
					href="#"><i class="far fa-question-circle fa-2x"></i></a> <br>
					<span> <a href="#">고객센터</a><br> <a href="#">기타</a><br>
				</span></li>
			</ul>
		</div>
	</div>
	<div class="container p-0 mt-3 jinwoo">
		<div id="contentbody">
			<div class="row px-3">
				<div class="side col-sm-3">
					<nav class="sidenav nav flex-column px-3">
					<li><a class="nav-link active" href="#">자주 묻는 질문</a></li>
					<li><a class="nav-link" href="${pageContext.request.contextPath}/inquiry">1:1 문의하기</a></li>
					<li><a class="nav-link" href="#">나의 문의 확인</a></li>
					<li><a class="nav-link" href="#">고객센터 이용안내</a></li>
					<li><a class="nav-link" href="${pageContext.request.contextPath}/notice">공지사항</a></li>
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
			</div>
		</div>
	</div>

</body>
</html>