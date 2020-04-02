<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<script>
	
	window.onload=function(){
		
		let result= ${result};
		
		if(result>0){
			alert('회원 탈퇴가 완료되었습니다.');
			location.href="${pageContext.request.contextPath}/userlogout";
		}else{
			alert('회원 탈퇴가 실패하였습니다.');
		}
		
	}


</script>
</head>
<body>

</body>
</html>