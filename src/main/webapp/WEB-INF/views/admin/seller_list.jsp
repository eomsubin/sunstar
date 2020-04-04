<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css">  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function(){
		var table = $('#dataTable').DataTable();
	    $('#dataTable').DataTable();
 		$('#allck').click(function(){
			if($('#allck').prop('checked')){
				$('input:checkbox').prop('checked',true);
			}else{
				$('input:checkbox').prop('checked',false);
			}
		});
		$('input:checkbox[name=sid]').click(function(){
			$('#allck').prop('checked',false);
		});
		
	    $('#dataTable tbody').on('click', 'tr', function () {
	    	event.stopPropagation();
	        if($(this).find(':input').prop('checked')){
	        	$(this).find(':input').prop('checked',false)
	        }else{
	        	$(this).find(':input').prop('checked',true)
	        }	        
	        /*
	        var data = table.row( this ).data();
	        console.log(data);
	        console.log(data[0]);
	        data[0].prop('checked',true); */
	        $('#allck').prop('checked',false);
	    } );
		
		
	});
	
	// 승인 또는 반려
	function submit(ch){ 
		let idsum="";
		let emailsum="";
		let message="";
		if($('input:checkbox[name=sid]:checked').length==0){
			return;
		}
		$.each($('input:checkbox[name=sid]:checked'),function(){
			idsum+=$(this).val()+","
			emailsum+=$(this).data("semail")+","
		})
		if(ch==="O"){
			$('input:hidden[name=YN]').val("activity");
		}else if(ch==="Y"){
			$('input:hidden[name=YN]').val("stop");
		}else{
			$('input:hidden[name=YN]').val("remove");
			message=$('input:text[name=message]').val();
		}
		// 문자열 합치기
		idsum = idsum.slice(0,-1);
		emailsum = emailsum.slice(0,-1);
		$('input:checkbox[name=sid]:checked').val(idsum);
		$('input:hidden[name=email]').val(emailsum);
		$('input:hidden[name=m]').val(message);
		// 제출
		console.log($('input:checkbox[name=sid]:checked').val());
		console.log($('input:hidden[name=YN]').val());
		console.log($('input:hidden[name=m]').val());
		console.log($('input:hidden[name=email]').val()); 
		$('form').submit();
	}
	
	function productallprint() {
		let idsum="";
		
		if($('input:checkbox[name=sid]:checked').length==0){
			return;
		}
		$.each($('input:checkbox[name=sid]:checked'),function(){
			idsum+=$(this).val()+","
		})
		idsum = idsum.slice(0,-1);
		
		console.log(idsum);
		location.href = "${pageContext.request.contextPath}/admin/sellerExcel/"+idsum;
	}
</script>
</head>
<style> 
table tbody tr.odd {
    background-color: #f9f9f9;
}
table tbody tr.odd>.sorting_1{
    background-color: #f1f1f1;
}
table tbody tr.even>.sorting_1{
    background-color: #fafafa;
}
table tbody tr:hover{
    background-color: #eaeaea;
}
table tbody tr:hover>.sorting_1{
    background-color: #eaeaea;
}
a{
	color : #858796;
}
</style>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">판매자 목록</h1>
		<p class="mb-4">
			<!-- 페이지 설명 <a target="_blank" href="https://datatables.net">추가 링크 삽입</a>. -->
		</p>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">판매자 목록</h6>
			</div>
			<div class="card-body">
				<!-- 여기 내부만 수정하시면 됩니다  -->
				<div class="table-responsive">
					<form method="post" action="${pageContext.request.contextPath}/admin/seller_submit">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input type="hidden" name="YN"/>
						<input type="hidden" name="m"/>
						<input type="hidden" name="email"/>
						<!-- 
						<button type="button" id="all_print" class="btn btn-secondary"
							onclick="productallprint()">전체출력</button>
 						-->
 					<button type="button" class="btn btn-secondary m-3" onclick="productallprint()">판매자 정보</button>
				<table class="table table-bordered mb-0" id="dataTable"
							style="width: 100%;">
							<thead>
								<tr>
 									<th><input type="checkbox" id="allck"></th>
									<th>고유번호</th>
 									<th>업체명</th>
									<th>아이디</th>	
 									<th>이메일</th>
									<th>주소</th>
									<th>전화번호</th>
									<th>상태</th>
									<th>사업자등록번호</th>
									<th>판매가능기한</th>
								</tr>
							</thead>
 							<tbody>								
								<c:forEach var="item" items="${list}">
								<tr>
									<td><input type="checkbox" name="sid" value="${item.id}" data-semail="${item.seller_email}" data-seller_state="${item.seller_state}" /></td>
									<td><a href="${pageContext.request.contextPath}/seller/seller_list/${item.seller_code}">${item.seller_code}</a></td>
									<td>${item.seller_name}</td>
									<td>${item.id}</td>
									<td>${item.seller_email}</td>
									<td>${item.seller_address1} ${item.seller_address2} ${item.seller_address3}</td>
									<td>${item.seller_tel}</td>
									<c:if test="${item.seller_state eq 1}"><td>활동</td></c:if>
									<c:if test="${item.seller_state ne 1}"><td>정지</td></c:if>
									<td>${item.business_license}</td>
									<td>${item.seller_deadline}</td>
								</tr>
								</c:forEach>
							</tbody> 
						</table>
					</form>
				</div>
					<div class="row mt-4">
					<button style="width: 30%;" class="btn btn-primary mx-auto" onclick="submit('O')">활동</button><button style="width: 30%;" class="btn btn-secondary mx-auto" onclick="submit('Y')">정지</button><button style="width: 30%;" class="btn btn-danger mx-auto" data-toggle="modal" data-target="#rejectmodal">삭제</button>
					</div>
					 <!-- The Modal -->
  <div class="modal fade" id="rejectmodal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">삭제 사유</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input class="p-5" type="text" name="message" autofocus="autofocus" style="border: 0px solid white; width: 100%" placeholder="삭제 사유">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="submit('N')">제출</button>
        </div>
        
      </div>
    </div>
  </div>
			</div>
		</div>
	</div>
</body>
</html>