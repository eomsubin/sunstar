<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">카테고리</h1>
		<p class="mb-4">
			카테고리를 추가 할 수 있습니다.
		</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">카테고리 설정</h6>
			</div>
			<div class="card-body">
				<!-- 여기 내부만 수정하시면 됩니다  -->
				<div class="form-group">
					<label for="exampleFormControlSelect2">1차 분류</label> 
					<select multiple class="form-control"
						id="exampleFormControlSelect2">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect2">2차 분류</label> <select multiple class="form-control"
						id="exampleFormControlSelect2">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="form-group">
					<label for="exampleFormControlSelect2">3차 분류</label> <select multiple class="form-control"
						id="exampleFormControlSelect2">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>


				<!-- 여기 내부만 수정하시면 됩니다  -->
			</div>
		</div>
	</div>
</body>
</html>