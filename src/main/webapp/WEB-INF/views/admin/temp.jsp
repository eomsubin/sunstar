<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>SSBJ 관리자</title>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
   	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>

        .bg-gradient-primary{
    	background-color: red !important;
   	    background-image: linear-gradient(180deg,#5a5c69 10%,#5a5c69 100%);
    }
    
    </style>
</head>

<body id="page-top">
<form role="form" method="post">
      <sec:authorize access="hasRole('ROLE_MANAGER')">
         <input type="hidden" name="id" class="id" value='<sec:authentication property="principal.UserInfo.id"/>'>
      </sec:authorize>
</form>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/admin/index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">스삐제 관리자<sup>*</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/../..">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>스삐제 메인</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-table"></i>
                    <span>판매자 관리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/seller_list">판매자 목록</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/seller_apply">신청 현황</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/category">카테고리 </a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/acc">정산신청 </a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-table"></i>
                    <span>고객 관리</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="${pageContext.request.contextPath}/admin/customer_list">고객 목록</a>                   
                        <a class="collapse-item" href="${pageContext.request.contextPath}/notice">공지사항</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/faq">자주하는 질문</a>
                        <a class="collapse-item" href="${pageContext.request.contextPath}/admin/oneforone">1:1문의</a>
                    </div>
                </div>
            </li>

            
            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">
         
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/settings">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>설정</span></a>
            </li>
			

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
		
		

            <!-- Main Content -->
            <div id="content">
			        <!-- Topbar -->
	      	  <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	
	          <!-- Sidebar Toggle (Topbar) -->
	          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
	            <i class="fa fa-bars"></i>
	          </button>
	

	
	          <!-- Topbar Navbar -->
	          <ul class="navbar-nav ml-auto">
	
	            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
	            <li class="nav-item dropdown no-arrow d-sm-none">
	              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-search fa-fw"></i>
	              </a>
	              <!-- Dropdown - Messages -->
	              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
	                <form class="form-inline mr-auto w-100 navbar-search">
	                  <div class="input-group">
	                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	                    <div class="input-group-append">
	                      <button class="btn btn-primary" type="button">
	                        <i class="fas fa-search fa-sm"></i>
	                      </button>
	                    </div>
	                  </div>
	                </form>
	              </div>
	            </li>
	
	            <!-- Nav Item - Alerts -->
	            
	            <!--  -->
	             <li class="nav-item dropdown no-arrow mx-1">
	             <a href="${pageContext.request.contextPath}" class="nav-link dropdown-toggle" >
	                <i class="fas fa-home fa-fw"></i>
	              </a>
	             
	            </li>
	            
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/admin/seller_apply" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-bell fa-fw"></i>
	                <!-- Counter - Alerts -->
	                <span class="badge badge-danger badge-counter">+</span>
	              </a>
	              <!-- Dropdown - Alerts -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
	                <h6 class="dropdown-header">
	                  Alerts Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-primary">
	                      <i class="fas fa-file-alt text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 12, 2019</div>
	                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-success">
	                      <i class="fas fa-donate text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 7, 2019</div>
	                    $290.29 has been deposited into your account!
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="mr-3">
	                    <div class="icon-circle bg-warning">
	                      <i class="fas fa-exclamation-triangle text-white"></i>
	                    </div>
	                  </div>
	                  <div>
	                    <div class="small text-gray-500">December 2, 2019</div>
	                    Spending Alert: We've noticed unusually high spending for your account.
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
	              </div>
	            </li>
	
	            <!-- Nav Item - Messages -->
	            <li class="nav-item dropdown no-arrow mx-1">
	              <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/admin/acc" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                <i class="fas fa-envelope fa-fw"></i>
	                <!-- Counter - Messages -->
	                <span class="badge badge-danger badge-counter">+</span>
	              </a>
	              <!-- Dropdown - Messages -->
	              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
	                <h6 class="dropdown-header">
	                  Message Center
	                </h6>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div class="font-weight-bold">
	                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
	                    <div class="small text-gray-500">Emily Fowler · 58m</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
	                    <div class="status-indicator"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
	                    <div class="small text-gray-500">Jae Chun · 1d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
	                    <div class="status-indicator bg-warning"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
	                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
	                  </div>
	                </a>
	                <a class="dropdown-item d-flex align-items-center" href="#">
	                  <div class="dropdown-list-image mr-3">
	                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
	                    <div class="status-indicator bg-success"></div>
	                  </div>
	                  <div>
	                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
	                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
	                  </div>
	                </a>
	                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
	              </div>
	            </li>
	
	            <div class="topbar-divider d-none d-sm-block"></div>
	
	            <!-- Nav Item - User Information -->
	            <li class="nav-item dropdown no-arrow">
	              <a class="nav-link dropdown-toggle" href="${pageContext.request.contextPath}/userlogout">
	                <span class="mr-2 d-none d-lg-inline text-gray-600 small">로그아웃</span>
	              </a>
	              <!-- Dropdown - User Information -->
	              
	            </li>
	
	          </ul>
	
	        </nav>
	        <!-- End of Topbar -->
        
        
        		<!-- 내용 삽입 -->
				<jsp:include page="${adminpage}" />
			
			
			
			</div>

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; SBBJ 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>

</body>
</html>