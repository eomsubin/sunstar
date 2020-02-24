<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<meta name="description" content="Bootstrap Metro Dashboard">
	<meta name="author" content="Dennis Ji">
	<meta name="keyword" content="Metro, Metro UI, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="http://localhost:8080/controller/resources/seller_css/bootstrap.min.css" rel="stylesheet">
	<link href="http://localhost:8080/controller/resources/seller_css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="http://localhost:8080/controller/resources/seller_css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="http://localhost:8080/controller/resources/seller_css/style-responsive.css" rel="stylesheet">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="http://localhost:8080/controller/resources/seller_css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="http://localhost:8080/controller/resources/seller_css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="http://localhost:8080/controller/resources/seller_img/favicon.ico">
	<!-- end: Favicon -->
		<!-- start: JavaScript-->

		<script src="http://localhost:8080/controller/resources/seller_js/jquery-1.9.1.min.js"></script>
	<script src="http://localhost:8080/controller/resources/seller_js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.ui.touch-punch.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/modernizr.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/bootstrap.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.cookie.js"></script>
	
		<script src='http://localhost:8080/controller/resources/seller_js/fullcalendar.min.js'></script>
	
		<script src='http://localhost:8080/controller/resources/seller_js/jquery.dataTables.min.js'></script>

		<script src="http://localhost:8080/controller/resources/seller_js/excanvas.js"></script>
	<script src="http://localhost:8080/controller/resources/seller_js/jquery.flot.js"></script>
	<script src="http://localhost:8080/controller/resources/seller_js/jquery.flot.pie.js"></script>
	<script src="http://localhost:8080/controller/resources/seller_js/jquery.flot.stack.js"></script>
	<script src="http://localhost:8080/controller/resources/seller_js/jquery.flot.resize.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.chosen.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.uniform.min.js"></script>
		
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.cleditor.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.noty.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.elfinder.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.raty.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.iphone.toggle.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.gritter.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.imagesloaded.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.masonry.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.knob.modified.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/jquery.sparkline.min.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/counter.js"></script>
	
		<script src="http://localhost:8080/controller/resources/seller_js/retina.js"></script>

		<script src="http://localhost:8080/controller/resources/seller_js/custom.js"></script>
	<!-- end: JavaScript-->
		
		
		
		
