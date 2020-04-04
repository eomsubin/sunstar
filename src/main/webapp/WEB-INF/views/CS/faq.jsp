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
					
					<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">전체 공지</a>
    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">일반 공지</a>
    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">안전거래 공지</a>
  	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">위해상품 공지</a>
  	<a type="button" class="btn addnotice" href="${pageContext.request.contextPath}/noticeadd" style="margin-left:auto; color:white; background-color: #274555">공지 작성 </a> 
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
<!-- 전체공지 -->
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
  					<div id="noticeAll">
						<table class="table table-hover mt-3">
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
								
								<c:if test="${list[0] eq null}">
              					 <tr><td colspan="4"><strong>공지 내역이 없습니다.</strong></td></tr>
            		   			</c:if>
            		   		   <c:if test="${list[0] ne null}">
						 		<c:forEach var="list" items="${list}">
								<tr style="text-align: center;" class="topcontent">
									<td>${list.notice_no}</td>
									<td>${list.notice_category}</td>
									<td class="lefttext">${list.notice_title}</td>
									<td>${list.notice_date}</td>
								</tr>
								<tr class="bcontent"><td colspan="4">${list.notice_content}</td></tr>
								</c:forEach>
								</c:if>
								
							</tbody>
						</table>
					</div>
					${list }
</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">일반 공지</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">안전거래 공지</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">위해상품 공지</div>
</div>
					
					<hr class="my-4">

				</div>
</body>
</html>