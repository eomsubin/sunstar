<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/header.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/magnific-popup.min.css">

<!-- Fancybox -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/jquery.fancybox.min.css">

<!-- Nice Select CSS -->
 <link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/niceselect.css">

<!-- Animate CSS -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Flex Slider CSS -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/flex-slider.min.css">
<!-- Owl Carousel -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/owl-carousel.css">
<!-- Slicknav -->
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/slicknav.min.css">

<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/responsive.css">

<style>
.main-category {
   display: none;
}
</style>

<script>

   $(document).ready(function(){
      
      $('.cat-heading').on('click', function() {
         $('.main-category').toggle();

      });
      
      
      
         
      
      
   });
      
</script>
</head>
<body>


   <!-- Header -->
   <header class="header shop">
      <!-- Topbar -->
      <div class="topbar">
         <div class="container">
            <div class="row">
               <div class="col-lg-4 col-md-12 col-12">
                  <!-- Top Left -->
                  <!-- <div class="top-left">
                     <ul class="list-main">
                        <li><i class="ti-headphone-alt"></i> 02-3486-9600</li>
                        <li><i class="ti-email"></i> customerservice@sbbj.kr</li>
                     </ul>
                  </div> -->
                  <!--/ End Top Left -->
               </div>
               <div class="col-lg-8 col-md-12 col-12">
                  <!-- Top Right -->
                  <div class="right-content">
                     <ul class="list-main">
                        <!-- <li><i class="ti-location-pin"></i> Store location</li>
                        <li><i class="ti-alarm-clock"></i> <a href="#">Daily deal</a></li> -->

                        <sec:authorize access="isAnonymous()">
                           <li><i class="ti-user"></i> <a
                              href="${pageContext.request.contextPath}/RegistrationBuyer">회원가입</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                           <li><i class="ti-user"></i> <a href="#">마이페이지</a></li>
                        </sec:authorize>

                        <sec:authorize access="isAnonymous()">
                           <li><i class="ti-power-off"></i><a
                              href="${pageContext.request.contextPath}/userlogin">로그인</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                           <sec:authentication property="principal.UserInfo.name" />님<li><i
                              class="ti-power-off"></i><a
                              href="${pageContext.request.contextPath}/userlogout">로그아웃</a></li>
                        </sec:authorize>
                     </ul>
                  </div>
                  <!-- End Top Right -->
               </div>
            </div>
         </div>
      </div>
      <!-- End Topbar -->
      <div class="middle-inner">
         <div class="container">
            <div class="row">
               <div class="col-lg-2 col-md-2 col-12">
                  <!-- Logo -->
                  <div class="logo">
                     <a href="/controller/"><img
                        src="${pageContext.request.contextPath}/resources/img/logo.png"
                        alt="logo"></a>
                  </div>
                  <!--/ End Logo -->
                  <!-- Search Form -->
                  <div class="search-top">
                     <div class="top-search">
                        <a href="#0"><i class="ti-search"></i></a>
                     </div>
                     <!-- Search Form -->
                     <div class="search-top">
                        <form class="search-form">
                           <input type="text" placeholder="Search here..." name="search">
                           <button value="search" type="submit">
                              <i class="ti-search"></i>
                           </button>
                        </form>
                     </div>
                     <!--/ End Search Form -->
                  </div>
                  <!--/ End Search Form -->
                  <div class="mobile-nav"></div>
               </div>


               
                  <div class="col-lg-8 col-md-7 col-12">
                           <div class="search-bar-top">
                  <form name="searchform" method="post"
                           action="${pageContext.request.contextPath}/search">
                           <input type="hidden" name="${_csrf.parameterName}"
                              value="${_csrf.token}" /> 
                           
                     <div class="search-bar">

                        <select name="search">
                        

                            <option selected="selected" >전체</option>
                                <c:forEach var="i" items="${catelist }">
                                 <option value="${i.lv1 }">${ i.lv1}</option> 
                                <!--  <option value="디지털/가전">디지털/가전</option>
                                 <option value="가구/인테리어">가구/인테리어</option>
                                 <option value="식품">식품</option>
                                 <option value="반려동물">반려동물</option>  -->
                                 </c:forEach>
                        </select>

                              <input name="word"
                              placeholder="여기에 상품을 입력하세요....." type="search" style="position:relative; right:28px;">

                           <button type="submit" class="btnn" >
                              <i class="ti-search"></i>
                           </button>
                              </div>
                              
                           
                        </form>
                     </div>
                           </div>
            

            

               <div class="col-lg-2 col-md-3 col-12">
                  <div class="right-bar">
                     <!-- Search Form -->
                     <div class="sinlge-bar">
                        <a href="#" class="single-icon"><i class="ti-headphone-alt"></i></a>
                     </div>
                     <div class="sinlge-bar">
                        <a href="#" class="single-icon"><i class="ti-desktop"></i></a>
                     </div>

                     <div class="sinlge-bar shopping">
                        <a href="#" class="single-icon"><i class="ti-bag"></i> <span
                           class="total-count">2</span></a>
                        <!-- Shopping Item -->
                        <div class="shopping-item">
                           <div class="dropdown-cart-header">
                              <!--    <span>2 Items</span> -->
                              <a href="#">장바구니 보기</a>
                           </div>
                           <ul class="shopping-list">
                              <li><a href="#" class="remove" title="Remove this item"><i
                                    class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
                                    src="https://via.placeholder.com/70x70" alt="#"></a>
                                 <h4>
                                    <a href="#">Woman Ring</a>
                                 </h4>
                                 <p class="quantity">
                                    1x - <span class="amount">$99.00</span>
                                 </p></li>
                              <li><a href="#" class="remove" title="Remove this item"><i
                                    class="fa fa-remove"></i></a> <a class="cart-img" href="#"><img
                                    src="https://via.placeholder.com/70x70" alt="#"></a>
                                 <h4>
                                    <a href="#">Woman Necklace</a>
                                 </h4>
                                 <p class="quantity">
                                    1x - <span class="amount">$35.00</span>
                                 </p></li>
                           </ul>
                           <div class="bottom">
                              <div class="total">
                                 <span>Total</span> <span class="total-amount">$134.00</span>
                              </div>
                              <a href="checkout.html" class="btn animate">Checkout</a>
                           </div>
                        </div>
                        <!--/ End Shopping Item -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Header Inner -->
      <div class="header-inner">
         <div class="container">
            <div class="cat-nav-head">
               <div class="row">
                  <div class="col-lg-3">
                     <div class="all-category">
                        <h3 class="cat-heading">
                           <i class="fa fa-bars" aria-hidden="true"></i>상품 카테고리
                        </h3>
                        <ul class="main-category">
                           <c:forEach var="item" items="${catelist }">
                           <li><a href="#">${item.lv1} <i class="fa fa-angle-right"
                                 aria-hidden="true"></i></a>
                              <ul class="sub-category">
                                 <c:forEach var="item2" items="${catelist2 }">
                                 <c:if test="${item.lv1==item2.lv1 }">
                                 <li><a href="${pageContext.request.contextPath}/${item2.lv2code}">${item2.lv2 }</a></li>
                                 
                                 </c:if>
                              
                                 </c:forEach>
                              </ul>
                           </li>
                           </c:forEach>
                           <!-- <li><a href="#">디지털/가전 <i class="fa fa-angle-right"
                                 aria-hidden="true"></i></a>
                              <ul class="sub-category">
                                 <li><a href="#">accessories</a></li>
                                 <li><a href="#">best selling</a></li>
                                 <li><a href="#">top 100 offer</a></li>
                                 <li><a href="#">sunglass</a></li>
                                 <li><a href="#">watch</a></li>
                                 <li><a href="#">man’s product</a></li>
                                 <li><a href="#">ladies</a></li>
                                 <li><a href="#">westrn dress</a></li>
                                 <li><a href="#">denim </a></li>
                              </ul></li>
                           <li><a href="#">가구/인테리어 <i class="fa fa-angle-right"
                                 aria-hidden="true"></i></a>
                              <ul class="sub-category">
                                 <li><a href="#">accessories</a></li>
                                 <li><a href="#">best selling</a></li>
                                 <li><a href="#">top 100 offer</a></li>
                                 <li><a href="#">sunglass</a></li>
                                 <li><a href="#">watch</a></li>
                                 <li><a href="#">man’s product</a></li>
                                 <li><a href="#">ladies</a></li>
                                 <li><a href="#">westrn dress</a></li>
                                 <li><a href="#">denim </a></li>
                              </ul></li>
                           <li><a href="#">식품 <i class="fa fa-angle-right"
                                 aria-hidden="true"></i></a>
                              <ul class="sub-category">
                                 <li><a href="#">accessories</a></li>
                                 <li><a href="#">best selling</a></li>
                                 <li><a href="#">top 100 offer</a></li>
                                 <li><a href="#">sunglass</a></li>
                                 <li><a href="#">watch</a></li>
                                 <li><a href="#">man’s product</a></li>
                                 <li><a href="#">ladies</a></li>
                                 <li><a href="#">westrn dress</a></li>
                                 <li><a href="#">denim </a></li>
                              </ul></li>
                           <li><a href="#">반려동물 <i class="fa fa-angle-right"
                                 aria-hidden="true"></i></a>
                              <ul class="sub-category">
                                 <li><a href="#">accessories</a></li>
                                 <li><a href="#">best selling</a></li>
                                 <li><a href="#">top 100 offer</a></li>
                                 <li><a href="#">sunglass</a></li>
                                 <li><a href="#">watch</a></li>
                                 <li><a href="#">man’s product</a></li>
                                 <li><a href="#">ladies</a></li>
                                 <li><a href="#">westrn dress</a></li>
                                 <li><a href="#">denim </a></li>
                              </ul></li> -->
                        </ul>
                     </div>
                  </div>
                  <div class="col-lg-9 col-12">
                     <div class="menu-area">
                        <!-- Main Menu -->
                        <nav class="navbar navbar-expand-lg">
                           <div class="navbar-collapse">
                              <div class="nav-inner">
                                 <ul class="nav main-menu menu navbar-nav">
                                    <li class="active"><a href="#">홈</a></li>
                                    <li><a href="#">베스트</a></li>
                                    <li><a href="#">슈퍼딜</a></li>
                                    <li><a href="#">이벤트<i class="ti-angle-down"></i><span
                                          class="new">New</span></a>
                                       <ul class="dropdown">
                                          <li><a href="shop-grid.html">쿠폰</a></li>
                                          <li><a href="cart.html">출석체크</a></li>

                                       </ul></li>

                                 </ul>
                              </div>
                           </div>
                        </nav>
                        <!--/ End Main Menu -->
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!--/ End Header Inner -->
   </header>
   <!--/ End Header -->
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
   <script
      src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

   <!-- Slicknav JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/slicknav.min.js"></script>
   <!-- Owl Carousel JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/owl-carousel.js"></script>
   <!-- Magnific Popup JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/magnific-popup.js"></script>
   <!-- <!-- Waypoints JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/waypoints.min.js"></script>
   <!-- Countdown JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/finalcountdown.min.js"></script>
   <!--    <!-- Nice Select JS -->
       <script
      src="${pageContext.request.contextPath}/resources/js/nicesellect.js"></script> 
   <script
      src="${pageContext.request.contextPath}/resources/js/flex-slider.js"></script>
   <!-- ScrollUp JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/scrollup.js"></script>
   <!-- Onepage Nav JS -->
   <script
      src="${pageContext.request.contextPath}/resources/js/onepage-nav.min.js"></script>
   <!-- Easing JS -->
   <script src="${pageContext.request.contextPath}/resources/js/easing.js"></script>
   <!-- Active JS -->
 <script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
</body>

</html>