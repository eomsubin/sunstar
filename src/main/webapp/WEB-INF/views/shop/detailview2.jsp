<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
    min-width: 1200px;
    margin: 0 auto;
    padding-top: 56px;
    position: relative;
    clear: both;
    z-index: 2;
}
.vip-tab_container {
    position: relative;
    z-index: 10;
    overflow: hidden;
    width: 1200px;
    margin: 0 auto;
}
</style>
<script>

$(document).ready(function(){
	$(".ctotal").append("총 구매금액<p class='total'>");

	//옵션 선택
	$("select").change(function(){
		var option = $("#selectoption option:selected").val();
		var option1 = $("#selectoption option:selected").data("seloption1");
		var option2 = $("#selectoption option:selected").data("seloption2");
		
		
		var add_price = $("#selectoption option:selected").data("seladd_price");
		var inventory = $("#selectoption option:selected").data("optioninventory");
		var price = ${view.price}
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
		console.log(data+'!!!!!!');
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
});
</script>
<title>SBBJ</title>
</head>
<body>

<div class="nav loc bg-light" style="border: 1px solid #dadada; border-top: 2px solid black; ">
     <ul class="top_link_nav" style="margin-left: 16%" >
      <li class="nav-item">
        <a class="nav-link active" href="#">홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">${view.lv1}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv2}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv3}</a>
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
								<div class="p-2 bd-highlight"><a href="${pageContext.request.contextPath}/seller_list">${view.seller_code}</a></div>
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
									<c:when test="${view.shipping_cost == 0}">무료배송</button>
										<div class="delivery_view ml-3">
										<ul style="list-style: none">
										<li><span>추가 배송비  &#58;  </span>제주도 3,000원</li>
										</ul></div>
									</c:when>
									<c:otherwise>조건부 무료</button>
									<div class="delivery_view ml-3">
										<ul style="list-style: none">
											<li><span>배송비  &#58;  </span><fmt:formatNumber pattern="###,###,###" value="${view.shipping_cost}"/>원</li>
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
								<option value="" disabled selected hidden>선택하세요</option>
								<c:forEach items="${view.options}" var="option" varStatus="status">
									<!--선택n)옵션1/옵션2-재고:n개 (+#,###원) -->
									<option data-optioninventory="${option.inventory}" data-seloption1="${option.option1}" data-seloption2="${option.option2}" data-seladd_price="${option.add_price}" value="${option}">
									
									<%-- <c:if test="${not empty option.option1 and not empty option.option2 and not empty option.add_price}">선택${status.index+1}&#41;&#32; ${option.option1} &#47; ${option.option2} &#45;&#32; 
									재고 &#32;${option.inventory}개 &#40;&#43;<fmt:formatNumber pattern="###,###,###" value="${option.add_price}"/>원&#41;</c:if> --%>
									<c:if test="${not empty option.option1}">선택${status.index+1}&#41;&#32;${option.option1}</c:if>
									<c:if test="${not empty option.option2}">&#47; ${option.option2}&#32;</c:if>
									<c:if test="${option.add_price>0}"> &#40;&#43;<fmt:formatNumber pattern="###,###,###" value="${option.add_price}"/>원&#41;</c:if>
									&#45;&#32;재고 &#32;${option.inventory}개
								</c:forEach>
							</select>
							
							
							<!-- 옵션 선택 완료 -->
							<div class="cresult">
							</div>

							<div class="ctotal my-3">
							
							</div>
							

							<!--구매,장바구니 버튼-->
							<div class="ordercart_btn mb-3 ml-1">
								<button class="cart_btn btn btn-outline-dark btn-lg"
									type="button" style="width: 49%; height:60px; font-weight: bolder; font-size:25px; ">장바구니</button>
								<button class="buy_btn btn btn-danger btn-lg" type="button"
									style="width: 49%; height:60px; font-weight: bolder; font-size:25px">구매하기</button>
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
			    <a class="nav-link" href="#">상세정보</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">상품평</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" href="#">상품문의</a>
			  </li>
		</ul>	
		</div>
		<div class="vip-tab_container">
		<img alt="" src="${view.comm_img1}">
		<img alt="" src="${view.comm_img2}">
		<img alt="" src="${view.comm_img3}">
		<img alt="" src="${view.detail_img1}">
		<img alt="" src="${view.detail_img2}">
		<img alt="" src="${view.detail_img3}">
		</div>
	</div>
</body>
</html>


=======
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
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

/* .vip-tabnavi {
    position: absolute;
    width: 100%;
    height: 55px;
    clear: both;
    background: #a9b3bc;
    border-bottom: 1px solid #96a3ad;
    transform: translateZ(0);
    -webkit-transform: translateZ(0);
    top: 0;
    left: 0;
}
.vip-tabwrap {
    min-width: 1200px;
    margin: 0 auto;
    padding-top: 56px;
    position: relative;
    clear: both;
    z-index: 2;
} */

</style>


<script>

$(document).ready(function(){
   $(".ctotal").append("총 구매금액<p class='total'>");

   //옵션 선택
   $("select").change(function(){
      var option = $("#selectoption option:selected").val();
      var option1 = $("#selectoption option:selected").data("seloption1");
      var option2 = $("#selectoption option:selected").data("seloption2");
      
      
      var add_price = $("#selectoption option:selected").data("seladd_price");
      var inventory = $("#selectoption option:selected").data("optioninventory");
      var price = ${view.price}
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
//               +"<div class='units'></div>"
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
//               +"<div class='units'></div>"
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
      console.log(data+'!!!!!!');
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
});
</script>
<title>SBBJ</title>
</head>
<body>

<div class="nav loc bg-light" style="border: 1px solid #dadada; border-top: 2px solid black; ">
     <ul class="top_link_nav" style="margin-left: 16%" >
      <li class="nav-item">
        <a class="nav-link active" href="#">홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="#">${view.lv1}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv2}</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">${view.lv3}</a>
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
                        <div class="p-2 bd-highlight"><a href="${pageContext.request.contextPath}/seller_list">${view.seller_code}</a></div>
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
                           <c:when test="${view.shipping_cost == 0}">무료배송</button>
                              <div class="delivery_view ml-3">
                              <ul style="list-style: none">
                              <li><span>추가 배송비  &#58;  </span>제주도 3,000원</li>
                              </ul></div>
                           </c:when>
                           <c:otherwise>조건부 무료</button>
                           <div class="delivery_view ml-3">
                              <ul style="list-style: none">
                                 <li><span>배송비  &#58;  </span><fmt:formatNumber pattern="###,###,###" value="${view.shipping_cost}"/>원</li>
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
                        <option value="" disabled selected hidden>선택하세요</option>
                        <c:forEach items="${view.options}" var="option" varStatus="status">
                           <!--선택n)옵션1/옵션2-재고:n개 (+#,###원) -->
                           <option data-optioninventory="${option.inventory}" data-seloption1="${option.option1}" data-seloption2="${option.option2}" data-seladd_price="${option.add_price}" value="${option}">
                           
                           <%-- <c:if test="${not empty option.option1 and not empty option.option2 and not empty option.add_price}">선택${status.index+1}&#41;&#32; ${option.option1} &#47; ${option.option2} &#45;&#32; 
                           재고 &#32;${option.inventory}개 &#40;&#43;<fmt:formatNumber pattern="###,###,###" value="${option.add_price}"/>원&#41;</c:if> --%>
                           <c:if test="${not empty option.option1}">선택${status.index+1}&#41;&#32;${option.option1}</c:if>
                           <c:if test="${not empty option.option2}">&#47; ${option.option2}&#32;</c:if>
                           <c:if test="${option.add_price>0}"> &#40;&#43;<fmt:formatNumber pattern="###,###,###" value="${option.add_price}"/>원&#41;</c:if>
                           &#45;&#32;재고 &#32;${option.inventory}개
                        </c:forEach>
                     </select>
                     
                     
                     <!-- 옵션 선택 완료 -->
                     <div class="cresult">
                     </div>

                     <div class="ctotal my-3">
                     
                     </div>
                     

                     <!--구매,장바구니 버튼-->
                     <div class="ordercart_btn mb-3 ml-1">
                        <button class="cart_btn btn btn-outline-dark btn-lg"
                           type="button" style="width: 49%; height:60px; font-weight: bolder; font-size:25px; ">장바구니</button>
                        <button class="buy_btn btn btn-danger btn-lg" type="button"
                           style="width: 49%; height:60px; font-weight: bolder; font-size:25px">구매하기</button>
                     </div>
                  </fieldset>

               </div>

            </div>
         </div>
      </section>
   </div>
   <div class="vip-tabwrap">
   <div class="nav detail_info_tab bg-light vip-tabnavi">
     <ul class="info_nav" style="margin-left: 16%" >
        <li class="nav-item">
          <a class="nav-link" href="#">상세정보</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">상품평</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">상품문의</a>
        </li>
   </ul>   
   </div>
   </div>
</body>
</html>

>>>>>>> branch 'master' of https://github.com/eomsubin/sunstar.git
