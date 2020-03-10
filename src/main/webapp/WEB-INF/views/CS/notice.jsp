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
					style="color: white; font-size: 28px; font-weight: 600"> ������</a></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-address-card fa-2x"></i></a> <br> <span> <a
						href="#">ȸ������</a><br>
				</span></li>
				<li class="nav-item col-sm-3 my-3"><a href="#"><i
						class="far fa-credit-card fa-2x"></i></a> <br> <span> <a
						href="#">�ֹ�</a> / <a href="#">����</a><br>
				</span></li>

				<li class="nav-item col-sm-3 my-3" style="border: 0px"><a
					href="#"><i class="far fa-question-circle fa-2x"></i></a> <br>
					<span> <a href="#">��Ÿ</a><br>
				</span></li>
			</ul>
		</div>
	</div>

	<div class="container p-0 my-0 jinwoo">
		<div id="contentbody">
			<div class="row px-3">
				<div class="side col-sm-3">
					<nav class="sidenav nav flex-column px-3">
					<li><a class="nav-link active" href="#">���� ���� ����</a></li>
					<li><a class="nav-link" href="#">1:1 �����ϱ�</a></li>
					<li><a class="nav-link" href="#">���� ���� Ȯ��</a></li>
					<li><a class="nav-link" href="#">������ �̿�ȳ�</a></li>
					<li><a class="nav-link" href="#">��������</a></li>
					<section class="time mt-4 p-3 bg-light">
					<h5>
						������<br>�����ð�
					</h5>
					<p>
						<strong>09:00~18:00 <span>(����)</span></strong><br> <em>�ָ�/������
							�޹�</em><br> <em>1:1���� 24�ð� ����</em>
					</p>
					<p class="desc">
						�����ð� �ܿ���<br> ���� ���� ����<br> �Ǵ� 1:1���Ǹ�<br> �̿��� �ּ���
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
							<button class="btn btn-outline-secondary" type="button">�˻�</button>
						</div>
					</div>
					</nav>

					<hr class="my-4">

					<h5 class="notice pt-4 pb-2">��������</h5>
				
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
									<th scope="col">�����з�</th>
									<th scope="col" class="lefttext">����</th>
									<th scope="col">��������</th>
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