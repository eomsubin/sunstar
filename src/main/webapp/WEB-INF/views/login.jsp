<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
 $(document).ready(function(){
	 var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "XMKUF7HdU8r3IIu3tMzr",
					callbackUrl: "http://localhost:8080/controller/callback",
					isPopup: false, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 40} /* 로그인 버튼의 타입을 지정 */
				}
			);
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init(); 
 	})
</script>

</head>
<body>
	<div class="mx-auto" style="width: 500px;">
	<form method="post" action="../">
		<ul>
			<li><label for="id">아이디</label>
			<input type="text" name="id" id="id" required="required">
			</li>
			
			<li><label for="id">패스워드</label>
			<input type="password" name="pwd" id="pwd" required="required">
			</li>
			
			<li>
			<div id="naverIdLogin"></div>
			</li>
			
			<li>
			<input class="btn btn-secondary mr-3" type="submit" value="제출"><a class="btn btn-secondary" href="../">홈</a>
			</li>
		</ul>
	</form>
	</div>
</body>
</html>