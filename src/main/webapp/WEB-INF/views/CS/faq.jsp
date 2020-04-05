<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/faq.css" />
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
	 
	}); 
	
function del(faq_no){
	var chk = confirm("정말 삭제하시겠습니까?");
	if(chk){
		location.href='${pageContext.request.contextPath}/faq/del?faq_no='+faq_no;
	}
	
}


</script>
<title>SBBJ - FAQ</title>
</head>
<body>			
				<div class="col-sm-9">

					<h5 class="faq pt-4 pb-4">자주 묻는 질문</h5>
					
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
					
	
	  		<div class="addbtn">
	     	<a type="button" class="btn addfaq my-2" href="${pageContext.request.contextPath}/faqadd" style="color:white; background-color: #274555">FAQ 작성 </a> 
	  		</div>
	

				<!-- 전체faq -->

  					<div id="faqAll">
						<table class="table table-hover mt-3">
							<colgroup>
								<col width="7%;">
								<col width="13%;">
								<col width="13%;">
								<col width="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">NO</th>
									<th scope="col">분류</th>
									<th scope="col">말머리</th>
									<th scope="col" class="lefttext">제목</th>
								</tr>
							</thead>
							<tbody>
								
								<c:if test="${list[0] eq null}">
              					 <tr><td colspan="4"><strong>자주 묻는 질문 내역이 없습니다.</strong></td></tr>
            		   			</c:if>
            		   		   <c:if test="${list[0] ne null}">
						 		<c:forEach var="list" items="${list}">
								<tr style="text-align: center;" class="topcontent">
									<td>${list.faq_no}</td>
									<td>${list.faq_category}</td>
									<td>${list.faq_head}</td>
									<td class="lefttext">${list.faq_title}</td>
								</tr>
								<tr class="bcontent"><td colspan="4">
								<div class="delsection">
								<a type="button" class="btn delfaq btn-sm"
								onclick='del(${list.faq_no})' style="border:1px solid #274555">삭제</a></div>
								${list.faq_content}
								
								</td>
								</tr>
								</c:forEach>
								</c:if>
								
							</tbody>
						</table>
					</div>

					
					<hr class="my-4">

				
</body>
</html>