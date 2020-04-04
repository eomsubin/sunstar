<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">

</head>
<script>
	function review(){
		let order_no = "${detail.order_no}"
		let review_content = $('#comment').val();
		let review_star = 3;
	 	opener.jusoCallBack(review_content, order_no, review_star);      
	  	window.close();
	}
	
	$(document).ready(function(){
		var starRating = function(){
			  var $star = $(".star-input"),
			      $result = $star.find("output>b");
			  $(document)
			    .on("change", ".star-input :radio", function(){
			    $result.text($(this).parent().text());
			  })
			    .on("mouseover", ".star-input label", function(){
				    $result.text($(this).text());
			  		var $checked = $star.find(":checked");
				    $(this).addClass("yellow");
				    $(this).prevAll().addClass("yellow");
			  })
			  	.on("mouseleave", ".star-input label", function(){
			  		var $checked = $star.find(":checked");
			    	if($checked.length === 0){
			    		$(this).siblings().removeClass("yellow");
				    	$(this).removeClass("yellow");
			    	}
			  })
			    .on("mouseleave", ".star-input>.input", function(){
			    	var $checked = $star.find(":checked");
			    
			    	if($checked.length === 0){
			    		$result.text("별점을 매겨주세요");
			    	} else {
			    		$result.text($checked.parent().text());
			    		$checked.nextAll().removeClass("yellow");
			    	}
			  });
			};
			starRating();
	});
	
</script>
<style>
	h1 {
	 color: white;
	 background-color: #fbab60;
	 font-size: 30px;
	 padding: 10px 0px;
	}
	img{
		width: 110px;
		height: 150px;
	}
	.content{
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 17px;
    margin-top: 8px;
    font-size: 14px;
    font-weight: normal;
	}
	div .seller{
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 18px;
    white-space: nowrap;
    font-size: 13px;
    color: #bbb;
	}
	div .sellerbox{
	display: 
	}
	.topcontent{
	border-bottom: 3px solid #fbab60;
	}
	button{
	color : white;
    border-color: #fbab60 !important;
    background: #fbab60 !important;
    height: 60px; 
	margin: 10px auto;
	display: flex;
	padding : 0px 50px;
	margin-top: 50px;
	}
	.yellow{
    color: #F7941D;
	}
	ul li{
		display: inline-block;	
	}
	ul {
	    list-style: none;
		padding: 0;		
    	margin: 0;
	}
	label{
		font-size: 0px;
	}
	i{
		font-size: 25px;
	}
	.input {overflow:hidden;display:inline-block;position:relative;height:26px;box-sizing:border-box;cursor:pointer;}
	.input input {overflow:hidden;display:none;width:0px;height:0px;border:0 none;font-size:0;line-height:0;clip:rect(0 0 0 0);opacity:0;}
</style>
<body>
<h1 class="text-center">상품평 작성</h1>
	<div class="container">
		<div class="row topcontent pb-3">
			<div class="col-3">
			<img class="loadimg" alt="thumb_img" src="${pageContext.request.contextPath }/${detail.thumb_img}">
			</div>
			<div class="col-9 pt-5">
			<span class="seller">[${detail.seller_name}]</span><br>
			<span class="content">${detail.product_name} (${detail.option1}${detail.option2}) [${detail.quantity}개]</span>
			</div>
		</div>
		<form method="post" action="#">
<!-- 		<div class="mx-auto mt-3" style="width: 100px;">
		<ul class="mx-auto">
				<li><i class="ti-star"></i></li>			
				<li><i class="ti-star"></i></li>
				<li><i class="ti-star"></i></li>
				<li><i class="ti-star"></i></li>
				<li><i class="ti-star"></i></li>
		</ul>	  	
		</div> -->
		<div class="form-group mx-auto mt-3" style="width: 150px;">
		<label for="reply_star">별점</label>
			<span class="star-input">
				<span class="input">
		    			<label for="p1">형편없어요<input type="radio" name="star" id="p1" value="1"><i class="ti-star"></i></label>
		    			<label for="p2">쓸만해요<input type="radio" name="star" id="p2" value="2"><i class="ti-star"></i></label>
			   			<label for="p3">보통이에요<input type="radio" name="star" id="p3" value="3"><i class="ti-star"></i></label>
			  			<label for="p4">좋아요!<input type="radio" name="star" id="p4" value="4"><i class="ti-star"></i></label>
		    			<label for="p5">최고에요!!<input type="radio" name="star" id="p5" value="5"><i class="ti-star"></i></label>
		  		</span>
		  				<br><output for="star-input" class="ml-3 content"><b>별점을 매겨주세요</b></output>						
			</span>
		</div>
		<div class="form-group">
			<textarea class="form-control mt-4" rows="5" id="comment" name="comment" placeholder="최소 10자 이상 입력해주세요."></textarea>
		</div>
		<button onclick="review()">등록</button>	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	</div>
</body>
</html>