<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
ul li{
display: inline-block
}

.test{
padding: 12px 15px 15px;
margin-bottom : 12px;
background: #fafafa;
border:1px solid #f2f2f2;
border-bottom: 1px solid #cccccc;
color : rgb(102, 102, 102);

}
.toptest{
border-bottom: 1px dotted #e2e2e3;
margin-bottom: 11px;
line-height:20px;
padding: 0px 0px 12px;
font-size : 15px !important;
color : #233549 !important;
}

.numBox{
width: 36px;
    height: 28px;
    border: 1px solid #cccccc;
    line-height: 19px;
    color: #233549;
    font-size: 14px;
    text-align: center !important;
    padding: 0px !important;
    border-radius: 0px !important;
    }
 
 .plus{
 
 width: 25px;
 height: 28px;
 border-radius: 0px !important;
 background-color: #ffffff;
 border-left: 0;
 }


 .minus{

 width: 25px;
 height: 28px;
 border-radius: 0px !important;
 background-color: #ffffff;
 border-right: 0;
 }

.selprice {
    
    color: #222;
    font-size: 18px !important;
    font-weight: bold;
}

.units{
  color: #757575;
    font-size: 18px !important;
    font-weight: bold;
    display: block;
    
}


.bottomtest{
 display: block;
    float: right;

}

#optiondel{
width: 12px;
height: auto;
background-color: #fafafa;
border: 0;


}

#optiondel img{
align-items: center;
margin-bottom: 4px;
margin-left: 6px
}

.ctotal{
font-size: 21px;
font-weight: bolder;
text-align-last: end;
color:#222 
}

.total{
color:#222;
font-stretch: wider;
margin-left: 10px;

}

.vip-tabnavi {
    width: 100%;
    clear: both;
    background: #a9b3bc;
}
.vip-tabwrap {
    min-width: 100%;
    margin: 0 auto;
    padding-top:40px;
    position: relative;
    clear: both;
    z-index: 2;
}
.vip-tab_container {
    position: relative;
    z-index: 10;  
    overflow: hidden;
    width: 100%;
    margin: 0 auto;
	padding: 1% 10%;    
}
.vip-tab img{
	width: 100%;
	height: auto;
	display: block;
}
.box__detail-more {
    bottom: 0;
    left: 0;
    width: 100%;
    height: 208px;
    background-color: #fff;
}
.box__detail-more .button__detail-more { 
    display: block;
    width: 320px;
    height: 64px;
    margin: 48px auto 0;
    background-color: #fbab60;
    box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
    border: solid 1px #fbab60;
    border-radius: 50px;
    color: #fff;
    font-size: 23px;
    font-weight: bold;
    text-align: center;
}
.tit_productinfo {
    font-size: 23px;
    line-height: 20px;
    letter-spacing: -1px;
    padding-bottom: 12px;
    border-bottom: 1px solid #a4a9b0;
}
.tit_productinfo span {
    margin-left: 5px;
    font-size: 12px;
    font-weight: 400;
    letter-spacing: initial;
    line-height: 22px;
    color: #777;
}
.box__product-notice .box__product-notice-list {
    position: relative;
}
table{
	font-family: Tahoma,'Noto Sans Korean', 'Malgun Gothic', '맑은 고딕', AppleSDGothicNeo, Helvetica, dotum, 돋움, sans-serif;
	border-bottom: 1px solid #b1b5b9;
}
.vip-detailarea_productinfo {
    width: 100%;
}

