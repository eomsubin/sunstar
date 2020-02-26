<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	let i = 1;
	$('#addoption').on('click', function(){
		
let frm ='';  
frm+=' <div class="form-group row">                                                                                                      ';
frm+='     <label for="options" class="col-sm-2 col-form-label">옵션'+i+'</label>                                                        ';
frm+='        <div class="col-sm-10">                                                                                                     ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].color" class=" col-form-label">컬러</label>                                             ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].color" id="options['+i+'].color">                   ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].size" class=" col-form-label">사이즈</label>                                            ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].size" id="options['+i+'].size">                     ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].inventory" class="  col-form-label">재고</label>                                        ';
frm+='                 <input type="text" class="form-control  is-invalid" name="options['+i+'].inventory" id="options['+i+'].inventory">  ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].add_price" class=" col-form-label">추가 금액</label>                                   ';
frm+='                 <input type="text" class="form-control  is-invalid" name="options['+i+'].add_price" id="options['+i+'].add_price"> ';
frm+='             </div>                                                                                                                ';
frm+='                                                                                                                                   ';
frm+='             <button id="addoption" type="button"> + 옵션 추가</button>                                                               ';
frm+='         </div>                                                                                                                    ';
frm+=' </div>                                                                                                                            ';
i++;
$('#addoptions').append(frm);
})
})

</script>
<style>
.frmsort {
	display: inline-block;
}
</style>
</head>
<body>

	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">상품 추가</h1>
		<p class="mb-4">
			상품 추가 할 수 있습니다. 필수 입력 사항은 모두 채워주세요. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">
			
			
				<form action="${pageContext.request.contextPath}/addproductresult" method="post" class="needs-validation" novalidate>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

					<div class="form-group row">
						<label for="product_name" class="col-sm-2 col-form-label">상품명</label>
						<div class="col-sm-10">
							<input type="text" class=" form-control"
								name="product_name" id="product_name" required>
						
							<div class="invalid-tooltip">필수 입력 사항 / 리스트에 노출될 상품명을
								입력해주세요</div>

						</div>
					</div>
					<div class="form-group row">
						<label for="price" class="col-sm-2 col-form-label">판매가</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="price"
								id="price" required >
				
							<div class="invalid-tooltip">필수 입력 사항 / 소비자에게 판매할 금액을
								입력해주세요</div>
						</div>
					</div>

					<div class="form-group row">
						<label for="cost" class="col-sm-2 col-form-label">원가</label>
						<div class="col-sm-10">
							<input type="text" class="form-control " name="cost"
								id="cost" required>
							<div class="invalid-tooltip">필수 입력 사항 / 상품 입고 원가를 입력해주세요</div>
						</div>
					</div>

					<div class="form-group row">
						<label for="shipping_cost" class="col-sm-2 col-form-label">배송비</label>
						<div class="col-sm-10">
							<input type="text" class="form-control "
								name="shipping_cost" id="shipping_cost" required>
							<div class="invalid-tooltip">필수 입력 사항 / 1회 배송비를 입력해주세요</div>
						</div>
					</div>
					<div>

					<div class="form-group row">
						<label for="options" class="col-sm-2 col-form-label">옵션</label>
						<div class="col-sm-10">
							<div class="col-sm-2 frmsort">
								<label for="options[0].color" class=" col-form-label">컬러</label>
								<input type="text" class="form-control " name="options[0].color"
									id="options[0].color">
							</div>
							<div class="col-sm-2 frmsort">
								<label for="options[0].size" class=" col-form-label">사이즈</label>
								<input type="text" class="form-control " name="options[0].size"
									id="options[0].size">
							</div>
							<div class="col-sm-2  frmsort">
								<label for="options[0].inventory" class="  col-form-label">재고</label>
								<input type="text" class="form-control "
									name="options[0].inventory" id="options[0].inventory" required>
								<div class="invalid-tooltip">필수 입력 사항 / 재고량을 입력해주세요</div>
									
							</div>
							<div class="col-sm-2 frmsort">
								<label for="options[0].add_price" class=" col-form-label">추가
									금액</label> <input type="text" class=" form-control"
									name="options[0].add_price" id="options[0].add_price" required>
								<div class="invalid-tooltip">필수 입력 사항 / 추가금액이 없을시 0 입력</div>
							</div>

							<button id="addoption" type="button">+ 옵션 추가</button>
						</div>
					</div>

</div>

					<div id="addoptions"></div>


					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">카테고리</label>
						<div class="col-sm-10">
							<select class="custom-select" name="category_code"
								id="category_code" data-rel="chosen">
								<option value=""></option>
								<option selected disabled value="">분류 선택</option>

								<c:forEach var="i" items="${dlist}">
									<option value="${i.category_code}">${i.lv123}</option>
								</c:forEach>

							</select>
						</div>
					</div>





					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">썸네일
							이미지</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">이미지
									파일 선택</label>

							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 1</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">이미지
									파일 선택</label>

							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 2</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">이미지
									파일 선택</label>

							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 3</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="validatedCustomFile" required> <label
									class="custom-file-label" for="validatedCustomFile">이미지
									파일 선택</label>

							</div>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-2">공개 여부</div>
						<div class="col-sm-10">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									id="public_state" name="public_state" value="1" checked="">
								<label class="form-check-label" for="gridCheck1"> 상품을 공개
									할 경우 체크 </label>


							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									id="review_state" name="review_state" value="1" checked="">
								<label class="form-check-label" for="gridCheck1"> 상품에 대한
									리뷰를 공개 할 경우 체크 </label>
							</div>
						</div>
					</div>


					<div class="form-group row">
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary">Sign in</button>
						</div>
					</div>

				</form>

			</div>
		</div>
</body>
</html>