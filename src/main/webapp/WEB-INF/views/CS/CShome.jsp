<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!--  Bootstrap CSS -->
  <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">  
	<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
<!-- Font Awesome -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
<!-- Themify Icons -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/customer.css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<title>SBBJ - 고객센터 </title>
</head>
<body>
	<div class="wrapper">
	<header>
		<jsp:include page="CSheader.jsp" />
	</header>
	<section>
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
					<li><a class="nav-link active" href="${pageContext.request.contextPath}/faq">자주 묻는 질문</a></li>
					<li><a class="nav-link" href="${pageContext.request.contextPath}/CS/inquiry">1:1 문의하기</a></li>
								<li><a class="nav-link"
									href="${pageContext.request.contextPath}/CS/inquiry/inquirylist">나의
										문의 내역</a></li>
								<li>
									<!-- Button trigger modal --> 
									<a type="button" class="btn nav-link infomodal" data-toggle="modal" data-target="#exampleModalLong"> 
									고객센터 이용안내 </a> 
									<!-- Modal -->
									<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
										aria-hidden="true">
										<div class="modal-dialog" role="document" style="width: 50%">
											<div class="modal-content">
												<div class="modal-body">
													<img claa="infoImg" src="${pageContext.request.contextPath}/resources/images/csimg.jpg" alt="이용안내">
												</div>
												<div class="modal-footer">
													<button type="button" class="modalbtn btn btn-secondary"
														data-dismiss="modal">닫기</button>
												</div>
											</div>
										</div>
									</div>
								</li>
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
		<jsp:include page="${contentpage}" />
		</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../footer2.jsp" />
	</footer>
	</div>
	<!-- Popper.js first, then Bootstrap JS -->
 	 <script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script> 
</body>
</html>