.table_productinfo th {
    padding: 5px 0 5px 21px;
    color: #222;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: -0.5px;
    text-align: left;
}
.table_productinfo td{
    padding: 5px 0 3px 0;
    line-height: 23px;
    color: #777;
    letter-spacing: -0.5px;
    vertical-align: top;
}
.vip-tabcontent_lt .precautions, .vip-tabcontent_lt .reportbox {
    float: left;
    width: 45%;
    margin-right: 28px;
    margin-bottom: 50px;
    line-height: 22px;
    letter-spacing: -1px;
}
.vip-tabcontent_lt .precautions strong, .vip-tabcontent_lt .reportbox strong {
    display: inline-block;
    margin-bottom: 12px;
    font-size: 23px; 
    line-height: 20px; 
    letter-spacing: -1px;
    color: #1e2732;
    font-weight: 600;
}
.infopadding{
	padding: 1% 10%;
}
.txt_info {
    position: absolute;
    right: 0;
    top: 56px;
    
}
.up{
	color: white !important;
	font-weight: 600;
	background-color: #fbab60;
	width: 100%;
	display: inline-block;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.2);
    border: solid 1px #fbab60;
    padding: 10px 0px;
    text-align: center;
}
.up:hover {
	background-color: #fbab00;
}
.text-reviewcount{
    margin-left: 3px !important;
    font-weight: 400 !important;
    color: #fbab60 !important;
    vertical-align: baseline !important;
    font-size: 20px !important;
}
.reviews li.yellow i {
    color: #F7941D;
}
.rvcontent{
	font-weight: 600;
	color: black !important;
}


#qna_btn{
	font-size: 0.6em;
	float:right;
	border: 1px solid #f7941d;
	background-color:white;
	padding: 2px;
	color:#f7941d;
	border-radius: 5px;
}
.qna_state_wait{
	border: 1px solid #5f5f5f;
/* 	background-color: #5f5f5f; */
	color:#5f5f5f;
	padding:1px;
	border-radius: 5px;
}

.qna_state_com{
	border:1px solid #f7941d;
	background-color: #f7941d;
	color: white;
	padding:1px;
	border-radius: 5px;	
}


#qna_insert{
	width:90%;
	height: 220px;
	margin: 0 auto;
	display: none;
}
.qna_close{
	display: none;
}
.qna_reply{
	display: none;
}

.insert_qna-btn{
	font-size: 0.9em;
	float:right;
	margin:10px;
	border: 1px solid ;
	background-color:#f7941d;
	padding: 3px;
	color:white ;
	border-radius: 5px;
}

.qna_open:hover{
	background-color: #f1f1f1;
}


</style>
<script>

