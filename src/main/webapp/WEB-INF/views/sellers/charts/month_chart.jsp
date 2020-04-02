<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>

	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">통계</h1>
		<p class="mb-4">
			그래프로 판매 경향을 확인 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>
		
		<div class="row">
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
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">일별 수익(3월)</h6>
			</div>
			<div class="card-body">
			
			
				<div class="table-responsive">

					<canvas id="myChart2" width="400" height="100"></canvas>


				</div>
			</div>
		</div>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">월별 수익</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">

					<canvas id="myChart" width="400" height="100"></canvas>


				</div>
			</div>
		</div>




		<script>
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {

		
		type: 'line',
	    data: {
	    	
	    	labels: [${month}],
	        datasets: [{
	            label: '월별 판매금액',
	            data:[${mdata}],
	           // data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 214, 226, 2)'
	             ], 
	            borderColor: [
	                'rgba(245, 122, 158, 7)'
	            ],
	            borderWidth: 2,
	        },{
	            label: '월별 판매금액(배송비 포함)',
	            data:[${mdataa}],
	           // data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(250, 218, 177, 2)'
	             ], 
	            borderColor: [
	                'rgba(255, 186, 97, 6)'
	            ],
	            borderWidth: 2,
	        	
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});

	
	
	
	
var ctx = document.getElementById('myChart2').getContext('2d');
var myChart = new Chart(ctx, {

	
	type: 'line',
    data: {
    	
    	labels: [${days}],
        datasets: [{
            label: '일별 판매금액',
            
            data:[${daydata}],
            backgroundColor: [
                'rgba(196, 237, 255, 3)'
            ], 
            borderColor: [
                'rgba(186, 196, 245, 7)'
            ],
            borderWidth: 2,
        },{
            label: '일별 판매금액(배송비 포함)',
            data:[${daydataplus}],
           // data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(174, 201, 245, 2)'
             ], 
            borderColor: [
                'rgba(23, 95, 212, 6)'
            ],
            borderWidth: 2,
        	
        }
        
        
        ]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

</script>
		
	</div>

</body>
</html>