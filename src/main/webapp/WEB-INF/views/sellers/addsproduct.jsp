<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
.frmsort {
	display: inline-block;
}
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0;
}
.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em; /* label의 패딩값과 일치 */
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script>
$(document).ready(function() {

	
	
/* 	$('#option_delete1').click(function(){
		console.log('aaaa');
		$('.addoptionsmore').empty();a
/	$('#addoptions').empty();
	}) */
	$('#summernote').summernote({
		  toolbar: [
		    // [groupName, [list of button]]
		    ['style', ['bold', 'italic', 'underline', 'clear']],
		    ['font', ['strikethrough', 'superscript', 'subscript']],
		    ['fontsize', ['fontsize']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']]
		  ]
	
	
	
		});
});
</script>
<script>


</script>

<script>
let a = new Array();

let i = 1;

$(document).ready(function(){
	$('#addoption').on('click', function(){
        i = 1;
		while( a.includes(i) ){
			i++;
		}
		
let frm ='';  
frm+=' <div class="form-group row addoptionsmore">                                                                                       ';
frm+='     <label for="options" class="col-sm-2 col-form-label">옵션'+i+' </label>                                                        ';
frm+='        <div class="col-sm-10">                                                                                                    ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].option1" class=" col-form-label">옵션1</label>                                          ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].option1" id="options['+i+'].option1">               ';
frm+='                 <input type="hidden" class="form-control ival" value="'+i+'">                  									 ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+']..option1" class=" col-form-label">옵션2</label>                                         ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].option2" id="options['+i+'].option2">               ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].inventory" class="  col-form-label">재고</label>                                        ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].inventory" id="options['+i+'].inventory" required>  ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <label for="options['+i+'].add_price" class=" col-form-label">추가 금액</label>                                      ';
frm+='                 <input type="text" class="form-control " name="options['+i+'].add_price" id="options['+i+'].add_price" required>  ';
frm+='             </div>                                                                                                                ';
frm+='             <div class="col-sm-2 frmsort">                                                                                        ';
frm+='                 <button type="button" class="del_opt_btn btn btn-info">취소 </button>												 ';
frm+='             </div>                                                                                                                ';
frm+='                                                                                                                                   ';
frm+='         </div>                                                                                                                    ';
frm+=' </div>                                                                                                                            ';
		$('#addoptions').append(frm);
		console.log(i);

		a.push(i);
		
		console.log('추가한후 a 값 : ');
		console.log(a);
		i++;
})
let b ;
	
$(document).on('click', '.del_opt_btn', function(){
	$(this).parent().parent().parent().remove();
	
	b = $(this).parent().parent().find('.ival').val();

	console.log('삭제한 옵션의 값 : ');
	console.log(b);
	
	
	
	b*=1;
	let c = a.indexOf(b);
	console.log('a배열에서 b값의 자리 : ');
	console.log(c);
	
	
	a.splice(c, 1);
	console.log('삭제후 a 값 : ');
	console.log(a);
	
	i= b;
	console.log('삭제후 i값 : ');
	console.log(i);
}) 


})

</script>

<script>
window.onload = function(){
console.log('start');
let fileTarget = $('.upload-hidden');
let filename = '';

fileTarget.on('change', function(){ // 값이 변경되면
  if(window.FileReader){ // modern browser
	  filename = $(this)[0].files[0].name;
	  console.log(filename);
  }
  else { // old IE
	  filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
	  console.log(filename);
  }
  // 추출한 파일명 삽입
  $(this).siblings('.upload-file').empty().append(filename);
  
});


console.log('end');
}



