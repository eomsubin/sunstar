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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>
<script>
   $(document).ready(function() {
      /*전체선택*/
      $("#allCheck").click(function() {
         var chk = $("#allCheck").prop("checked");
         if (chk) {
            $(".chBox").prop("checked", true);
         } else {
            $(".chBox").prop("checked", false);
         }
      });
      /*전체선택 해제*/
      $(".chBox").click(function() {
         $("#allCheck").prop("checked", false)

      });
      // 체크값이 없을 시 못넘어가게
      $(".buyit_btn").click(function() {
         if ($(".chBox:checked").size() <= 0) {
            alert('상품을 선택해주세요')
            return false;
         }
      });
      
      
      
      /*제품 수량 조절(-)*/
      $(document).on("click","#minus_btn",function(){
         var num = $(this).parent().next().val();
         var minusNum=num-1;
         if( minusNum < 1){
            $(this).parent().next().val(num);
         }else{
            $(this).parent().next().val(minusNum);
         }
      });
      
      
      /*제품 삭제*/
      $(document).on('click','#selectdel_btn',function(){
         let id=$(".id").val();
         var cart_no=$("input[name=cart_no]:checked").val();
         var seller_code=$("input[name=cart_no]:checked").data("seller_code");
         
          var data={
            "id" : id
            ,"cart_no" : cart_no
            ,"seller_code" : seller_code
         }  
   
         $.each(data,function(index,value){
            $.ajax({
               url : "cartList/delete"
               , data : data
               , success : function(data){
                  alert("상품을 삭제했습니다.");
               }
               , error : function(e){
                  console.log(e)
               }
            })
         });
      
      });
   
      
      
      
      });
</script>
<!-- Eshop StyleSheet -->

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/cart_css/cart.css">


</head>

<body class="js">
   <form role="form" method="post">
      <sec:authorize access="isAuthenticated()">
         <input type="hidden" name="id" class="id"
            value='<sec:authentication property="principal.UserInfo.id"/>'>
      </sec:authorize>
   </form>

   <form method="post"
      action="${pageContext.request.contextPath }/checkout">
      <input type="hidden" name="${_csrf.parameterName}"
         value="${_csrf.token}" />
      <div id="content" class="mx-auto">

         <!-- Shopping Cart -->

         <div class="shopping-cart section">

            <div class="container">
               <div>
                  <h1 class="chartheader my-5">장바구니</h1>
               </div>

               <div class="row">
                  <div class="col-12">
                     <div class="select row mr-1 pb-2 justify-content-between">

                        <div class="custom-control custom-checkbox">
                           <input type="checkbox" class="allchBox custom-control-input"
                              id="allCheck" value='<sec:authentication property="principal.UserInfo.id"/>'> 
                              <label class="custom-control-label ml-4" for="allCheck" >전체 선택</label>
                        </div>

                        <div class="delBtn">
                           <button type="button" class="del_btn btn" id="selectdel_btn">
                           선택 삭제</button>
                        </div>
                     </div>


                     <!-- 주문 리스트 -->
                     <table class="table shopping-summery">
                        <tbody>

                           <c:set var="sum" value="0" />
                           <c:forEach var="cartList" items="${cartList}">
                              <div class="item1">
                                 <tr class="seller">
                                    <td colspan="7" class="sellerinfo px-2 pt-3 bg-">
                                       <div class="custom-control custom-checkbox">
                                          <input type="checkbox" class="chBox custom-control-input"
                                             id="sellerCheck" value="${cartList.seller_code}" name="seller_code"> 
                                             <label class="custom-control-label" for="sellerCheck">
                                             ${cartList.seller_name}</label>
                                       </div>
                                       <hr class='my-1'>
                                    </td>
                                 </tr>

                                 <tr class="item2 mb-1">
                                    <td class="image px-3" data-title="No">
                                       <div class="custom-control custom-checkbox">
                                          <input type="checkbox" class="chBox custom-control-input"
                                             id="${cartList.cart_no}" value="${cartList.cart_no}" name="cart_no" data-seller_code="${cartList.seller_code}">
                                          <label class="custom-control-label" for="${cartList.cart_no}">
                                             <a
                                             href="${pageContext.request.contextPath}/detailview2?product_code=${cartList.product_code}">
                                                <img src="${cartList.thumb_img}" class="thumimg" />
                                          </a>
                                          </label>
                                       </div>

                                    </td>
                                    <td class="product-des" data-title="Description">
                                       <!-- 상품명 -->
                                       <p class="product_code">
                                          <a href="${pageContext.request.contextPath}/detailview2?product_code=${cartList.product_code}">${cartList.product_name}</a>
                                       </p> <!-- 옵션 -->
                                       <p class="product_option">${cartList.option1}&#45;${cartList.option2}&#40;&#43;${cartList.add_price}원&#41;</p>
                                    </td>
                                    <!-- 금액 -->
                                    <td class="price" data-title="Price">
                                    <fmt:formatNumber pattern="###,###,###" value="${(cartList.price + cartList.add_price)}" />원</span></td>
                                    <!-- 수량 -->
                                    <td class="qty" data-title="Qty">
                                       <!-- Input Order -->
                                       <div class="input-group">
                                          <div class="button minus">
                                             <button type="button" class="btn btn-primary btn-number"
                                                id="minus_btn">
                                                <i class="ti-minus"></i>
                                             </button>
                                          </div>
                                          <input type="text" class="input-number" data-min="1"
                                             data-max="${cartList.inventory}"
                                             value="${cartList.cart_quantity}">
                                          <div class="button plus">
                                             <button type="button" class="btn btn-primary btn-number"
                                                id="plus_btn">
                                                <i class="ti-plus"></i>
                                             </button>
                                          </div>
                                       </div> <!--/ End Input Order -->
                                    </td>
                                    <!-- 총합계(배송비 제외) -->
                                    <td class="total-amount" data-title="Total"><fmt:formatNumber
                                          pattern="###,###,###"
                                          value="${(cartList.price + cartList.add_price) * cartList.cart_quantity}" />원</span></td>
                                    <!-- 배송비 -->
                                    <td><fmt:formatNumber pattern="###,###,###"
                                          value="${cartList.basic_shipping_cost}" />원</td>
                                    <!-- 삭제 아이콘 -->
                                    <td class="remove p-0">
                                       <button type="button" class="del_btn btn" id="idel_btn">
                                          <img
                                             src='${pageContext.request.contextPath}/resources/icons/close4.png'/>
                                       </button>
                                    </td>
                                 </tr>
                              </div>
                           </c:forEach>
                        </tbody>
                     </table>
                     <!--/ End Shopping Summery -->
                  </div>
               </div>


               <!-- 전체 합계 -->
               <div class="row">
                  <div class="col-12">
                     <!-- Total Amount -->
                     <div class="total-amount">
                        <div class="row">
                           <div class="col-lg-2 left">
                              <h2>전체 합계</h2>
                           </div>
                           <div class="col-lg-10">
                              <div class="right">
                                 <ul>
                                    <li>상품수<span>1</span></li>
                                    <li>상품금액<span>10000</span></li>
                                    <li>배송비<span>0</span></li>
                                    <li class="last">전체 주문금액<span>10000</span></li>
                                 </ul>
                              </div>
                           </div>
                           <div class="col-lg-12 mt-4 text-center">
                              <button class="buyit_btn" type="submit">주문하기</button>
                           </div>
                        </div>
                     </div>
                     <!--/ End Total Amount -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </form>
   <!--/ End Shopping Cart -->




</body>
</html>