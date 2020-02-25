<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="http://localhost:8080/controller/resources/css/headerfooter.css">

<title>Insert title here</title>
</head>
<body>
	  <div class="header">
          <div class="head_top list-group list-group-horizontal">
            <h1><img src="http://localhost:8080/controller/resources/img/logo.png" width="240" height="113" /></h1>

            <div class="right_menu">
              <ul class="list-group list-group-horizontal m-4">
                <li class="list-group-item">
                  <a href="#"> <img src="http://pics.gmarket.co.kr/pc/single/kr/common/image__header-mypage.svg" alt="마이페이지" class="image"/></a>
                </li>
                <li class="list-group-item">
                  <a href="#"> <img src="http://pics.gmarket.co.kr/pc/single/kr/common/image__header-recent.svg" alt="최근본상품" class="image"/></a>
                </li>
                <li class="list-group-item">
                  <a href="#"> <img src="http://pics.gmarket.co.kr/pc/single/kr/common/image__header-cart.svg" alt="장바구니" class="image"/></a>
                </li>
              </ul>
            </div>

            <form class="form-inline m-4">
              <input class="form-control" type="search" placeholder="search" />
              <div class="input-group-append">
                <button class="btn btn-outline-secondary ma-3" type="submit">검색</button>
              </div>
            </form>
          </div>
       
		  
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light p-1">
           	<div class="all-category" >
								<h3 class="cat-heading"><i class="fa fa-bars" aria-hidden="true"></i>CATEGORIES</h3>
								<ul class="main-category">
									<li><a href="#">패션 <i class="fa fa-angle-right" aria-hidden="true"></i></a>
										<ul class="sub-category">
											<li><a href="#">여성의류-니트</a></li>
											<li><a href="#">best selling</a></li>
											<li><a href="#">top 100 offer</a></li>
											<li><a href="#">sunglass</a></li>
											<li><a href="#">watch</a></li>
											<li><a href="#">man’s product</a></li>
											<li><a href="#">ladies</a></li>
											<li><a href="#">westrn dress</a></li>
											<li><a href="#">denim </a></li>
										</ul>
									</li>
									<li><a href="#">New Arrivals <i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
										</ul>
									</li>
									<li><a href="#">New Arrivals <i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
										</ul>
									</li>
									<li><a href="#">New Arrivals <i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
										</ul>
									</li>
									<li><a href="#">New Arrivals <i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
										</ul>
									</li>
									</ul>
									</div>
             <!--   <a class="navbar-brand" href="#">전체 카테고리</a>
              <button
                class="navbar-toggler"
                type="button"
                data-toggle="collapse"
                data-target="#navbarText"
                aria-controls="navbarText"
                aria-expanded="false"
                aria-label="Toggle navigation"
              > 
                <span class="navbar-toggler-icon"></span>
              </button>  -->
              <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="#">베스트</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">슈퍼딜</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#">쿠폰/출첵</a>
                  </li>
                </ul>

                <span class="navbar-text">
                  <ul class="nav justify-content-end">
                    <li class="nav-item">
                    <c:if test="${empty userinfo}"><a class="nav-link" href="userlogin">로그인</a></c:if>
                    <c:if test="${!empty userinfo}">${userinfo.response.name}님 <a class="nav-link" href="userlogout">로그아웃</a></c:if>
                    
                    <sec:authorize access="isAnonymous()">
					<a class="nav-link" href="userlogin">로그인</a>
					</sec:authorize>
                    <sec:authorize access="isAuthenticated()">
					<a class="nav-link" href="userlogout">로그아웃</a>
					</sec:authorize>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">회원가입</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">고객센터</a>
                    </li>
                  </ul>
                </span>
              </div>
            </nav>
          </div>  
        </div>
</body>
</html>
