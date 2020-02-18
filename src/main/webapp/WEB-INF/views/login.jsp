<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
${state}
	<div class="mx-auto" style="width: 500px;">
		<form method="post" action="http://localhost:8080/controller/">
			<ul>
				<li><label for="id">아이디</label> <input type="text" name="id"
					id="id" required="required"></li>

				<li><label for="id">패스워드</label> <input type="password"
					name="pwd" id="pwd" required="required"></li>

				<li>
					  <a href="${apiURL}"><img height="40" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
				</li>

				<li><input class="btn btn-secondary mr-3" type="submit"
					value="제출"><a class="btn btn-secondary" href="http://localhost:8080/controller/">홈</a></li>
			</ul>
		</form>
	</div>
</body>
</html>