</script>
<script>
	function validate(){
		let product_name = document.addfm.product_name;
		let price = document.addfm.price;
		let cost = document.addfm.cost;
		let category_code = document.addfm.category_code;
		let athumb_img = document.addfm.athumb_img;
	 	let opt1 = document.addfm.elements['options[0].option1'];
		let opt2 = document.addfm.elements['options[0].option2'];
		
		let inventory = document.addfm.elements['options[0].inventory'];
		let add_price = document.addfm.elements['options[0].add_price'];
		
		
	 	let opt3 = document.addfm.elements['options[1].option1'];

		var vnum= /^[0-9]+$/
		
		
		if(product_name == null ||product_name.value == '' ){
			alert('상품명을 입력해주세요');
			
			let addOptionsCount = document.getElementById('addoptions');
			let bbb = addOptionsCount.childElementCount;
			//let aaa = $('div.addoptionsmore').length();
			console.log(aaa);
			console.log(bbb);
			
			
			product_name.focus();
			return false;
		}else if(price == null ||price.value == '' ){
			alert('판매가를 입력해주세요');
			price.focus();
			return false;
		}else if(!vnum.test(price.value)){
			alert('판매가는 숫자만 입력 할 수 있습니다');
			price.focus();
			return false;
		}else if(cost == null ||cost.value == '' ){
			alert('원가를 입력해주세요');
			cost.focus();
			return false;
		}else if(!vnum.test(cost.value)){
			alert('판매가는 숫자만 입력 할 수 있습니다');
			cost.focus();
			return false;
		} else if(opt1 == null || opt1.value== ''){
			alert('옵션1을 입력해주세요');
			opt1.focus();
			return false;
		}else if(opt2 == null || opt2.value== ''){
			alert('옵션2를 입력해주세요');
			opt.focus();
			return false;
		}else if(inventory.value == null || inventory.value ==''){
			alert('재고를 입력해주세요');
			inventory.focus();
			return false;
		}else if(!vnum.test(inventory.value)){
			alert('재고는 숫자만 입력 할 수 있습니다.');
			inventory.focus();
			return false;
		}else if(add_price.value == null || add_price.value ==''){
			alert('추가금액을 입력해주세요. 추가금액이 없을 경우 0 입력');
			add_price.focus();
			return false;
		}else if(!vnum.test(inventory.value)){
			alert('추가금액은 숫자만 입력 할 수 있습니다.');
			inventory.focus();
			return false;
		}else if(category_code.value == null || category_code.value ==''){
			alert('카테고리를 선택 해 주세요');
			category_code.focus();
			return false;
		}else if(athumb_img == null ||athumb_img.value == '' ){
			alert('썸네일을 첨부해주세요');
			athumb_img.focus();
			
			console.log(opt3);
			return false;
		} else if(opt3.value !=''  ){
			
			
			for(a = 1 ; a < bbb.length+1; a++){
				console.log(a);
			 	let opt1 = document.addfm.elements['options['+a+'].option1'];
				let opt2 = document.addfm.elements['options['+a+'].option2'];
				
				console.log(opt1);
				console.log(opt2);
				let inventory = document.addfm.elements['options['+a+'].inventory'];
				let add_price = document.addfm.elements['options['+a+'].add_price'];
				
				
				if(opt1 == null || opt1.value== ''){
					alert('옵션1을 입력해주세요');
					opt1.focus();
					return false;
				}else if(opt2 == null || opt2.value== ''){
					alert('옵션2를 입력해주세요');
					opt.focus();
					return false;
				}else if(inventory.value == null || inventory.value ==''){
					alert('재고를 입력해주세요');
					inventory.focus();
					return false;
				}else if(!vnum.test(inventory.value)){
					alert('재고는 숫자만 입력 할 수 있습니다.');
					inventory.focus();
					return false;
				}else if(add_price.value == null || add_price.value ==''){
					alert('추가금액을 입력해주세요. 추가금액이 없을 경우 0 입력');
					add_price.focus();
					return false;
				}else if(!vnum.test(inventory.value)){
					alert('추가금액은 숫자만 입력 할 수 있습니다.');
					inventory.focus();
					return false;
				}else{
					true;
				}
			}  
		}else{
			return true;
		}
	}