$(document).ready(function(){
	$(".ctotal").append("총 구매금액<p class='total'>");
	inventory0();
	
	function inventory0(){
		var inventory=$("#selectoption option:selected").data("optioninventory");
		 if(inventory == 0)
		{
			$(".custom-select").css("background-color", "#f8f9fa");
		} 	
	}
	
	
	
	
	//옵션 선택
	$("select").change(function(){
		var option = $("#selectoption option:selected").val();
		var option1 = $("#selectoption option:selected").data("seloption1");
		var option2 = $("#selectoption option:selected").data("seloption2");
		
		
		var add_price = $("#selectoption option:selected").data("seladd_price");
		var inventory = $("#selectoption option:selected").data("optioninventory");
		var price = ${view.price};
		var selprice=${view.price}+$("#selectoption option:selected").data("seladd_price");
		var totalprice=0;
		if(option2 == "")
		{
			$(".cresult").append("<div class='test'>"
					+"<p class='toptest' data-option1="+option1+" data-add_price="+add_price+" data-price="+price+">"
					+option1+"&#32;&#47;&#32;"+option2+"&#32;&#40;&#43;"+add_price+"원&#41;"+"<br></p>"
					+"<p><button class='minus'>&#45;</button>"
					+"<input type='text' class='numBox'  min='1' max="+inventory+" value='1'>"
					+"<button class='plus'>&#43;</button>"
					+"<span class='bottomtest'>"
					+"<span class='selprice'>"+(price+add_price)+"원</span>"
//					+"<div class='units'></div>"
					+"<button id='optiondel'><img src='${pageContext.request.contextPath}/resources/icons/close4.png'/></button>"
					+"</span></p></div>"
					);
		}else{
			$(".cresult").append("<div class='test'>"
					+"<p class='toptest' data-option1="+option1+" data-option2="+option2+" data-add_price="+add_price+" data-price="+price+">"
					+option1+"&#32;&#47;&#32;"+option2+"&#32;&#40;&#43;"+add_price+"원&#41;"+"<br></p>"
					+"<p><button class='minus'>&#45;</button>"
					+"<input type='text' class='numBox'  min='1' max="+inventory+" value='1'>"
					+"<button class='plus'>&#43;</button>"
					+"<span class='bottomtest'>"
					+"<span class='selprice'>"+(price+add_price)+"원</span>"
//					+"<div class='units'></div>"
					+"<button id='optiondel'><img src='${pageContext.request.contextPath}/resources/icons/close4.png'/></button>"
					+"</span></p></div>"
					);
			
		}
		
		
		getTotalprice();
		//var total = Number($(".ctotal").find('p').text())+(price+add_price);
		//$(".ctotal").find('p').text(total);
	});
	
	function getTotalprice(){
		var sum= 0;
		var selprice = $(".selprice");
		
		$.each(selprice,function(index, item){
			console.log($(".selprice:eq("+index+")").text().slice(0,$(".selprice").text().length-1));
			sum +=Number($(".selprice:eq("+index+")").text().slice(0,$(".selprice:eq("+index+")").text().length-1));
			
		});
		$(".ctotal").find('p').text(sum+"원");
	}
	//제품 수량 조정(-)
	$(document).on("click",".minus",function(){
		var num = $(this).next().val();
		var minusNum = (num)-1;
		var chageprice=$('.selprice').text();
		
		
		if( minusNum < 1){
			$(this).next().val(num);
		}else{
			$(this).next().val(minusNum);
			var changeprice = (Number($(this).parent().prev().data("add_price"))+Number($(this).parent().prev().data("price")))*Number(minusNum);
			$(this).next().next().next().find('.selprice').text(changeprice+"원");
			getTotalprice();
		}
	});
	
	$(document).on("change",".numBox",function(){
		alert($(this).val());
	});
	
	//제품 수량 조정(+)
	$(document).on("click",".plus",function(){
		var num=$(this).prev().val();
		var plusNum= Number(num)+1;
		var inventory=$("#selectoption option:selected").data("optioninventory");
		
	 	if(plusNum>inventory){
	 		$(this).prev().val(inventory);
		}else{
			$(this).prev().val(plusNum);
			var changeprice = (Number($(this).parent().prev().data("add_price"))+Number($(this).parent().prev().data("price")))*Number(plusNum);
			$(this).next().find('.selprice').text(changeprice+"원");
			getTotalprice();
		}
		}); 
	
	//제품 삭제
	$(document).on("click","#optiondel",function(){
		 //button#optiondel
		$(this).parent().parent().parent().remove();
	});
	//end
	
	//장바구니 담기
	$(document).on("click",".cart_btn",function(){
		let id = $('.id').val();
		var product_code = ${view.product_code};
		
		if(id==null){
			alert("로그인 하십시오.");
		}
		var cart_quantity = $('.numBox').val(); 
		var ajax_last_num = 0;
		var current_ajax_num = ajax_last_num;
		$.each($(".toptest"),function(index,value){
			var data = {
					"id" : id
					,"product_code" : product_code
					,"cart_quantity" : cart_quantity
					,"option1" : $(this).data("option1")
					,"option2" :  $(this).data("option2")
					,"add_price" : $(this).data("add_price")
					,"cart_quantity" : $(this).parent().find(".numBox").val()
			};
	
		$.each(data,function(index,value){
			console.log(index, value);
		});
		 	$.ajax({
				url : "detailview/addCart"
				, data : data
				, dataType : "json"
				, async: false
				, beforeSend:function(data){ 
					ajax_last_num = ajax_last_num + 1; 
				}
				, success : function(data){
						if(current_ajax_num == ajax_last_num - 1)
					 		alert("장바구니에 상품을 담았습니다.");
					 	}
				, error : function(e){
					alert("장바구니에 담을 수 없습니다.")
					console.log(e);
				}
			})//end ajax
		}); //end each
		});
		//end cart_btn
		
	//상세정보, 상품평, 상품문의 선택 
	$('.pnav-link').click(function(){
		console.log($('.pnav-link'));
		if($(this).text() == "상세정보"){
			$('#pdetail').css("display", "block");		
			$('#pcomment').css("display", "none");
			$('#pgna').css("display", "none");
		}else if($(this).text() == "상품평"){
			$('#pdetail').css("display", "none");		
			$('#pcomment').css("display", "block");
			$('#pgna').css("display", "none");
		}else if($(this).text() == "상품문의"){
			$('#pdetail').css("display", "none");		
			$('#pcomment').css("display", "none");
			$('#pgna').css("display", "block");
		}
	});
	//end 상세정보, 상품평, 상품문의 선택
	$('.button__detail-more').click(function(){
		$(this).toggleClass("on");
		if($(this).hasClass("on")){
			$('.button__detail-more > span').text("접기");
			$('.moreimg').css("display", "block");
		}else{
			$('.button__detail-more > span').text("더보기");
			$('.moreimg').css("display", "none");
		}
	});
	/// 최초 이미지 로드
	$('.loadimg').css("display", "block");
	
	
	
	//qna 
	$('.qna_open').click(function(){
		console.log('trclick!');
		
		$(this).next().slideToggle("fast");
		console.log($(this).next().next().is('.qna_reply') === true);
		 if($(this).next().next().is('.qna_reply') === true ){
				$(this).next().next().slideToggle("fast");

		} 
	})
	
	
	$('#qna_btn').click(function(){
		$('#qna_insert').css('display', 'block');
		
	})
});
</script>



