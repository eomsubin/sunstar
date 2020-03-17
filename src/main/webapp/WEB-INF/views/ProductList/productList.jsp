<%@page import="java.util.ArrayList"%>
<%@page import="com.sunstar.dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	.col-left{
    overflow: visible;
    min-width: 158px;
    border-right: 2px solid #dadada;
    
	}
	.col-right{
	min-width: 918px;
	}
	.row{
	min-width: 1080px;
	}
	.lefttxt{
	line-height: 20px;	
	}
	.lv1txt, .currlv2, .currlv3{
	font-weight:700; 
	}
	.lv2txt, .currlv2{
	margin-left: 12px;
	}	
	.lv3txt, .currlv3{
	margin-left: 24px;
	}
	.lv2txt:hover, .lv3txt:hover, .pitem:hover{
	color: #fbab60;
	}
	
</style>
</head>
<body>
<div class="row" style="max-width: 1660px;">
	<div class="col-left col-2 pl-5 py-1 my-3 lefttxt">
		<!-- lv1 -->
		<c:if test="${empty lv2}"><span class="lv1txt">${lv1}</span></c:if>
		<c:if test="${not empty lv2}"><a href="${pageContext.request.contextPath}/category/${lv1}"><span class="lv1txt">${lv1}</span></a></c:if> 
		<ul>
		
		<!-- lv2 -->
		<c:forEach var="categorylv2" items="${categorylistlv2}">
			<!-- 다른 경로 lv2 -->
			<c:if test="${categorylv2.lv2code ne lv2}">
			<li class="lv2txt"><span><a href="${pageContext.request.contextPath}/category/${lv1}/${categorylv2.lv2code}">${categorylv2.lv2}</a></span></li>
			</c:if>
		
			<!-- 같은 경로 lv2 -->
			<c:if test="${categorylv2.lv2code eq lv2}">
			<c:if test="${empty lv3}"><li class="currlv2"><span>${categorylv2.lv2}</span></li></c:if>
			<c:if test="${not empty lv3}"><li ><a class="currlv2" href="${pageContext.request.contextPath}/category/${lv1}/${lv2}"><span>${categorylv2.lv2}</span></a></li></c:if>			
				<!-- lv3 -->
				<c:forEach var="categorylv3" items="${categorylistlv3}">
					<c:if test="${lv3 eq categorylv3.category_code}"><li class="currlv3"><span>${categorylv3.lv3}</span></li></c:if>		
					<c:if test="${lv3 ne categorylv3.category_code}"><li class="lv3txt"><a href="${pageContext.request.contextPath}/category/${lv1}/${categorylv2.lv2code}/${categorylv3.category_code}">${categorylv3.lv3}</a></li></c:if>
				</c:forEach>
			</c:if>
		</c:forEach>
		</ul>
	</div>
	
	<div class="col-right col-10 p-0">
		${productlist[0]}
		<ol class="plist">
		</ol>
		<c:forEach var="plist" items="${productlist}">
		<span class="pitem"><a href="${pageContext.request.contextPath}/detailview2?product_code=${plist.product_code}">${plist.product_name} ${plist.explains}</a></span>
		<span><fmt:formatNumber pattern="###,###,###" value="${plist.price}" />원</span>
		<br>
		</c:forEach>
	</div>
	</div>
</body>
</html>