</script>




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
				<h6 class="m-0 font-weight-bold text-primary">상품 추가 폼</h6>
			</div>
			<div class="card-body">
			
			
				<form action="${pageContext.request.contextPath}/addproductresult" name="addfm" method="post" onsubmit="return validate();" enctype="multipart/form-data" class="needs-validation" novalidate>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

					<div class="form-group row">
						<label for="product_name" class="col-sm-2 col-form-label">상품명</label>
						<div class="col-sm-10">
							<input type="text" class=" form-control" name="product_name" id="product_name" >
							<div class="invalid-tooltip">필수 입력 사항 / 리스트에 노출될 상품명을
								입력해주세요</div>

						</div>
					</div>
					<div class="form-group row">
						<label for="price" class="col-sm-2 col-form-label">판매가</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="price" id="price"  >
							<div class="invalid-tooltip">필수 입력 사항 / 소비자에게 판매할 금액을
								입력해주세요</div>
						</div>
					</div>

					<div class="form-group row">
						<label for="cost" class="col-sm-2 col-form-label">원가</label>
						<div class="col-sm-10">
							<input type="text" class="form-control " name="cost" id="cost"  >
							<div class="invalid-tooltip">필수 입력 사항 / 상품 입고 원가를 입력해주세요</div>
						</div>
					</div>

					<div class="form-group row">
						<label for="shipping_cost" class="col-sm-2 col-form-label">배송비</label>
						<div class="col-sm-10">
							<input type="text" class="form-control "
								name="shipping_cost" id="shipping_cost" value="${shipping_cost}" >
							<div class="invalid-tooltip">필수 입력 사항 / 1회 배송비를 입력해주세요</div>
						</div>
					</div>
					<div>

					<div class="form-group row">
						<label for="options" class="col-sm-2 col-form-label">옵션</label>
						<div class="col-sm-10">
							<div class="col-sm-2 frmsort">
								<label for="options[0].option1" class=" col-form-label">옵션1</label>
								<input type="text" class="form-control " name="options[0].option1"
									id="options[0].option1" placeholder="ex)색상 ,," >
							</div>
							<div class="col-sm-2 frmsort">
								<label for="options[0].option2" class=" col-form-label">옵션2</label>
								<input type="text" class="form-control " name="options[0].option2"
									id="options[0].option2"  placeholder="ex)사이즈 ,,">
							</div>
							<div class="col-sm-2  frmsort">
								<label for="options[0].inventory" class="  col-form-label">재고</label>
								<input type="text" class="form-control "
									name="options[0].inventory" id="options[0].inventory" >
								<div class="invalid-tooltip">필수 입력 사항 / 재고량을 입력해주세요</div>
									
							</div>
							<div class="col-sm-2 frmsort">
								<label for="options[0].add_price" class=" col-form-label">추가
									금액</label> <input type="text" class=" form-control"
									name="options[0].add_price" id="options[0].add_price" palceholder="0" >
								<div class="invalid-tooltip">필수 입력 사항 / 추가금액이 없을시 0 입력</div>
							</div>

							<button id="addoption" class="btn btn-info" type="button">+ 옵션 추가</button>
						</div>
					</div>

</div>

					<div id="addoptions"></div>


					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">카테고리</label>
						<div class="col-sm-10">
							<select class="custom-select" name="category_code"
								id="category_code" data-rel="chosen">
								<option selected disabled value="">분류 선택</option>

								<c:forEach var="i" items="${dlist}">
									<option  value="${i.category_code}">${i.lv123}</option>
								</c:forEach>

							</select>
						</div>
					</div>


					<div class="form-group row">
						<label for="athumb_img" class="col-sm-2 col-form-label">썸네일
							이미지</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input upload-hidden"
									id="athumb_img" name="athumb_img" > <label
									class="custom-file-label upload-file" for="athumb_img">이미지
									파일 선택 (가로 550px * 세로 750px 권장)</label>

							</div>
						</div>
					

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 1</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input upload-hidden" 
									id="adetail_img1"  name="adetail_img1" > <label
									class="custom-file-label upload-file" for="adetail_img1">이미지
									파일 선택</label>

							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 2</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input upload-hidden"
									id="adetail_img2" name="adetail_img2" > <label
									class="custom-file-label upload-file" for="adetail_img2">이미지
									파일 선택</label>

							</div>
						</div>

						<label for="inputEmail3" class="col-sm-2 col-form-label">상세
							이미지 3</label>
						<div class="col-sm-10">
							<div class="custom-file">
								<input type="file" class="custom-file-input upload-hidden"
									id="adetail_img3" name="adetail_img3" > <label
									class="custom-file-label upload-file" for="adetail_img3">이미지
									파일 선택</label>

							</div>
						</div>
						
					</div>
					
					<div class="form-group row">
						<label for="inputEmail3" class="col-sm-2 col-form-label">상품 설명</label>
						<div class="col-sm-10">
							<textarea id="summernote" name="explains"></textarea>
						</div>
					</div>



					<div class="form-group row">
						<div class="col-sm-2">공개 여부</div>
						<div class="col-sm-10">
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									id="public_state" name="public_state" checked="">
								<label class="form-check-label" for="gridCheck1"> 상품을 공개
									할 경우 체크 </label>


							</div>
							<div class="form-check">
								<input class="form-check-input" type="checkbox"
									id="review_state" name="review_state" checked="">
								<label class="form-check-label" for="gridCheck1"> 상품에 대한
									리뷰를 공개 할 경우 체크 </label>
							</div>
						</div>
					</div>


					<div class="form-group row">
						<div class="col-sm-10"> <!-- onsubmit="return validate();" -->
					<!-- 	onclick="return validate()" -->
							<input type="submit" class="btn btn-primary" value="상품 등록"    onclick="return validate()" >
							<input type="reset" class="btn btn-secondary" value="초기화">
							
						</div>
					</div>

				</form>

			</div>
		</div>
</body>
</html>