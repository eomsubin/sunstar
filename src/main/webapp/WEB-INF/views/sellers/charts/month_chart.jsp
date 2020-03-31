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
		<h1 class="h3 mb-2 text-gray-800">상품 목록</h1>
		<p class="mb-4">
			상품을 일괄 변경 및 삭제 할 수 있습니다. <a target="_blank"
				href="https://datatables.net">자세한 안내는 이 곳을 클릭</a>.
		</p>
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

</body>
</html>