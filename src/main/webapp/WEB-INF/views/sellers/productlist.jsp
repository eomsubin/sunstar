<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.inputsearch {
	display: inline-block;
}

.frmsort {
	display: inline-block;
	margin-left: 30px;
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css"
	rel="stylesheet">

<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
<script>
$(document).ready(function() {
	
	let header = "${_csrf.headerName}";
	
	let token = "${_csrf.token}";
	//모달창을 누르면
	/* $('.detailmdl').on('click', function(){
		
		let pcode = $(this).parent().parent().find('td').eq(1).text();
		console.log("1"+pcode);
		
		$.ajax({
			url : "${pageContext.request.contextPath}/detailview/"+pcode , 
			dataType:"Json",
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token)
			},
			success: function(data){
				
				console.log(data);
				console.log(data.product_code);
			                                                                                                               ';
				$('#modalplus').modal();
			},error:function(data){
				console.log(data);
			}
		})
	}); */
					
	$('.detailmdl').on('click', function(){
	
	let pcode = $(this).parent().parent().find('td').eq(1).text();
	console.log("1"+pcode);
	
	$.ajax({
	      url : "${pageContext.request.contextPath}/seller/detailview/"+pcode , 
	      dataType:"Json",
	      beforeSend : function(xhr){
	         xhr.setRequestHeader(header, token)
	      },
	      success: function(data){
	         
	         console.log(data);
	         console.log(data.product_code);
	         
	         $('.modal-content').empty();
	         
	         let m ='';
	                                     
	         m+='         <form action="${pageContext.request.contextPath}/seller/productUpdate" enctype="multipart/form-data"  method="post" >                                                                                                        ';

	m+='      <div class="modal-header">                                                                                        ';
	m+='      <h5 class="modal-title" id="exampleModalLabel">상품 상세보기 및 수정</h5>                                                  ';
	m+='      <button type="button" class="close" data-dismiss="modal"                                                          ';
	m+='         aria-label="Close">                                                                                           ';
	m+='         <span aria-hidden="true">&times;</span>                                                                       ';
	m+='      </button>                                                                                                         ';
	m+='   </div>                                                                                                                ';
	m+='   <div class="modal-body">                                                                                              ';
	m+='      <p style="color:red; font-weight:700;"> 상품명, 판매가, 원가, 배송비, 이미지, 공개여부만 변경 가능합니다. </p>';
	m+='       <p>상품코드 :'+data.product_code +'</p>';
	m+='      <div class="card-body">                                                                                           ';
	m+='            <input type="hidden" name="${_csrf.parameterName}"                                                        ';
	m+='               value="${_csrf.token}" /> <input type="hidden" name="product_code" value="'+data[0].product_code+'">';                       
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="product_name" class="col-sm-2 col-form-label">상품명</label>                                 ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <input type="text" class=" form-control" name="product_name"                                      ';
	m+='                     value="'+data[0].product_name+ '  ">                                                                   ';
	m+='                  <div class="invalid-tooltip">필수 입력 사항 / 리스트에 노출될 상품명을 입력해주세요</div>                                ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="price" class="col-sm-2 col-form-label">판매가</label>                                        ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <input type="text" class="form-control" name="price"                                              ';
	m+='                     value="' + data[0].price + '">                                                                           ';
	m+='                  <div class="invalid-tooltip">필수 입력 사항 / 소비자에게 판매할 금액을 입력해주세요</div>                                ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='                                                                                                                         ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="cost" class="col-sm-2 col-form-label">원가</label>                                          ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <input type="text" class="form-control " name="cost"                                              ';
	m+='                     value="' +data[0].cost+'">                                                                            ';
	m+='                  <div class="invalid-tooltip">필수 입력 사항 / 상품 입고 원가를 입력해주세요</div>                                    ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="shipping_cost" class="col-sm-2 col-form-label">배송비</label>                                ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <input type="text" class="form-control " name="shipping_cost"                                     ';
	m+='                     value="'+data[0].shipping_cost+'">                                                                   ';
	m+='                  <div class="invalid-tooltip">필수 입력 사항 / 1회 배송비를 입력해주세요</div>                                      ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	
	
	$.each(data,function(index, item){
		m+='            <div>                                                                                                     ';
		m+='               <div class="form-group row">                                                                          ';
		m+='                  <label for="options" class="col-sm-2 col-form-label">옵션</label>                                   ';
		m+='                  <div class="col-sm-12">                                                                           ';
		m+='                     <div class="col-sm-2 frmsort">                                                                ';
		m+='                        <label for="options[0].option1" class=" col-form-label">옵션1</label>                       ';
		m+='                        <input type="text" class="form-control "                                                  ';
		m+='                           name="options[0].option1" placeholder="ex)색상 ,,"                                      ';
		m+='                           value="'+item.option1+'" readonly="readonly">                                                                 ';
		m+='                     </div>                                                                                        ';
		m+='                     <div class="col-sm-2 frmsort">                                                                ';
		m+='                        <label for="options[0].option2" class=" col-form-label">옵션2</label>                       ';
		m+='                        <input type="text" class="form-control "                                                  ';
		m+='                           name="options[0].option2" placeholder="ex)사이즈 ,,"                                     ';
		m+='                           value="'+item.option2+'" readonly="readonly">                                                                 ';
		m+='                     </div>                                                                                        ';
		m+='                     <div class="col-sm-2  frmsort">                                                               ';
		m+='                        <label for="options[0].inventory" class="  col-form-label">재고</label>                     ';
		m+='                        <input type="text" class="form-control "   readonly="readonly"                               ';
		m+='                           name="options[0].inventory" value="'+item.inventory+'">                                   ';
		m+='                        <div class="invalid-tooltip">필수 입력 사항 / 재고량을 입력해주세요</div>                                 ';
		m+='                     </div>                                                                                        ';
		m+='                     <div class="col-sm-2 frmsort">                                                                ';
		m+='                        <label for="options[0].add_price" class=" col-form-label">추가                              ';
		m+='                           금액</label> <input type="text" class=" form-control"      readonly="readonly"           ';
		m+='                           name="options[0].add_price" value="'+item.add_price+'">                                   ';
		m+='                        <div class="invalid-tooltip">필수 입력 사항 / 추가금액이 없을시 0 입력</div>                              ';
		m+='                     </div>                                                                                        ';
		m+='                                                                                                                         ';
		m+='                  </div>                                                                                            ';
		m+='               </div>                                                                                                ';
		m+='            </div>                                                                                                    ';
		
	})
	
	

	m+='            <div id="addoptions"></div>                                                                               ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="inputEmail3" class="col-sm-2 col-form-label">카테고리</label>                                 ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                         <input type="text" class=" form-control" name="category" id="category" value="'+data[0].lv1 +' - '+ data[0].lv2+ ' - '+ data[0].lv3+'" readonly="readonly">                                                                                                ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='            <div>                                                                                                     ';
	m+='               <img src="'+data[0].thumb_img+'" style="width:24%;">                                                 ';
	m+='               <img src="'+data[0].detail_img1+'" style="width:24%;">                                                 ';
	m+='               <img src="'+data[0].detail_img2+'" style="width:24%;">                                                 ';
	m+='               <img src="'+data[0].detail_img3+'" style="width:24%;">                                                 ';
	m+='            </div>                                                                                                    ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="athumb_img" class="col-sm-2 col-form-label">썸네일                                           ';
	m+='                  이미지</label>                                                                                       ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <div class="custom-file">                                                                         ';
	m+='                     <input type="file" class="custom-file-input upload-hidden"                                    ';
	m+='                        name="athumb_img"> <label                                                                 ';
	m+='                        class="custom-file-label upload-file" for="adetail_img2">이미지                              ';
	m+='                        파일 선택 (가로 550px * 세로 750px 권장)</label>                                                    ';
	m+='                  </div>                                                                                            ';
	m+='               </div>                                                                                                ';
	m+='               <label for="inputEmail3" class="col-sm-2 col-form-label">상세                                           ';
	m+='                  이미지 1</label>                                                                                     ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <div class="custom-file">                                                                         ';
	m+='                     <input type="file" class="custom-file-input upload-hidden"                                    ';
	m+='                        name="adetail_img1"> <label                                                               ';
	m+='                        class="custom-file-label upload-file" for="adetail_img1">이미지                              ';
	m+='                        파일 선택</label>                                                                             ';
	m+='                  </div>                                                                                            ';
	m+='               </div>                                                                                                ';
	m+='               <label for="inputEmail3" class="col-sm-2 col-form-label">상세                                           ';
	m+='                  이미지 2</label>                                                                                     ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <div class="custom-file">                                                                         ';
	m+='                     <input type="file" class="custom-file-input upload-hidden"                                    ';
	m+='                        " name="adetail_img2"> <label                                                             ';
	m+='                        class="custom-file-label upload-file" for="adetail_img2">이미지                              ';
	m+='                        파일 선택</label>                                                                             ';
	m+='                  </div>                                                                                            ';
	m+='               </div>                                                                                                ';
	m+='               <label for="inputEmail3" class="col-sm-2 col-form-label">상세                                           ';
	m+='                  이미지 3</label>                                                                                     ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <div class="custom-file">                                                                         ';
	m+='                     <input type="file" class="custom-file-input upload-hidden"                                    ';
	m+='                        name="adetail_img3"> <label                                                               ';
	m+='                        class="custom-file-label upload-file" for="adetail_img3">이미지                              ';
	m+='                        파일 선택</label>                                                                             ';
	m+='                  </div>                                                                                            ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <label for="inputEmail3" class="col-sm-2 col-form-label">상품                                           ';
	m+='                  설명</label>                                                                                        ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <textarea class="summernote" name="explains" readonly="readonly" rows="4" cols="96">'+data[0].explains+'</textarea>                             ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='            <div class="form-group row">                                                                              ';
	m+='               <div class="col-sm-2">공개 여부</div>                                                                     ';
	m+='               <div class="col-sm-10">                                                                               ';
	m+='                  <div class="form-check">                                                                          ';
	m+='                     <input class="form-check-input" type="checkbox"                                               ';
	m+='                        name="public_state" checked=""> <label                                          ';
	m+='                        class="form-check-label" for="gridCheck1"> 상품을 공개 할 경우 체크                                 ';
	m+='                     </label>                                                                                      ';
	m+='                  </div>                                                                                            ';
	m+='                  <div class="form-check">                                                                          ';
	m+='                     <input class="form-check-input" type="checkbox"                                               ';
	m+='                        name="review_state" checked=""> <label                                          ';
	m+='                        class="form-check-label" for="gridCheck1"> 상품에 대한 리뷰를 공개                                  ';
	m+='                        할 경우 체크 </label>                                                                          ';
	m+='                  </div>                                                                                            ';
	m+='               </div>                                                                                                ';
	m+='            </div>                                                                                                    ';
	m+='                                                                                               ';
	m+='      </div>                                                                                                            ';
	m+='   </div>                                                                                                                ';
	m+='   <div class="modal-footer">                                                                                            ';
	m+='      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>                               ';
	m+='      <input type="submit" class="btn btn-primary" value="정보 업데이트">                                              ';
	m+='   </div>    </form>                                                                                                             ';
	                                                                                                                                      
	         
	      
	         
	         $('.modal-content').append(m);
	         $('#modalplus').modal('show');
	      },error:function(data){
	         console.log(data);
	      }
	   })
	});                
	                  
						
					

	$('.summernote')
			.summernote(
					{
						toolbar : [
								// [groupName, [list of button]]
								[
										'style',
										[
												'bold',
												'italic',
												'underline',
												'clear' ] ],
								[
										'font',
										[
												'strikethrough',
												'superscript',
												'subscript' ] ],
								[ 'fontsize',
										[ 'fontsize' ] ],
								[ 'color', [ 'color' ] ],
								[
										'para',
										[ 'ul', 'ol',
												'paragraph' ] ],
								[ 'height', [ 'height' ] ] ]

					});

	$('#all').on(
			'click',
			function() {
				if ($('#all').prop('checked')) {
					$('input[type=checkbox]').prop(
							'checked', true);
				} else {
					$('input[type=checkbox]').prop(
							'checked', false);
				}
			})

	$('#btnupdateinventorymodal').on('click', function() {
		$('#updateinventorymodal').modal();
	})


	$('#btndeletemodal').on('click', function() {
		$('#deletemodal').modal();
	})
	$('#btndelete')
			.on(
					'click',
					function() {
						$("input[name=pcode]:checked")
								.each(
										function() {

											var pcode = $(
													this)
													.val();
											console
													.log(pcode);
											location.href = "${pageContext.request.contextPath}/seller/deleteproduct/"
													+ pcode;

										});
					})

	$('#changeSizePerPage')
			.on(
					'change',
					function() {
						console.log('move!');

						let psize = $(
								'#changeSizePerPage option:selected')
								.val();

						console.log(psize);

						location.href = "${pageContext.request.contextPath}/seller/productlist?psize="
								+ psize;

					})

})
</script>

<script>
	window.onload = function() {
		console.log('start');
		let fileTarget = $('.upload-hidden');
		let filename = '';

		fileTarget.on('change', function() { // 값이 변경되면
			if (window.FileReader) { // modern browser
				filename = $(this)[0].files[0].name;
				console.log(filename);
			} else { // old IE
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
	function uptest() {
		let ckbox = document.getElementsByName("pcode");
		let ckboxlengh = ckbox.length;
		let checked = 0;

		for (i = 0; i < ckboxlengh; i++) {
			if (ckbox[i].checked == true) {
				let pcode = ckbox[i].value;

				console.log(ckbox[i].value);
				checked += 1;

				location.href = "${pageContext.request.contextPath}/seller/updateinventory/"
						+ pcode + "/" + 3;
			}
		}
	}

	function changePublicState(state) {
		let changePublicState = state;
		let ckbox = document.getElementsByName("pcode");
		let ckboxlengh = ckbox.length;
		let checked = 0;

		let pcodes = new Array();

		for (i = 0; i < ckboxlengh; i++) {
			if (ckbox[i].checked == true) {
				let pcode = ckbox[i].value;

				pcodes.push(pcode);
				console.log(ckbox[i].value);
				checked += 1;
			}
		}
		console.log("--state--");
		console.log(pcodes);
		console.log("+state++");

		location.href = "${pageContext.request.contextPath}/seller/changePublicState/"
				+ changePublicState + "/" + pcodes;
	}

	function productallprint() {
		location.href = "${pageContext.request.contextPath}/seller/productExcel/";

	}
</script>

<style>
body {
	font-size: 0.77em;
}
</style>

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
		<p class="mb-4">
			상품을 일괄 변경 및 삭제 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">판매자 =</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<form>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<!-- 	<button type="button" id="btnaddinventory" class="btn btn-primary">선택 재고 추가</button> -->

						<div class="btn-group">
							<button type="button" class="btn btn-secondary dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">선택상품 공개 비공개</button>
							<div class="dropdown-menu">

								<a class="dropdown-item"
									onclick="changePublicState('publicStateTrue')">상품 공개</a> <a
									class="dropdown-item"
									onclick="changePublicState('publicStateFalse')">상품 비공개</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item"
									onclick="changePublicState('reviewStateTrue')">리뷰 공개</a> <a
									class="dropdown-item"
									onclick="changePublicState('reviewStateFalse')">리뷰 비공개</a>


							</div>
						</div>

						<button type="button" id="all_print" class="btn btn-secondary"
							onclick="productallprint()">전체출력</button>


						<button type="button" id="btnupdate" class="btn btn-success">선택
							수정</button>
						<button type="button" class="btn btn-danger">선택 삭제</button>
						<!-- id="btndelete" -->


						<!-- update inventory Button trigger modal -->
						<button type="button" id="btnupdateinventorymodal"
							class="btn btn-primary">재고 추가 모달 테스트</button>


						<div class="col-md-10" style="margin: 20px 0px;">
							<select class="custom-select col-md-4" id="changeSizePerPage">
								<option selected disabled value="10">표시 건수</option>
								<option value="10">10</option>
								<option value="30">30</option>
								<option value="50">50</option>
								<option value="100">100</option>
								<option value="10000">전체</option>
							</select>


							<div class="inputsearch">

								<input class="form-control col-md-12 " type="search"
									placeholder="Search" aria-label="Search"
									style="position: relative; top: 2px;">
							</div>

							<div class="inputsearch">
								<button class="btn btn-outline-success    col-md-14 "
									type="submit">Search</button>
							</div>
							<!-- update Modal -->
						</div>


						<form>

							<div class="modal fade" id="updateinventorymodal" tabindex="-1"
								role="dialog" aria-labelledby="exampleModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Modal
												title</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<select name="gesu" id="gesu">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
											</select>

											<!--  <input type="text" placehoder="입력하세요"> -->

										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Close</button>
											<button type="button" class="btn btn-primary"
												id="btnupdateinventory" onclick="uptest()">버트니다</button>


										</div>
									</div>
								</div>
							</div>

						</form>

						<!-- delete Button trigger modal -->
						<button type="button" id="btndeletemodal" class="btn btn-danger">
							<!-- data-toggle="modal" data-target="#exampleModal" -->
							삭제 모달 테스트
						</button>


						<!-- delete Modal -->
						<div class="modal fade" id="deletemodal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">경 고</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div>
											경고!! <br> 상품코드가 같은 상품은 모두 삭제됩니다.<br> <br> 옵션만
											삭제할 경우 ㅇㅇㅇ에서 삭제를 실행해주세요<br> 선택한 상품을 정말로 삭제하시겠습니까?
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary" id="btndelete">삭제</button>
									</div>
								</div>
							</div>
						</div>

						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th style="width: 50px"><input type="checkbox" id="all"></th>
									<th>상품코드</th>
									<th>상품이름</th>
									<th>가격</th>
									<th>원가</th>
									<th>배송비</th>
									<th style="border-left: 2px solid silver">컬러</th>
									<th>사이즈</th>
									<th>재고</th>
									<th style="border-right: 2px solid silver;">추가 가격</th>
									<th>카테고리</th>
									<th>공개여부</th>
									<th>리뷰공개여부</th>
								</tr>
							</thead>

							<tbody>

								<c:forEach var="i" items="${list}">
									<tr>
										<td><input type="checkbox" id="pcode" name="pcode"
											value="${i.product_code}"></td>
										<td>${i.product_code }</td>
										<td>${i.product_name}</td>
										<td>${i.price}</td>
										<td>${i.cost}</td>
										<td>${i.shipping_cost}</td>
										<td style="border-left: 2px solid silver">${i.option1 }</td>
										<td>${i.option2 }</td>
										<td>${i.inventory }</td>
										<td style="border-right: 2px solid silver;">
											${i.add_price }</td>

										<td>${i.lv1}-${i.lv2}-${i.lv3}</td>

										<c:if test="${ i.public_state } == true">
											공개
										</c:if>

										<td><c:if test="${ i.public_state  == true}">
											공개
										</c:if> <c:if test="${ i.public_state  != true}">
											 비공개
										</c:if></td>
										<td><c:if test="${ i.review_state  == true}">
											공개
										</c:if> <c:if test="${ i.review_state  != true}">
											 비공개
										</c:if></td>
										<td class="center"><a class="btn btn-success detailmdl" 
											data-toggle="modal" data-target=".bd-example-modal-lg"> <img
												src="http://localhost:8080/controller/resources/icons/search.svg"
												alt="" width="20" height="20" title="Bootstrap"> <img
												src="http://localhost:8080/controller/resources/icons/pencil.svg"
												alt="" width="20" height="20" title="Bootstrap">
												
												
										</a> <a class="btn btn-danger" href="#"> <img
												src="http://localhost:8080/controller/resources/icons/trash-fill.svg"
												alt="" width="20" height="20" title="Bootstrap">
										</a></td>


										<!-- 모달시작 -->
									<div class="modal fade bd-example-modal-lg" tabindex="-1"
											role="dialog" aria-labelledby="myLargeModalLabel" id="modalplus"
											aria-hidden="true">
										<div class="modal-dialog modal-lg" role="document" >
											 		<div class="modal-content">
												<%-- 		<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">상품
															상세보기 및 수정</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														상품코드 : ${i.product_code }

														<div class="card-body">

															<form>
																<input type="hidden" name="${_csrf.parameterName}"
																	value="${_csrf.token}" />

																<div class="form-group row">
																	<label for="product_name"
																		class="col-sm-2 col-form-label">상품명</label>
																	<div class="col-sm-10">
																		<input type="text" class=" form-control"
																			name="product_name" value="${i.product_name }">

																		<div class="invalid-tooltip">필수 입력 사항 / 리스트에 노출될
																			상품명을 입력해주세요</div>

																	</div>
																</div>
																<div class="form-group row">
																	<label for="price" class="col-sm-2 col-form-label">판매가</label>
																	<div class="col-sm-10">
																		<input type="text" class="form-control" name="price"
																			value="${i.price}">

																		<div class="invalid-tooltip">필수 입력 사항 / 소비자에게
																			판매할 금액을 입력해주세요</div>
																	</div>
																</div>

																<div class="form-group row">
																	<label for="cost" class="col-sm-2 col-form-label">원가</label>
																	<div class="col-sm-10">
																		<input type="text" class="form-control " name="cost"
																			value="${i.cost}">
																		<div class="invalid-tooltip">필수 입력 사항 / 상품 입고
																			원가를 입력해주세요</div>
																	</div>
																</div>

																<div class="form-group row">
																	<label for="shipping_cost"
																		class="col-sm-2 col-form-label">배송비</label>
																	<div class="col-sm-10">
																		<input type="text" class="form-control "
																			name="shipping_cost" value="${i.shipping_cost}">
																		<div class="invalid-tooltip">필수 입력 사항 / 1회 배송비를
																			입력해주세요</div>
																	</div>
																</div>
																<div>

																	<div class="form-group row">
																		<label for="options" class="col-sm-2 col-form-label">옵션</label>
																		<div class="col-sm-12">
																			<div class="col-sm-2 frmsort">
																				<label for="options[0].option1"
																					class=" col-form-label">옵션1</label> <input
																					type="text" class="form-control "
																					name="options[0].option1" placeholder="ex)색상 ,,"
																					value="${i.option1}">
																			</div>
																			<div class="col-sm-2 frmsort">
																				<label for="options[0].option2"
																					class=" col-form-label">옵션2</label> <input
																					type="text" class="form-control "
																					name="options[0].option2" placeholder="ex)사이즈 ,,"
																					value="${i.option2}">
																			</div>
																			<div class="col-sm-2  frmsort">
																				<label for="options[0].inventory"
																					class="  col-form-label">재고</label> <input
																					type="text" class="form-control "
																					name="options[0].inventory" value="${i.inventory}">
																				<div class="invalid-tooltip">필수 입력 사항 / 재고량을
																					입력해주세요</div>

																			</div>
																			<div class="col-sm-2 frmsort">
																				<label for="options[0].add_price"
																					class=" col-form-label">추가 금액</label> <input
																					type="text" class=" form-control"
																					name="options[0].add_price" value="${i.add_price}">
																				<div class="invalid-tooltip">필수 입력 사항 / 추가금액이
																					없을시 0 입력</div>
																			</div>

																		</div>
																	</div>

																</div>

																<div id="addoptions"></div>


																<div class="form-group row">
																	<label for="inputEmail3"
																		class="col-sm-2 col-form-label">카테고리</label>
																	<div class="col-sm-10">
																		<select class="custom-select" name="category_code"
																			data-rel="chosen">
																			<option value=""></option>
																			<option selected disabled value="">분류 선택</option>

																			<c:forEach var="i" items="${dlist}">
																				<option value="${i.category_code}">${i.lv123}</option>
																			</c:forEach>

																		</select>
																	</div>
																</div>

																<div>
																	<img src=" ${i.detail_img1}">
																</div>


																<div class="form-group row">
																	<label for="athumb_img" class="col-sm-2 col-form-label">썸네일
																		이미지</label>
																	<div class="col-sm-10">
																		<div class="custom-file">
																			<input type="file"
																				class="custom-file-input upload-hidden"
																				name="athumb_img"> <label
																				class="custom-file-label upload-file"
																				for="adetail_img2">이미지 파일 선택 (가로 550px * 세로
																				750px 권장)</label>

																		</div>
																	</div>


																	<label for="inputEmail3"
																		class="col-sm-2 col-form-label">상세 이미지 1</label>
																	<div class="col-sm-10">
																		<div class="custom-file">
																			<input type="file"
																				class="custom-file-input upload-hidden"
																				name="adetail_img1"> <label
																				class="custom-file-label upload-file"
																				for="adetail_img1">이미지 파일 선택</label>

																		</div>
																	</div>

																	<label for="inputEmail3"
																		class="col-sm-2 col-form-label">상세 이미지 2</label>
																	<div class="col-sm-10">
																		<div class="custom-file">
																			<input type="file"
																				class="custom-file-input upload-hidden"
																				" name="adetail_img2"> <label
																				class="custom-file-label upload-file"
																				for="adetail_img2">이미지 파일 선택</label>

																		</div>
																	</div>

																	<label for="inputEmail3"
																		class="col-sm-2 col-form-label">상세 이미지 3</label>
																	<div class="col-sm-10">
																		<div class="custom-file">
																			<input type="file"
																				class="custom-file-input upload-hidden"
																				name="adetail_img3"> <label
																				class="custom-file-label upload-file"
																				for="adetail_img3">이미지 파일 선택</label>

																		</div>
																	</div>

																</div>

																<div class="form-group row">
																	<label for="inputEmail3"
																		class="col-sm-2 col-form-label">상품 설명</label>
																	<div class="col-sm-10">
																		<textarea class="summernote" name="explains">${i.explains}</textarea>
																	</div>
																</div>

																<div class="form-group row">
																	<div class="col-sm-2">공개 여부</div>
																	<div class="col-sm-10">
																		<div class="form-check">
																			<input class="form-check-input" type="checkbox"
																				name="public_state" value="1" checked=""> <label
																				class="form-check-label" for="gridCheck1">
																				상품을 공개 할 경우 체크 </label>

																		</div>
																		<div class="form-check">
																			<input class="form-check-input" type="checkbox"
																				name="review_state" value="1" checked=""> <label
																				class="form-check-label" for="gridCheck1">
																				상품에 대한 리뷰를 공개 할 경우 체크 </label>
																		</div>
																	</div>
																</div>


																<div class="form-group row">
																	<div class="col-sm-10">
																		<button type="submit" class="btn btn-primary">Sign
																			in</button>
																	</div>
																</div>

															</form>
														</div>





													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Save
															changes</button>
													</div> --%>
												</div>
										</div>
											
											
									</div> 
								</tr>
								</c:forEach>



							</tbody>
						</table>
					</form>

					<c:if test="${page.prev}">
						<a
							href="productlist?currPage=${page.startBlock-1}&psize=${page.sizePerPage}&txt=${page.txt}">이전</a>
					</c:if>

					<c:forEach var="i" begin="${page.startBlock}"
						end="${page.endBlock}">
						<c:if test="${i == page.currPage}">
		${i}
		</c:if>
						<c:if test="${i != page.currPage }">
							<a
								href="productlist?currPage=${i}&psize=${page.sizePerPage}&txt=${page.txt}">${i}</a>
						</c:if>
					</c:forEach>


					<c:if test="${page.next}">
						<a
							href="productlist?currPage=${page.endBlock+1}&psize=${page.sizePerPage}&txt=${page.txt}">다음</a>
					</c:if>

				</div>
			</div>
		</div>
	</div>

</body>
</html>