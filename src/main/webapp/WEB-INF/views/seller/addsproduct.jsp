<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.threeoptions{
		width:280px;
		padding:3px;
		margin : 5px;
		margin-bottom: 5px !important;
	}
</style>

<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<script>

$(document).ready(function(){
	let i = 1;
	$('#addoption').on('click', function(){
		
let frm ='';                                                                         
frm+='	<div class="control-group threeoptions">                                              ';
frm+='	<label class="control-label" for="Option">옵션'+ i +'</label>                  ';
frm+='	<div class="controls">                                                                ';
frm+='	<div class="input-prepend">                                                           ';
frm+='	<span class="add-on">컬러</span><input id="option_color" name="options['+i+'].color" size="16" type="text">      ';
frm+='	</div><p class="help-block"></p></div></div>                                          ';

frm+='	<div class="control-group threeoptions">                                              ';
frm+='	<label class="control-label" for="prependedInput"></label>                            ';
frm+='	<div class="controls">                                                                ';
frm+='	<div class="input-prepend">                                                           ';
frm+='	<span class="add-on">사이즈</span><input id="option_size1" name="options['+i+'].size"size="16" type="text">     ';
frm+='	</div><p class="help-block"></p></div></div>                                          ';

frm+='	<div class="control-group threeoptions">                                              ';
frm+='	<label class="control-label" for="prependedInput"></label>                            ';
frm+='	<div class="controls">                                                                ';
frm+='	<div class="input-prepend">                                                           ';
frm+='	<span class="add-on">재고</span><input id="inventory" name="options['+i+'].inventory"size="16" type="text">      ';
frm+='	</div><p class="help-block"></p></div></div>                                          ';

frm+='	<div class="control-group threeoptions">                                               ';
frm+='	<label class="control-label" for="add_price1"></label>                                 ';
frm+='	<div class="controls">                                                                 ';
frm+='	<div class="input-prepend">                                                            ';
frm+='	<span class="add-on">추가금액</span><input id="add_price" name="options['+i+'].add_price" size="16" type="text">         ';
frm+='	<span class="add-on">원</span></div><p class="help-block"></p></div></div>              ';
		i++;
		$('#addoptions').append(frm);
	})
})

