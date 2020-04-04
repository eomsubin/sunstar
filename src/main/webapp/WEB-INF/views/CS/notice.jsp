<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/notice.css" />
<script>

$(document).ready(function(){
   hidecontent();
   
   function hidecontent(){
      $('.bcontent').hide();
   }
   
   
 $('.topcontent').on('click', function(){
    $(this).siblings('.bcontent').hide(); 
    $(this).next('.bcontent').toggle();
 });
 
 
 function defaultcss(){
	 $('.nav-item').css("color", black);
 }
 

 
}); 

</script>
<title>SBBJ - 공지사항</title>
</head>
<body>			
				<div class="col-sm-9">

					<h5 class="notice pt-4 pb-4">공지사항</h5>
					
	<nav>
	  <div class="nav nav-tabs" id="nav-tab" role="tablist">
	    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="home" aria-selected="true">전체 공지</a>
	    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="profil" aria-selected="false">일반 공지</a>
	  	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="contact" aria-selected="false">위해상품 공지</a>
	  	<a type="button" class="btn addnotice mb-1" href="${pageContext.request.contextPath}/noticeadd" style="margin-left:auto; color:white; background-color: #274555">공지 작성 </a> 
	  </div>
	</nav>
	
	<div class="tab-content" id="myTabContent">
	<!-- 전체공지 -->
  	 <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="home-tab">
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
								<tr class="bcontent"><td colspan="5">${list.notice_content}</td></tr>
								</c:forEach>
								</c:if>
								
							</tbody>
						</table>
					</div>
				</div>

			<!-- 일반공지 -->
    		<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="profile-tab">
  					<div id="noticecom">
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
						 		<c:forEach var="list" items="${list}">
						 		<c:if test="${list.notice_category == '일반'}">
								<tr style="text-align: center;" class="topcontent">
									<td>${list.notice_no}</td>
									<td>${list.notice_category}</td>
									<td class="lefttext">${list.notice_title}</td>
									<td>${list.notice_date}</td>
								</tr>
								<tr class="bcontent"><td colspan="5">${list.notice_content}</td></tr>
								</c:if>
								</c:forEach>				
							</tbody>
						</table>
					</div>
</div>
  
  
   <!-- 위해상품 공지 -->
   <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="contact-tab">
  					<div id="noticeham">
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
						 		<c:forEach var="list" items="${list}">
						 		<c:if test="${list.notice_category == '위해'}">
								<tr style="text-align: center;" class="topcontent">
									<td>${list.notice_no}</td>
									<td>${list.notice_category}</td>
									<td class="lefttext">${list.notice_title}</td>
									<td>${list.notice_date}</td>
								</tr>
								<tr class="bcontent"><td colspan="4">${list.notice_content}</td></tr>
								</c:if>
								</c:forEach>				
							</tbody>
						</table>
					</div>
				</div>
					
					<hr class="my-4">
	</div>
</div>
</body>
</html>