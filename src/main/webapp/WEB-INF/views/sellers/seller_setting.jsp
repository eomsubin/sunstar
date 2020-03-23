<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
body {
	font-size: 0.77em;
}

select option {
	font-size: 2em;
	font-weight: 700;
}

#opt_a {
	color: #143d59;
	background-color: #f4b41a;
}

#opt_b {
	color: #7bd9c1;
	background-color: #200371;
}

#opt_c {
	color: #ff7129;
	background-color: #2e2f29;
}

#opt_d {
	color: #5b0e2e;
	background-color: #fea982;
}

#opt_e {
	color: #5f0020;
	background-color: #01dbda;
}

#opt_f {
	color: #f3b019;
	background-color: #01164f;
}

#opt_g {
	color: #239135;
	background-color: #ffd65a;
}

#opt_h {
	
}

#opt_l {
	
}

#opt_m {
	
}

#opt_n {
	
}
</style>

<script>
	$(document).ready(function() {

		$('')

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

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">설정</h1>
		<p class="mb-4">
			내 정보를 확인하고 수정 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">사이트 설정</h6>
			</div>
			<div class="card-body">


				<!-- 내용 -->

				<form action="${pageContext.request.contextPath}/seller/settingUpdate"
					method="post" enctype="multipart/form-data">

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-row">

						<div class="row row-cols-1 row-cols-md-3">
							<div class="col mb-3">
								<div class="card">
									<img src="${pageContext.request.contextPath}/${dto.comm_img1}" class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">현재 공지 이미지 1</h5>
										<label for="athumb_img" class="col-sm-6 col-form-label">공지
											이미지1</label>
										<div class="col-sm-14">
											<div class="custom-file">
												<input type="file" class="custom-file-input upload-hidden"
													id="acomm_img1" name="acomm_img1" > <label
													class="custom-file-label upload-file" for="acomm_img1">이미지
													파일 선택 (가로 550px * 세로 750px 권장)</label>

											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="col mb-3">
								<div class="card">
									<img src="${pageContext.request.contextPath}/${dto.comm_img2}" class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">현재 공지 이미지 2</h5>
										<label for="acomm_img2" class="col-sm-6 col-form-label">공지
											이미지2</label>
										<div class="col-sm-14">
											<div class="custom-file">
												<input type="file" class="custom-file-input upload-hidden"
													id="acomm_img2" name="acomm_img2" > <label
													class="custom-file-label upload-file" for="acomm_img2">이미지
													파일 선택 </label>

											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col mb-3">
								<div class="card">
									<img src="${pageContext.request.contextPath}/${dto.comm_img3}" class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title">현재 공지 이미지 3</h5>
										<label for="athumb_img" class="col-sm-6 col-form-label">공지
											이미지1</label>
										<div class="col-sm-14">
											<div class="custom-file">
												<input type="file" class="custom-file-input upload-hidden"
													id="acomm_img3" name="acomm_img3" > <label
													class="custom-file-label upload-file" for="acomm_img3">이미지
													파일 선택</label>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							
						</div>
						<label for="inputState" class="col-sm-2 col-form-label" style="position: relative; left:56px; top:5px;">메인
							컬러 변경</label>
						<div class="form-group col-md-10" style="position: relative; margin-bottom: 35px;">
							<select id="seller_color" name="seller_color"
								class="form-control">
								<option selected>Choose...</option>
								<option value="opt_a" id="opt_a">샘플 컬러 1</option>
								<option value="opt_b" id="opt_b">샘플 컬러 2</option>
								<option value="opt_c" id="opt_c">샘플 컬러 3</option>
								<option value="opt_d" id="opt_d">샘플 컬러 4</option>
								<option value="opt_e" id="opt_e">샘플 컬러 5</option>
								<option value="opt_f" id="opt_f">샘플 컬러 6</option>
								<option value="opt_g" id="opt_g">샘플 컬러 7</option>
							</select>
						</div>

						<input  type="submit" class="btn btn-primary" value="정보업뎃">정보 업데이트</button>
						<div class="col-sm-10" style="text-align: right; margin-left: 100px; bottom:30px;">
							<a href="#"> 구매 회원으로 전환 </a>

						</div>
					</div>
				</form>
				<!-- 내용 끝 -->


			</div>
		</div>
	</div>

</body>
</html>