</script>
</head>
<body>
	<noscript>
		<div class="alert alert-block span10">
			<h4 class="alert-heading">Warning!</h4>
			<p>
				You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
					target="_blank">JavaScript</a> enabled to use this site.
			</p>
		</div>
	</noscript>

	<!-- start: Content -->
	<div id="content" class="span10">


		<ul class="breadcrumb">
			<li><i class="icon-home"></i> <a href="index.html">Home</a> <i
				class="icon-angle-right"></i></li>
			<li><i class="icon-edit"></i> <a href="#">Forms</a></li>
		</ul>

		<div class="row-fluid sortable">
			<div class="box span12">
				<div class="box-header" data-original-title>
					<h2>
						<i class="halflings-icon white edit"></i><span class="break"></span>상품 추가
					</h2>
					<div class="box-icon">
						<a href="#" class="btn-setting"><i
							class="halflings-icon white wrench"></i></a> <a href="#"
							class="btn-minimize"><i
							class="halflings-icon white chevron-up"></i></a> <a href="#"
							class="btn-close"><i class="halflings-icon white remove"></i></a>
					</div>
				</div>
				<div class="box-content">
					<form class="form-horizontal" action="${pageContext.request.contextPath}/addproductresult" method="post">
						<fieldset>
							<div class="control-group">
								<label class="control-label" for="product_name" >상품명 </label>
								<div class="controls">
									<input type="text" class="span6 typeahead" name="product_name" id="product_name"
										data-provide="typeahead" data-items="4"
										data-source='["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Dakota","North Carolina","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin","Wyoming"]'>
									<p class="help-block">리스트에 노출 할 상품 제목을 입력해 주세요</p>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="price">가격</label>
								<div class="controls">
									<div class="input-append">
										<input id="appendedInput" size="16" type="text"  name="price" id="price"><span
											class="add-on">원</span>
									</div>
									<span class="help-inline">Here's more help text</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="cost">원가</label>
								<div class="controls">
									<div class="input-append">
										<input id="appendedInput" size="16" type="text"  name="cost" id="cost"><span
											class="add-on">원</span>
									</div>
									<span class="help-inline">Here's more help text</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="shipping_cost">배송비</label>
								<div class="controls">
									<div class="input-append">
										<input id="appendedInput" size="16" type="text" name="shipping_cost" id="shiopping_cost"><span
											class="add-on">원</span>
									</div>
									<span class="help-inline">Here's more help text</span>
								</div>
							</div>


							<div>
								<div class="control-group threeoptions">
									<label class="control-label" for="options[0].option_color">옵션</label>
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">컬러</span><input id="option_color" name="options[0].color"
												size="16" type="text"> 
							<button id="addoption" type="button"> + 옵션 추가</button>
										</div>
										<p class="help-block"></p>
									</div>
								</div>
								<div class="control-group threeoptions">
									<label class="control-label" for="options[0].option_size"></label>
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">사이즈</span><input id="option_size" name="options[0].size" size="16" type="text">
										</div>
										<p class="help-block"></p>
									</div>
								</div>
								<div class="control-group threeoptions">
									<label class="control-label" for="options[0].inventory"></label>
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">재고</span><input id="inventory" name="options[0].inventory" size="16" type="text">
										</div>
										<p class="help-block"></p>
									</div>
								</div>
								<div class="control-group threeoptions">
									<label class="control-label" for="options[0].add_price"></label>
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">추가금액</span><input id="add_price" name="options[0].add_price" size="16" type="text"><span
											class="add-on">원</span>
										</div>
										<p class="help-block"></p>
									</div>
								</div>
								
							</div>
							
							<div id="addoptions">
							
							</div>


							<div class="control-group">
								<label class="control-label" for="category_code">카테고리</label>
								<div class="controls">
									<select data-placeholder="상품 카테고리 선택"
										name="category_code" id="category_code" data-rel="chosen">
										<option value=""></option>
										
										<c:forEach var="i" items="${dlist}">
											<option value="${i.category_code}">${i.lv123}</option>
																						
										</c:forEach>
									
									</select>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="thumb_img">썸네일 이미지 첨부</label>
								<div class="controls">
									<input class="input-file uniform_on" id="thumb_img" name="thumb_img" type="file">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="detail_img1">상세 이미지 첨부</label>
								<div class="controls">
									<input class="input-file uniform_on" id="detail_img1" name="detail_img1" type="file">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="detail_img2">상세 이미지 첨부</label>
								<div class="controls">
									<input class="input-file uniform_on" id="detail_img2" name="detail_img2" type="file">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="detail_img3">상세 이미지 첨부</label>
								<div class="controls">
									<input class="input-file uniform_on" id="detail_img3" name="detail_img3"type="file">
								</div>
							</div>


							<div class="control-group hidden-phone">
								<label class="control-label" for="explains">상품 상세정보</label>
								<div class="controls">
									<textarea class="cleditor" id="explains" name="explains" rows="3"></textarea>
								</div>
							</div>


							<div class="control-group">
								<label class="control-label">공개여부 체크</label>
								<div class="controls">
									<label class="radio"> <input type="checkbox"
										name="public_state" id="public_state" value="1"
										checked=""> 상품을 공개 할 경우 체크
									</label>
									<div style="clear: both"></div>
									<label class="radio"> <input type="checkbox"
										name="review_state" id="review_state" value="1">
										상품에 대한 리뷰를 공개 할 경우 체크
									</label>
								</div>
							</div>
							
							<!-- 셀러코드 -->

							<input type="hidden" name="seller_code" id="seller_code" value="11111">
							

							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<div class="form-actions">
								<button type="submit" class="btn btn-primary">상품 등록</button>
								<button type="reset" class="btn">취소</button>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
			<!--/span-->

		</div>
		<!--/row-->

	</div>
	<!--/.fluid-container-->

	<!-- end: Content -->
	</div>
	<!--/#content.span10-->
	</div>
	<!--/fluid-row-->

	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
				class="btn btn-primary">Save changes</a>
		</div>
	</div>

	<div class="clearfix"></div>
</body>
</html>