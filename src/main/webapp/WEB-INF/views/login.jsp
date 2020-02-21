<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

</head>
<style>
	ul li{
	list-style : none;}
</style>
<body>
	<div class="mx-auto mt-5" style="width: 400px;">
	
		<form method="post" action="http://localhost:8080/controller/">
			<ul>
			<li><a href="http://localhost:8080/controller/"><img alt="home" src="http://localhost:8080/controller/resources/img/logo.png"></a>
			</li>
				<li><label for="id"></label> 
				<input type="text" name="id" id="id" required="required" placeholder="아이디"></li>

				<li><label for="id"></label> 
				<input type="password" name="pwd" id="pwd" required="required" placeholder="비밀번호는 6자 이상 ~ 20자 이하"></li>

				<li><input class="btn btn-secondary" type="submit" value="로그인"></li>
				
				<li><a href="${apiURL}"><img height="40" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				</li>
			
			</ul>
		</form>
			  
	</div>
</body>
</html>