</head>
<body>
			<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a> <a class="brand" href="${pageContext.request.contextPath}/seller"><span>판매회원 전용 사이트</span></a>

				<!-- start: Header Menu -->
				<div class="nav-no-collapse header-nav">
					<ul class="nav pull-right">
						<li class="dropdown hidden-phone"><a
							class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-bell"></i> <span class="badge red"> 7 </span>
						</a>
							<ul class="dropdown-menu notifications">
								<li class="dropdown-menu-title"><span>You have 11
										notifications</span> <a href="#refresh"><i class="icon-repeat"></i></a>
								</li>
								<li><a href="#"> <span class="icon blue"><i
											class="icon-user"></i></span> <span class="message">New user
											registration</span> <span class="time">1 min</span>
								</a></li>
								<li><a href="#"> <span class="icon green"><i
											class="icon-comment-alt"></i></span> <span class="message">New
											comment</span> <span class="time">7 min</span>
								</a></li>
								<li><a href="#"> <span class="icon green"><i
											class="icon-comment-alt"></i></span> <span class="message">New
											comment</span> <span class="time">8 min</span>
								</a></li>
								<li><a href="#"> <span class="icon green"><i
											class="icon-comment-alt"></i></span> <span class="message">New
											comment</span> <span class="time">16 min</span>
								</a></li>
								<li><a href="#"> <span class="icon blue"><i
											class="icon-user"></i></span> <span class="message">New user
											registration</span> <span class="time">36 min</span>
								</a></li>
								<li><a href="#"> <span class="icon yellow"><i
											class="icon-shopping-cart"></i></span> <span class="message">2
											items sold</span> <span class="time">1 hour</span>
								</a></li>
								<li class="warning"><a href="#"> <span class="icon red"><i
											class="icon-user"></i></span> <span class="message">User
											deleted account</span> <span class="time">2 hour</span>
								</a></li>
								<li class="warning"><a href="#"> <span class="icon red"><i
											class="icon-shopping-cart"></i></span> <span class="message">New
											comment</span> <span class="time">6 hour</span>
								</a></li>
								<li><a href="#"> <span class="icon green"><i
											class="icon-comment-alt"></i></span> <span class="message">New
											comment</span> <span class="time">yesterday</span>
								</a></li>
								<li><a href="#"> <span class="icon blue"><i
											class="icon-user"></i></span> <span class="message">New user
											registration</span> <span class="time">yesterday</span>
								</a></li>
								<li class="dropdown-menu-sub-footer"><a>View all
										notifications</a></li>
							</ul></li>
						<!-- start: Notifications Dropdown -->
						<li class="dropdown hidden-phone"><a
							class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-calendar"></i> <span class="badge red"> 5
							</span>
						</a>
							<ul class="dropdown-menu tasks">
								<li class="dropdown-menu-title"><span>You have 17
										tasks in progress</span> <a href="#refresh"><i
										class="icon-repeat"></i></a></li>
								<li><a href="#"> <span class="header"> <span
											class="title">iOS Development</span> <span class="percent"></span>
									</span>
										<div class="taskProgress progressSlim red">80</div>
								</a></li>
								<li><a href="#"> <span class="header"> <span
											class="title">Android Development</span> <span
											class="percent"></span>
									</span>
										<div class="taskProgress progressSlim green">47</div>
								</a></li>
								<li><a href="#"> <span class="header"> <span
											class="title">ARM Development</span> <span class="percent"></span>
									</span>
										<div class="taskProgress progressSlim yellow">32</div>
								</a></li>
								<li><a href="#"> <span class="header"> <span
											class="title">ARM Development</span> <span class="percent"></span>
									</span>
										<div class="taskProgress progressSlim greenLight">63</div>
								</a></li>
								<li><a href="#"> <span class="header"> <span
											class="title">ARM Development</span> <span class="percent"></span>
									</span>
										<div class="taskProgress progressSlim orange">80</div>
								</a></li>
								<li><a class="dropdown-menu-sub-footer">View all tasks</a>
								</li>
							</ul></li>
						<!-- end: Notifications Dropdown -->
						<!-- start: Message Dropdown -->
						<li class="dropdown hidden-phone"><a
							class="btn dropdown-toggle" data-toggle="dropdown" href="#">
								<i class="icon-envelope"></i> <span class="badge red"> 4
							</span>
						</a>
							<ul class="dropdown-menu messages">
								<li class="dropdown-menu-title"><span>You have 9
										messages</span> <a href="#refresh"><i class="icon-repeat"></i></a></li>
								<li><a href="#"> <span class="avatar"><img
											src="http://localhost:8080/controller/resources/seller_img/avatar.jpg"
											alt="Avatar"></span> <span class="header"> <span
											class="from"> Dennis Ji </span> <span class="time"> 6
												min </span>
									</span> <span class="message"> Lorem ipsum dolor sit amet
											consectetur adipiscing elit, et al commore </span>
								</a></li>
								<li><a href="#"> <span class="avatar"><img
											src="http://localhost:8080/controller/resources/seller_img/avatar.jpg"
											alt="Avatar"></span> <span class="header"> <span
											class="from"> Dennis Ji </span> <span class="time"> 56
												min </span>
									</span> <span class="message"> Lorem ipsum dolor sit amet
											consectetur adipiscing elit, et al commore </span>
								</a></li>
								<li><a href="#"> <span class="avatar"><img
											src="http://localhost:8080/controller/resources/seller_img/avatar.jpg"
											alt="Avatar"></span> <span class="header"> <span
											class="from"> Dennis Ji </span> <span class="time"> 3
												hours </span>
									</span> <span class="message"> Lorem ipsum dolor sit amet
											consectetur adipiscing elit, et al commore </span>
								</a></li>
								<li><a href="#"> <span class="avatar"><img
											src="http://localhost:8080/controller/resources/seller_img/avatar.jpg"
											alt="Avatar"></span> <span class="header"> <span
											class="from"> Dennis Ji </span> <span class="time">
												yesterday </span>
									</span> <span class="message"> Lorem ipsum dolor sit amet
											consectetur adipiscing elit, et al commore </span>
								</a></li>
								<li><a href="#"> <span class="avatar"><img
											src="http://localhost:8080/controller/resources/seller_img/avatar.jpg"
											alt="Avatar"></span> <span class="header"> <span
											class="from"> Dennis Ji </span> <span class="time">
												Jul 25, 2012 </span>
									</span> <span class="message"> Lorem ipsum dolor sit amet
											consectetur adipiscing elit, et al commore </span>
								</a></li>
								<li><a class="dropdown-menu-sub-footer">View all
										messages</a></li>
							</ul></li>

						<!-- start: User Dropdown -->
						<li class="dropdown"><a class="btn dropdown-toggle"
							data-toggle="dropdown" href="#"> <i
								class="halflings-icon white user"></i> Dennis Ji <span
								class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li class="dropdown-menu-title"><span>Account
										Settings</span></li>
								<li><a href="#"><i class="halflings-icon user"></i>
										Profile</a></li>
								<li><a href="login.html"><i class="halflings-icon off"></i>
										Logout</a></li>
							</ul></li>
						<!-- end: User Dropdown -->
					</ul>
				</div>
				<!-- end: Header Menu -->

			</div>
		</div>
	</div>
	<!-- start: Header -->

	<div class="container-fluid-full">
		<div class="row-fluid">

			<!-- start: Main Menu -->
			<div id="sidebar-left" class="span2">
				<div class="nav-collapse sidebar-nav">
					<ul class="nav nav-tabs nav-stacked main-menu">
						<li><a href="${pageContext.request.contextPath}/seller"><i class="icon-bar-chart"></i><span
								class="hidden-tablet"> 판매회원 홈 </span></a></li>
						<li><a href="messages.html"><i class="icon-envelope"></i><span
								class="hidden-tablet"> Messages</span></a></li>
						<li><a href="tasks.html"><i class="icon-tasks"></i><span
								class="hidden-tablet"> Tasks</span></a></li>
						<li><a href="ui.html"><i class="icon-eye-open"></i><span
								class="hidden-tablet"> UI Features</span></a></li>
						<li><a href="widgets.html"><i class="icon-dashboard"></i><span
								class="hidden-tablet"> Widgets</span></a></li>
						<li><a class="dropmenu" href="#"><i
								class="icon-folder-close-alt"></i><span class="hidden-tablet">
									상품 관리</span><span class="label label-important"> 3 </span></a>
							<ul>
								<li><a href="${pageContext.request.contextPath}/product"><i
									class="icon-align-justify"></i><span class="hidden-tablet">
									상품 목록</span></a></li>
								<li><a class="submenu" href="${pageContext.request.contextPath}/addproduct"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											상품 추가</span></a></li>
								<li><a class="submenu" href="submenu2.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Sub Menu 2</span></a></li>
								<li><a class="submenu" href="submenu3.html"><i
										class="icon-file-alt"></i><span class="hidden-tablet">
											Sub Menu 3</span></a></li>
							</ul></li>
						<li><a href="form.html"><i class="icon-edit"></i><span
								class="hidden-tablet"> Forms</span></a></li>
						<li><a href="chart.html"><i class="icon-list-alt"></i><span
								class="hidden-tablet"> Charts</span></a></li>
						<li><a href="typography.html"><i class="icon-font"></i><span
								class="hidden-tablet"> Typography</span></a></li>
						<li><a href="gallery.html"><i class="icon-picture"></i><span
								class="hidden-tablet"> Gallery</span></a></li>
						
						<li><a href="calendar.html"><i class="icon-calendar"></i><span
								class="hidden-tablet"> Calendar</span></a></li>
						<li><a href="file-manager.html"><i
								class="icon-folder-open"></i><span class="hidden-tablet">
									File Manager</span></a></li>
						<li><a href="icon.html"><i class="icon-star"></i><span
								class="hidden-tablet"> Icons</span></a></li>
						<li><a href="login.html"><i class="icon-lock"></i><span
								class="hidden-tablet"> Login Page</span></a></li>
					</ul>
				</div>
			</div>
			<!-- end: Main Menu --> 
			
			
			

</body>
</html>