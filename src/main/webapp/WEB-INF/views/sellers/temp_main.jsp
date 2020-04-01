<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


</head>
<body>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">환영합니다! </h1>
			<a href="${pageContext.request.contextPath}/seller/orders"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm">
				
				<i
				class="fas fa-download fa-sm text-white-50"></i>주문목록 바로보기</a>
		</div>

		<!-- Content Row -->
		<div class="row">
			<!-- Earnings (Monthly) Card Example -->
			<div class="col mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">


								<a
									href="${pageContext.request.contextPath}/seller/view_step/step2">
									<div
										class="text-xs font-weight-bold text-primary text-uppercase mb-1">
										결제완료</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<c:out value="${paid}"></c:out>
									</div>
								</a>
							</div>
							<div class="col-auto">
								<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col mb-4">
				<div class="card border-left-danger shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">


								<a
									href="${pageContext.request.contextPath}/seller/view_step/step3">
									<div
										class="text-xs font-weight-bold text-danger text-uppercase mb-1">
										배송대기중</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<c:out value="${ready}"></c:out>
									</div>
								</a>
							</div>
							<div class="col-auto">
								<i class="fas fa-dolly-flatbed fa-2x text-gray-300"></i>

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<a
									href="${pageContext.request.contextPath}/seller/view_step/step9">

									<div
										class="text-xs font-weight-bold text-success text-uppercase mb-1">교환요청</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<c:out value="${exchange}" />
									</div>
								</a>
							</div>
							<div class="col-auto">
								<i class="fas fa-exchange-alt fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col mb-4">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<a
									href="${pageContext.request.contextPath}/seller/view_step/step7">

									<div
										class="text-xs font-weight-bold text-info text-uppercase mb-1">반품대기</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<c:out value="${bringback}" />
									</div>

								</a>
							</div>
							<div class="col-auto">
								<i class="fas fa-undo-alt fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Pending Requests Card Example -->
			<div class="col mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<a
									href="${pageContext.request.contextPath}/seller/product_qna">

									<div
										class="text-xs font-weight-bold text-warning text-uppercase mb-1">상품
										문의</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<c:out value="${waitAnswer}" />
									</div>
									</a>
							</div>
							<div class="col-auto">
								<i class="fas fa-comments fa-2x text-gray-300"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Content Row -->

		<div class="row">

			<!-- Area Chart -->
			<%-- <div class="col-xl-8 col-lg-7">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">Earnings
							Overview</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-area">
							<canvas id="myAreaChart"></canvas>
						</div>
					</div>
				</div>
			</div> --%>

			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">최근 열흘간 주문건수</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<!-- 	<div class="chart-pie pt-4 pb-2"> -->
						<!--  -->


						<%-- <canvas id="myPieChart"></canvas> --%>

						<canvas id="orderCount" width="264px;" height="320px;"></canvas>

						<script>
							var ctx = document.getElementById('orderCount');
							var myChart = new Chart(ctx, {
							    type: 'bar',
							    data: {
							        labels: [${day10}],
							        datasets: [{
							            label: '일별 주문건수',
							            data: [${day10data}],
							            backgroundColor: [
							                'rgba(86, 187, 127, 0.8)',
							                'rgba(159, 204, 62, 0.8)',
							                'rgba(216,224,50, 0.8)',
							                'rgba(255,209,28, 0.8)',
							                'rgba(249,171,31, 0.8)',
							                'rgba(245,140,74, 0.8)',
							                'rgba(241,106,102, 0.8)',
							                'rgba(236,101,160, 0.8)',
							                'rgba(168,118,179, 0.8)',
							                'rgba(105,145,204, 0.8)',

							            ],
							            borderColor: [
							            ],
							            borderWidth: 2
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                	min:0,
							                    stepSize:1
							                }
							            }]
							        }
							    }
							});
							</script>


						<!--  -->
						<!-- 						</div>
 -->
						<!-- <div class="mt-4 text-center small">
							<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
								Direct
							</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i>
								Social
							</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
								Referral
							</span>
						</div> -->
					</div>
				</div>
			</div>
			
			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">카테고리별 등록된 상품수</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<!-- 	<div class="chart-pie pt-4 pb-2"> -->
						<!--  -->


						<%-- <canvas id="myPieChart"></canvas> --%>

						<canvas id="categoryPieChart" width="264px;" height="320px;"></canvas>

						<script>
							var ctx = document.getElementById('categoryPieChart');
							var myChart = new Chart(ctx, {
							    type: 'doughnut',
							    data: {
							        labels: [${category_name}],
							        datasets: [{
							            label: '카테고리',
							            data: [${top5Count}],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.8)',
							                'rgba(54, 162, 235, 0.8)',
							                'rgba(255, 206, 86, 0.8)',
							                'rgba(75, 192, 192, 0.8)',
							                'rgba(153, 102, 255, 0.8)',
							                'rgba(255, 159, 64, 0.8)'
							            ],
							            borderColor: [
							                'rgba(255, 99, 132, 0.8)',
							                'rgba(54, 162, 235, 0.8)',
							                'rgba(255, 206, 86, 0.8)',
							                'rgba(75, 192, 192, 0.8)',
							                'rgba(153, 102, 255, 0.8)',
							                'rgba(255, 159, 64, 0.8)'
							            ],
							            borderWidth: 2
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: {
							                pointOnColumn: false,
							                showLabel: false
							            }
							        }
							    }
							});
							</script>


						<!--  -->
						<!-- 						</div>
 -->
						<!-- <div class="mt-4 text-center small">
							<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
								Direct
							</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i>
								Social
							</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
								Referral
							</span>
						</div> -->
					</div>
				</div>
			</div>
			
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">판매량 TOP 5</h6>
						<div class="dropdown no-arrow">
							<a class="dropdown-toggle" href="#" role="button"
								id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
								class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
							</a>
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
								aria-labelledby="dropdownMenuLink">
								<div class="dropdown-header">Dropdown Header:</div>
								<a class="dropdown-item" href="#">Action</a> <a
									class="dropdown-item" href="#">Another action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</div>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<!-- 	<div class="chart-pie pt-4 pb-2"> -->
						<!--  -->


						<%-- <canvas id="myPieChart"></canvas> --%>

						<canvas id="accPieChart" width="264px;" height="320px;"></canvas>

						<script>
							var ctx = document.getElementById('accPieChart');
							var myChart = new Chart(ctx, {
							    type: 'bar',
							    data: {
							        labels: [${product_name}],
							        datasets: [{
							            label: '누적 판매량',
							            data: [${top5itemsCount}],
							            backgroundColor: [
							                'rgba(255, 99, 132, 0.8)',
							                'rgba(54, 162, 235, 0.8)',
							                'rgba(255, 206, 86, 0.8)',
							                'rgba(75, 192, 192, 0.8)',
							                'rgba(153, 102, 255, 0.8)',
							                'rgba(255, 159, 64, 0.8)'
							            ],
							            borderColor: [
							                'rgba(255, 99, 132, 0.8)',
							                'rgba(54, 162, 235, 0.8)',
							                'rgba(255, 206, 86, 0.8)',
							                'rgba(75, 192, 192, 0.8)',
							                'rgba(153, 102, 255, 0.8)',
							                'rgba(255, 159, 64, 0.8)'
							            ],
							            borderWidth: 2
							        }]
							    },
							    options: {
							        scales: {
							            yAxes: [{
							                ticks: {
							                   /*  beginAtZero: false */
							                }
							            }]
							        }
							    }
							});
							</script>


						<!--  -->
						<!-- 						</div>
 -->
						<!-- <div class="mt-4 text-center small">
							<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
								Direct
							</span> <span class="mr-2"> <i class="fas fa-circle text-success"></i>
								Social
							</span> <span class="mr-2"> <i class="fas fa-circle text-info"></i>
								Referral
							</span>
						</div> -->
					</div>
				</div>
			</div>
		</div>

		<!-- Content Row -->
		<div class="row">

			<!-- Content Column -->
			<div class="col-lg-6 mb-4">

				<!-- Project Card Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
					</div>
					<div class="card-body">
						<h4 class="small font-weight-bold">
							Server Migration <span class="float-right">20%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-danger" role="progressbar"
								style="width: 20%" aria-valuenow="20" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Sales Tracking <span class="float-right">40%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-warning" role="progressbar"
								style="width: 40%" aria-valuenow="40" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Customer Database <span class="float-right">60%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar" role="progressbar" style="width: 60%"
								aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Payout Details <span class="float-right">80%</span>
						</h4>
						<div class="progress mb-4">
							<div class="progress-bar bg-info" role="progressbar"
								style="width: 80%" aria-valuenow="80" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
						<h4 class="small font-weight-bold">
							Account Setup <span class="float-right">Complete!</span>
						</h4>
						<div class="progress">
							<div class="progress-bar bg-success" role="progressbar"
								style="width: 100%" aria-valuenow="100" aria-valuemin="0"
								aria-valuemax="100"></div>
						</div>
					</div>
				</div>

				<!-- Color System -->
				<div class="row">
					<div class="col-lg-6 mb-4">
						<div class="card bg-primary text-white shadow">
							<div class="card-body">
								Primary
								<div class="text-white-50 small">#4e73df</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-success text-white shadow">
							<div class="card-body">
								Success
								<div class="text-white-50 small">#1cc88a</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-info text-white shadow">
							<div class="card-body">
								Info
								<div class="text-white-50 small">#36b9cc</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-warning text-white shadow">
							<div class="card-body">
								Warning
								<div class="text-white-50 small">#f6c23e</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-danger text-white shadow">
							<div class="card-body">
								Danger
								<div class="text-white-50 small">#e74a3b</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-secondary text-white shadow">
							<div class="card-body">
								Secondary
								<div class="text-white-50 small">#858796</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-light text-black shadow">
							<div class="card-body">
								Light
								<div class="text-black-50 small">#f8f9fc</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 mb-4">
						<div class="card bg-dark text-white shadow">
							<div class="card-body">
								Dark
								<div class="text-white-50 small">#5a5c69</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="col-lg-6 mb-4">

				<!-- Illustrations -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
					</div>
					<div class="card-body">
						<div class="text-center">
							<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
								style="width: 25rem;" src="img/undraw_posting_photo.svg" alt="">
						</div>
						<p>
							Add some quality, svg illustrations to your project courtesy of <a
								target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>,
							a constantly updated collection of beautiful svg images that you
							can use completely free and without attribution!
						</p>
						<a target="_blank" rel="nofollow" href="https://undraw.co/">Browse
							Illustrations on unDraw &rarr;</a>
					</div>
				</div>

				<!-- Approach -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Development
							Approach</h6>
					</div>
					<div class="card-body">
						<p>SB Admin 2 makes extensive use of Bootstrap 4 utility
							classes in order to reduce CSS bloat and poor page performance.
							Custom CSS classes are used to create custom components and
							custom utility classes.</p>
						<p class="mb-0">Before working with this theme, you should
							become familiar with the Bootstrap framework, especially the
							utility classes.</p>
					</div>
				</div>

			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
</body>
</html>