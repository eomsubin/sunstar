<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		
		$('#all').click(function(){
			if($('#all').prop('checked')){
				$('input:checkbox').prop('checked',true);
			}else{
				$('input:checkbox').prop('checked',false);
			}
		});
		
			
		var lv1_val="";
		$('.lv2add').on('click',function(){
			
			 lv1_val=$(this).parent().parent().find('input:checkbox[name="lv1check"]').val();
			
			console.log(lv1_val);
		
				
	
		});
		
		$('#addbtn1').on('click',function(){
			
			let lv2_name = $('#lv2').val();
			let lv3_name = $('#lv3').val();
 			console.log(lv2_name);
			
			location.href="${pageContext.request.contextPath}/admin/add_lv2/"+lv1_val+"/"+lv2_name+"/"+lv3_name;
		});
		
		var level1 = "";
		var level2 ="";
		$('.lv3add').on('click',function(){
			
			 level1 = $(this).val();
			
			
			 level2 = $(this).parent().parent().find('input:checkbox[name="lv2check"]').val();
			
			
			
		});
		
		$('#addbtn2').on('click',function(){
			
			let lev3_name = $('#lv3code').val();
			console.log(lev3_name);
			

			console.log(level1);
			console.log(level2);
			
			location.href="${pageContext.request.contextPath}/admin/add_lv3/"+level1+"/"+level2+"/"+lev3_name;
			
		});
		
		$('.droplv2').on('click',function(){
			
			let lv2 = $(this).val();
			console.log(lv2);
			
			var result = confirm("2차 카테고리를 삭제하시겠습니까?");
			
			if(result){
				alert('삭제가 완료되었습니다.');
				location.href="${pageContext.request.contextPath}/admin/droplv2/"+lv2;
			}else{
				alert('삭제가 취소되었습니다.');
			}
		});
		
	$('.droplv3').on('click',function(){
			
			let lv3 = $(this).val();
			console.log(lv3);
			
			var result = confirm("3차 카테고리를 삭제하시겠습니까?(3차 카테고리가 하나만 있는 경우 2차와 함께 삭제됩니다.)");
			
			if(result){
				alert('삭제가 완료되었습니다.');
				location.href="${pageContext.request.contextPath}/admin/droplv3/"+lv3;
			}else{
				alert('삭제가 취소되었습니다.');
			}
		});
		
		
	});
	
	
</script>
</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">카테고리</h1>
		<p class="mb-4">
			카테고리를 추가,삭제 할 수 있습니다.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">카테고리 설정</h6>
			</div>
			<div class="card-body">
				<!-- 여기 내부만 수정하시면 됩니다  -->
								
				<table class="table table-bordered mb-0" id="dataTable"
							style="width: 100%;" cellspacing="0">
							<thead>
								<tr>
									<th style="width: 50px"><input type="checkbox" id="all"></th>
									<th colspan="6">카테고리명</th>
									<th >카테고리생성</th>
									<th >삭제</th>
									<!-- <th>업체명</th>
									<th>이메일</th>
									<th style="border-left: 2px solid silver" colspan="3">주소</th>
									<th style="border-right: 2px solid silver;">전화번호</th>
									<th>거래은행</th>
									<th>사업자등록번호</th>
									<th>판매가능기한</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach var="lv1" items="${lv1 }">
								<tr class="table-primary">
									<td><input type="checkbox" name="lv1check" value="${lv1.lv1 }"></td>
									<td colspan="6" >(1차)${lv1.lv1 }</td>
									<td><button class="lv2add btn btn-secondary" data-toggle="modal" data-target="#exampleModal">2차카테고리 추가</button></td>
									<td></td>
								</tr>
									<c:forEach var="lv2" items="${lv2 }">
									<tr class="table-active">
										<c:if test="${lv1.lv1 eq lv2.lv1 }">
											<td><input type="checkbox" name="lv2check" value="${lv2.lv2 }"></td>
											<td colspan="6">(2차)${lv2.lv2 }</td>
											<td><button class="lv3add btn btn-secondary" value="${lv2.lv1 }" data-toggle="modal" data-target="#exampleModal2">3차카테고리 추가</button></td>
											<td><button class="droplv2 btn btn-danger" value="${lv2.lv2 }">2차 삭제하기</button></td>
										</c:if>
									</tr>
									<c:forEach var="lv3" items="${lv3 }">
									   
										<c:if test="${lv2.lv2 eq lv3.lv2 and lv1.lv1 eq lv2.lv1 }">
										<tr >
											<td><input type="checkbox" name="lv3check" value="${lv3.category_code }"></td>
											<td colspan="6">(3차)${lv3.lv3 }</td>
											<td></td>
											<td><button class="droplv3 btn btn-danger" value="${lv3.lv3 }">3차 삭제하기</button></td>
											
										</tr>
										</c:if>
										
									</c:forEach>
								</c:forEach>
								</c:forEach>
									
									
							</tbody>
						</table>
				
				
			
				<!-- 여기 내부만 수정하시면 됩니다  -->
			</div>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">2차 카테고리 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	
        		<label>2차 카테고리명</label><input type="text" id="lv2" name="lv2" class="form-control" required="required" >
        		<label>3차 카테고리명(기본으로 하나이상 추가해주셔야합니다.)</label><input type="text" id="lv3" name="lv3" class="form-control" required="required" >
        		
        	
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" id="addbtn1">추가하기</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">3차 카테고리 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	<label>3차 카테고리명 </label><input type="text" id="lv3code" name="lv3code" class="form-control" required="required" >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="addbtn2">추가하기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>