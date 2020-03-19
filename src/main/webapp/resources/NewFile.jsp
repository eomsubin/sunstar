<div class="modal-header">
	<h5 class="modal-title" id="exampleModalLabel">상품 상세보기 및 수정</h5>
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
				<label for="product_name" class="col-sm-2 col-form-label">상품명</label>
				<div class="col-sm-10">
					<input type="text" class=" form-control" name="product_name"
						value="${i.product_name }">
					<div class="invalid-tooltip">필수 입력 사항 / 리스트에 노출될 상품명을 입력해주세요</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="price" class="col-sm-2 col-form-label">판매가</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="price"
						value="${i.price}">
					<div class="invalid-tooltip">필수 입력 사항 / 소비자에게 판매할 금액을 입력해주세요</div>
				</div>
			</div>

			<div class="form-group row">
				<label for="cost" class="col-sm-2 col-form-label">원가</label>
				<div class="col-sm-10">
					<input type="text" class="form-control " name="cost"
						value="${i.cost}">
					<div class="invalid-tooltip">필수 입력 사항 / 상품 입고 원가를 입력해주세요</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="shipping_cost" class="col-sm-2 col-form-label">배송비</label>
				<div class="col-sm-10">
					<input type="text" class="form-control " name="shipping_cost"
						value="${i.shipping_cost}">
					<div class="invalid-tooltip">필수 입력 사항 / 1회 배송비를 입력해주세요</div>
				</div>
			</div>
			<div>
				<div class="form-group row">
					<label for="options" class="col-sm-2 col-form-label">옵션</label>
					<div class="col-sm-12">
						<div class="col-sm-2 frmsort">
							<label for="options[0].option1" class=" col-form-label">옵션1</label>
							<input type="text" class="form-control "
								name="options[0].option1" placeholder="ex)색상 ,,"
								value="${i.option1}">
						</div>
						<div class="col-sm-2 frmsort">
							<label for="options[0].option2" class=" col-form-label">옵션2</label>
							<input type="text" class="form-control "
								name="options[0].option2" placeholder="ex)사이즈 ,,"
								value="${i.option2}">
						</div>
						<div class="col-sm-2  frmsort">
							<label for="options[0].inventory" class="  col-form-label">재고</label>
							<input type="text" class="form-control "
								name="options[0].inventory" value="${i.inventory}">
							<div class="invalid-tooltip">필수 입력 사항 / 재고량을 입력해주세요</div>
						</div>
						<div class="col-sm-2 frmsort">
							<label for="options[0].add_price" class=" col-form-label">추가
								금액</label> <input type="text" class=" form-control"
								name="options[0].add_price" value="${i.add_price}">
							<div class="invalid-tooltip">필수 입력 사항 / 추가금액이 없을시 0 입력</div>
						</div>

					</div>
				</div>
			</div>
			<div id="addoptions"></div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">카테고리</label>
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
						<input type="file" class="custom-file-input upload-hidden"
							name="athumb_img"> <label
							class="custom-file-label upload-file" for="adetail_img2">이미지
							파일 선택 (가로 550px * 세로 750px 권장)</label>
					</div>
				</div>
				<label for="inputEmail3" class="col-sm-2 col-form-label">상세
					이미지 1</label>
				<div class="col-sm-10">
					<div class="custom-file">
						<input type="file" class="custom-file-input upload-hidden"
							name="adetail_img1"> <label
							class="custom-file-label upload-file" for="adetail_img1">이미지
							파일 선택</label>
					</div>
				</div>
				<label for="inputEmail3" class="col-sm-2 col-form-label">상세
					이미지 2</label>
				<div class="col-sm-10">
					<div class="custom-file">
						<input type="file" class="custom-file-input upload-hidden"
							" name="adetail_img2"> <label
							class="custom-file-label upload-file" for="adetail_img2">이미지
							파일 선택</label>
					</div>
				</div>
				<label for="inputEmail3" class="col-sm-2 col-form-label">상세
					이미지 3</label>
				<div class="col-sm-10">
					<div class="custom-file">
						<input type="file" class="custom-file-input upload-hidden"
							name="adetail_img3"> <label
							class="custom-file-label upload-file" for="adetail_img3">이미지
							파일 선택</label>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">상품
					설명</label>
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
							class="form-check-label" for="gridCheck1"> 상품을 공개 할 경우 체크
						</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox"
							name="review_state" value="1" checked=""> <label
							class="form-check-label" for="gridCheck1"> 상품에 대한 리뷰를 공개
							할 경우 체크 </label>
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
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	<button type="button" class="btn btn-primary">Save changes</button>
</div>
