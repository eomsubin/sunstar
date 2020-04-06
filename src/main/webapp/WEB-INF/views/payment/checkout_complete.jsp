<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
<script>
	
	var complete = confirm('결제가 완료되었습니다. 주문내역 페이지로 이동하시겠습니까?');
	
	if(complete){
		location.href="${pageContext.request.contextPath}/mypage/order";
		
	}else{
		location.href="${pageContext.request.contextPath}/";
	}

</script>
</head>
<body>
	

</body>
</html>