<title>SBBJ</title>
</head>
<body>

<div class="nav loc bg-light" style="border: 1px solid #dadada; border-top: 2px solid black; ">
     <ul class="top_link_nav" style="margin-left: 16%" >
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/">홈</a>
      </li>
      <i class="ti-arrow-right"></i>
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/list?category=${view.lv1}">${view.lv1}</a>
      </li>
      <i class="ti-arrow-right"></i>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/list?category=${view.lv2code}">${view.lv2}</a>
      </li>
      <i class="ti-arrow-right"></i>
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/list?category=${view.category_code}">${view.lv3}</a>
        </li>
        </ul>
   </div>
	
	<br><br>
	 
	 


	<div class="wrapper">

		<section>
			<form role="form" method="post">
				<input type="hidden" name="product_code" value="${view.product_code}" >
				
				<sec:authorize access="isAuthenticated()">
				<input type="hidden" name="id" class="id" 
				value='<sec:authentication property="principal.UserInfo.id"/>' >
				</sec:authorize>
			</form>
			
			

			<div class="container p-0">
				<!-- 상단 -->
				<div class="row item-topinfowrap">

					<!-- 좌측 상품상세정보 -->
					<div class="col thumb-gallery">
						<div id="viewerwrap" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" style="width: 550px; height: 750px;">
								<div class="carousel-item active">
									<img
										src="${view.thumb_img}"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="http://image.auction.co.kr/itemimage/1b/34/bc/1b34bc2756.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img
										src="http://image.auction.co.kr/itemimage/1b/73/14/1b7314f606.jpg"
										class="d-block w-100" alt="...">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>
					</div>

					<!-- 우측 상품관련정보 -->
					<div class="col item-topinfo">
						<!-- shop info, 상품코드 -->
						<div class="prod_info">
							<div class="d-flex bd-highlight my-3"
								style="border-bottom: 1px solid #dadada">
								<div class="p-2 bd-highlight"><a href="${pageContext.request.contextPath}/seller_list/${view.seller_code}">${view.seller_code}</a></div>
								<div class="ml-auto p-2 bd-highlight">${view.product_code}</div>
							</div>
						</div>

						<!-- 상품명 -->
						<h1 class="itemtit">
							<span class="text__item-title">${view.product_name}</span>
						</h1>

						<!-- 금액&amp;공유영역 -->
						<div class="price_wrap d-flex">
							<!-- 금액 -->
							<div class="price mr-auto">
								<h2 class="price_real ml-2">
								<fmt:formatNumber pattern="###,###,###" value="${view.price}" />
								</h2>
							</div>
							<!-- 공유 -->
							<div class="sns_area">
								<button type="button"
									class="share_btn btn btn-outline-primary btn-sm">
									<span>SNS 공유</span>
								</button>
							</div>
						</div>
						
						<!-- 배송 -->
						<div class="delivery_info bg-light my-3 p-2">
							<ul style="list-style: none; padding: 0">
								<li class="delivery_item" id="delevery_li" style="width: 100%">
									<button id="delivery_btn" class="btn btn-light btn-block" style="text-align: left">배송비 &#45;
									<c:choose>
									<c:when test="${view.free_shipping_cost <= view.price}">무료배송</button>
										<div class="delivery_view ml-3">
										<ul style="list-style: none">
										<li><span>추가 배송비  &#58;  </span>제주도 3,000원</li>
										</ul></div>
									</c:when>
									<c:otherwise>조건부 무료</button>
									<div class="delivery_view ml-3">
										<ul style="list-style: none">
											<li><span>배송비  &#58;  </span><fmt:formatNumber pattern="###,###,###" value="${view.basic_shipping_cost}"/>원</li>
											<br>
											<li><span>조건부 무료  &#58;  </span><fmt:formatNumber pattern="###,###,###" value="${view.free_shipping_cost}"/>원 이상</li>
											<br>
											<li><span>추가 배송비  &#58;  </span>제주도 3,000원</li>
										</ul>
									</div>
									</c:otherwise>
									</c:choose>
								</li>
							</ul>
						</div>





						<!-- 상품 옵션 -->
						<fieldset>
							<legend>옵션선택</legend>
							<!-- 선택옵션전체 -->
							
							<select class="custom-select mb-2" id="selectoption">
								<c:forEach items="${view.options}" var="option"
									varStatus="status">	
									<c:if test="${option.inventory eq 0}">
										<option value="" disabled selected hidden data-optioninventory="${option.inventory}">재고가 없습니다.</option>
								</c:if>	
								
									<c:if test="${option.inventory ne 0}">
										<option value="" disabled selected hidden>선택하세요</option>
										<!--선택n)옵션1/옵션2-재고:n개 (+#,###원) -->
										<option data-optioninventory="${option.inventory}"
											data-seloption1="${option.option1}"
											data-seloption2="${option.option2}"
											data-seladd_price="${option.add_price}" value="${option}">
											<c:if test="${not empty option.option1}">선택${status.index+1}&#41;&#32;${option.option1}</c:if>
											<c:if test="${not empty option.option2}">&#47; ${option.option2}&#32;</c:if>
											<c:if test="${option.add_price>0}"> &#40;&#43;<fmt:formatNumber
													pattern="###,###,###" value="${option.add_price}" />원&#41;</c:if>
											&#45;&#32;재고 &#32;${option.inventory}개
									</c:if>
								</c:forEach>
							</select>
							



							<!-- 옵션 선택 완료 -->
							<div class="cresult"></div>

							<div class="ctotal my-3"></div>


							<!--구매,장바구니 버튼-->
							<div class="ordercart_btn mb-3 ml-1">
								<button class="cart_btn btn btn-outline-dark btn-lg"
									type="button"
									style="width: 49%; height: 60px; font-weight: bolder; font-size: 25px;">장바구니</button>
								<button class="buy_btn btn btn-danger btn-lg" type="button"
									style="width: 49%; height: 60px; font-weight: bolder; font-size: 25px">구매하기</button>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="vip-tabwrap">
	<div class="nav detail_info_tab bg-light vip-tabnavi mb-5">
	     <ul class="info_nav" style="margin-left: 16%" >
			  <li class="nav-item">
			    <a class="pnav-link nav-link" href="#pdetail">상세정보</a>
			  </li>
			  <li class="nav-item">
			    <a class="pnav-link nav-link" href="#pcomment">상품평</a>
			  </li>
			  <li class="nav-item">
			    <a class="pnav-link nav-link" href="#pgna">상품문의</a>
			  </li>
		</ul>	
		</div>
		</div>
		<!-- ------------- -->
		<div class="vip-tab_container">
		<!-- 상품 공지사항 및 디테일 이미지 출력 -->
	 	<div id="pdetail" style="display: block;">	 		
				<img class="loadimg" alt="thumb_img" src="${view.thumb_img}" style="display : none">		
				<img class="loadimg" alt="comm_img1" src="${view.comm_img1}" style="display : none">
				<img class="loadimg" alt="comm_img2" src="${view.comm_img2}" style="display : none">
				<img class="loadimg" alt="comm_img3" src="${view.comm_img3}" style="display : none">
				<img class="loadimg" alt="detail_img1" src="${view.detail_img1}" style="display : none">
				<img class="loadimg" alt="detail_img2" src="${view.detail_img2}" style="display : none">
				<img class="moreimg" alt="detail_img3" src="${view.detail_img3}" style="display : none">
				<img class="moreimg" alt="detail_img4" src="${view.detail_img4}" style="display : none">
				<img class="moreimg" alt="detail_img5" src="${view.detail_img5}" style="display : none">
				<img class="moreimg" alt="detail_img6" src="${view.detail_img6}" style="display : none">
			
				<div class="box__detail-more">
		            <button type="button" class="button__detail-more js-toggle-button">상세정보 <span>더보기</span></button>
		        </div>
		        
	       		<!-- 상품 정보 제공 고시 -->
		        <div class="vip-detailarea_productinfo box__product-notice js-toggle-content infopadding">
		        	<h3 class="tit_productinfo">상품 정보 제공 고시<span>[전자상거래에 관한 상품정보 제공에 관한 고시] 항목에 의거 [쓰삐제]에 의해 등록된 정보입니다.</span></h3>
		        	<div class="box__product-notice-list">
	        			<table class="table_productinfo">
							<colgroup>
								<col style="width:155px;">
								<col>
							</colgroup> 
							<tbody>
								<tr>
									<th scope="row">상품번호</th>
									<td>${view.product_code}</td>
								</tr>
													<tr>
									<th scope="row">상품상태</th>
									<td>새상품</td>
								</tr>
								<tr>
									<th scope="row">부가세 면세여부</th>
									<td>과세상품</td>
								</tr>
								<tr>
									<th scope="row">영수증발행</th>
									<td>발행가능 - 신용카드 전표, 온라인 현금영수증</td>
								</tr>
								<tr>
									<th scope="row">사업자구분</th>
									<td>사업자 판매자</td>
								</tr>
								<tr>
									<th scope="row">모델명</th>
									<td>${view.product_name}</td>
								</tr>
								<tr>
									<th scope="row">원산지</th>
									<td>대한민국</td>
								</tr>
							</tbody>
						</table>
		        	</div>
	     	    </div>
		</div>
	
		<!-- 상품평  -->
		<div id="pcomment" style="display: none;">
			   <div class="infopadding">
			   <h3 class="tit_productinfo">일반 상품평<span class="text-reviewcount ml-3"><fmt:formatNumber pattern="###,###,###" value="${fn:length(review)}"/></span><span class="text_info">상품평은 구매완료후 <strong>마이페이지 > 주문/배송내역</strong>에서 작성하실 수 있습니다.</span></h3>
			   <table class="table_productinfo">
							<colgroup>
								<col style="width:15%">
								<col>
								<col style="width:20%">
							</colgroup> 
							<tbody>
								<c:forEach items="${review}" var="ritem">
								<tr>
									<td scope="row">
										<ul class="reviews">
											<c:forEach begin="${1}" end="${ritem.review_star}" step="${1}">
											<li class="yellow"><i class="ti-star"></i></li>
											</c:forEach>
											<c:forEach begin="${ritem.review_star}" end="${4}" step="${1}">
											<li><i class="ti-star"></i></li>
											</c:forEach>
										</ul>
									</td>
									<td>${ritem.option1} ${ritem.option2} / [${ritem.quantity}개]</td>
									<td>작성자 : ${ritem.id}</td>
								</tr>
								<tr>
									<td></td>
									<td class="rvcontent">${ritem.review_content}</td>
									<td>등록일 : ${ritem.review_writedate}</td>									
									
								</tr>
								</c:forEach>
							</tbody>
						</table>
				</div>
	    </div>
	    
	    <!-- 상품문의 -->
	    <div id="pgna" style="display: none;">
			<div class="infopadding">
			   <h3 class="tit_productinfo">상품 문의 <span class="text-reviewcount ml-3">
			   <fmt:formatNumber pattern="###,###,###" value="${fn:length(qlist)}"/></span>
			   
			   <span class="text_info">보다 신속한 답변을 원하시면 <strong>1577-1577 (수신자부담)</strong>로 문의주세요.</span>
			   
						<button id="qna_btn" > <i class="ti-hand-point-up">상품 문의</i></button></h3>
						
						
		<div id="qna_insert">
			<form method="post" action="${pageContext.request.contextPath}/insert_qna">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				<input type="hidden" name="product_code" value="${view.product_code}" >
				
				<sec:authorize access="isAuthenticated()">
				<input type="hidden" name="id" id="id" 
				value='<sec:authentication property="principal.UserInfo.id"/>' >
				</sec:authorize>
				
				<label for="qna_title" class="col-sm-2 col-form-label">문의 제목</label>
				<input type="text" class="form-control"  name="qna_title" id="qna_title">
				
				<label for="qna_content" class="col-sm-2 col-form-label">내용</label>
				<textarea rows="2" class="form-control"  cols="60" name="qna_content" id="qna_content"></textarea>
				<button type="submit" class="insert_qna-btn"><i class='ti-pencil-alt'></i>문의 작성</button>
			</form>
		</div>
			   <table class="table_productinfo">
							<colgroup>
								<col style="width:15%">
								<col style="width:45%">
								<col style="width:20%">
								<col style="width:20%">
							</colgroup>
							<thead>
								<tr style="background-color: #fdf1e3;">
									<td></td>
									<td align="center" >제목</td>
									<td align="center" >작성자</td>
									<td align="center" >등록일</td>
								</tr>
							</thead> 
							<tbody>
								<c:forEach var="i" items="${qlist}">
								<tr class="qna_open">
									<td align="center">
									<c:if test="${i.qna_state == '답변대기'}">
										<span class="qna_state_wait">${i.qna_state}</span>  
									
									</c:if>
									<c:if test="${i.qna_state == '답변완료'}">
										<span class="qna_state_com">${i.qna_state}</span>  
									
									</c:if>
									</td>
									<td>	${i.qna_title}</td>
									<td align="center" >${i.id}</td>
									<td align="center" >${i.write_date}</td>
								</tr>
								<tr class="qna_close" style="border-bottom:  1px solid silver;">
									<td> </td>
									<td colspan="2" >${i.qna_content}</td>
									<td> </td>
								</tr>
							<c:if test="${i.qna_state == '답변대기'}">
							
							</c:if>
								
							<c:if test="${i.qna_state == '답변완료'}">
								<tr  class="qna_reply" style="background-color: #fdf1e3;">
									<td  align="center"  > <i class="ti-angle-double-right"></i></td>
									<td colspan="2">${i.qna_reply}</td>
									<td  align="center" >${i.reply_date}</td>
								</tr>
							</c:if>
								
								
								</c:forEach>
							</tbody>
						</table>
						
				</div>
	    </div>
	    <div class="vip-all_sub vip-tabcontent_lt infopadding">
		<div class="precautions">
		<strong class="tit">주의사항</strong>
		<p>전자상거래 등에서의 소비자보호법에 관한 법률에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 취소할 수 있습니다. 쓰삐제에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 ㈜이베이코리아에서는 그 등록내역에 대하여 일체의 책임을 지지 않습니다.</p>
		</div>
		<div class="reportbox">
		<strong class="tit">쓰삐제 신고센터</strong>
		<p>쓰삐제는 소비자의 보호와 사이트 안전거래를 위해 신고센터를 운영하고 있습니다.<br>불법상품 및 부적격 상품의 판매 또는 부적절한 광고내용이나 안전거래를 저해하는 경우 신고하여 주시기 바랍니다.</p>
		</div>
		</div>
		</div>
		<a href="#" class="up">위로 돌아가기</a>
</body>
</html>