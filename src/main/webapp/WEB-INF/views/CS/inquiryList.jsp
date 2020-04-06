<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/customer_css/inquiryList.css" />
<title>SBBJ - 공지사항</title>
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

</script>
</head>
<body>         
            <div class="col-sm-9 inquiryList">
               <h5 class="inquiry pt-4 pb-4">나의 문의 확인</h5>
               
               <div id="inquiry">
                  <table class="table table">
                      <colgroup>
                        <col width="7%;">
                        <col width="13%;">
                        <col width="*">
                        <col width="20%;">
                     </colgroup>
                     <thead>
                        <tr style="text-align: center;">
                           <th scope="col">NO</th>
                           <th scope="col">분류</th>
                           <th scope="col" class="lefttext">제목</th>
                           <th scope="col">문의일자</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:if test="${list[0] eq null}">
                              <tr><td colspan="4"><strong>문의하신 내역이 없습니다.</strong></td></tr>
                              </c:if>
                              <c:if test="${list[0] ne null}">
                         <c:forEach var="list" items="${list}">
                        <tr style="text-align: center;" class="topcontent">
                           <td>${list.no}</td>
                           <td>${list.category}</td>
                           <td class="lefttext">${list.title}</td>
                           <td>${list.date}</td>
                        </tr>
                        <tr class="bcontent"><td colspan="4">${list.content}</td></tr>
                        </c:forEach>
                        </c:if>
                     </tbody>
                  </table>
               </div>
               
               <hr class="my-1">
            
            <div class="bottomadjust"> </div>
            </div>
            
</body>
</html>