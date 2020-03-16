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
select option{

height:110px;

}
#option_pink{
background-color: pink;
}
#option_purple{
height:50px;
background-color: purple;
}
#option_silver{
height:50px;
background-color: silver;
}
#option_black{
height:50px;
background-color: black;
}
#option_green{
height:50px;
background-color: green;
}

</style>

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
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">


				<!-- 내용 -->

				<form>
					<div class="form-row">



						<div class="form-group row">
							<label for="athumb_img" class="col-sm-2 col-form-label">공지
								이미지1</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input type="file" class="custom-file-input upload-hidden"
										id="athumb_img" name="athumb_img" required>
										 <label
										class="custom-file-label upload-file" for="adetail_img2">이미지
										파일 선택 (가로 550px * 세로 750px 권장)</label>

								</div>
							</div>


							<label for="inputEmail3" class="col-sm-2 col-form-label">공지
								이미지2</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input type="file" class="custom-file-input upload-hidden"
										id="adetail_img1" name="adetail_img1" required> <label
										class="custom-file-label upload-file" for="adetail_img1">이미지
										파일 선택</label>

								</div>
							</div>

							<label for="inputEmail3" class="col-sm-2 col-form-label">공지
								이미지3</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input type="file" class="custom-file-input upload-hidden"
										id="adetail_img2" name="adetail_img2" required> <label
										class="custom-file-label upload-file" for="adetail_img2">이미지
										파일 선택</label>

								</div>
							</div>

							<label for="inputEmail3" class="col-sm-2 col-form-label">상세
								이미지 3</label>
							<div class="col-sm-10">
								<div class="custom-file">
									<input type="file" class="custom-file-input upload-hidden"
										id="adetail_img3" name="adetail_img3" required> <label
										class="custom-file-label upload-file" for="adetail_img3">이미지
										파일 선택</label>

								</div>
							</div>

						</div>
						<label for="inputState"  class="col-sm-2 col-form-label">State</label>
						<div class="form-group col-md-10">
							 <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option value="pink" id="option_pink" >분홍</option>
								<option value="purple" id="option_purple">보라</option>
								<option value="silver" id="option_silver">은색</option>
								<option value="black" id="option_blakc">검정</option>
								<option value="green" id="option_green">초록</option>
								<option>...</option>
								<option>...</option>
								<option>...</option>
								<option>...</option>
								<option>...</option>
							</select>
						</div>
						<!-- ㅇㅇㅇ -->
						<div class="form-group col-md-6">
							<label for="inputEmail4">Email</label> <input type="email"
								class="form-control" id="inputEmail4">
						</div>
						<div class="form-group col-md-6">
							<label for="inputPassword4">Password</label> <input
								type="password" class="form-control" id="inputPassword4">
						</div>
					</div>
					<div class="form-group">
						<label for="inputAddress">Address</label> <input type="text"
							class="form-control" id="inputAddress" placeholder="1234 Main St">
					</div>
					<div class="form-group">
						<label for="inputAddress2">Address 2</label> <input type="text"
							class="form-control" id="inputAddress2"
							placeholder="Apartment, studio, or floor">
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="inputCity">City</label> <input type="text"
								class="form-control" id="inputCity">
						</div>
						<div class="form-group col-md-4">
							<label for="inputState">State</label> <select id="inputState"
								class="form-control">
								<option selected>Choose...</option>
								<option>...</option>
							</select>
						</div>
						<div class="form-group col-md-2">
							<label for="inputZip">Zip</label> <input type="text"
								class="form-control" id="inputZip">
						</div>
					</div>
					<div class="form-group">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="gridCheck">
							<label class="form-check-label" for="gridCheck"> Check me
								out </label>
						</div>
					</div>
					<button type="submit" class="btn btn-primary">Sign in</button>
				</form>
				<!-- 내용 끝 -->


			</div>
		</div>
	</div>

</body>
</html>