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

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">월별 수익(배송비 제외)</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">

					<canvas id="myChart" width="400" height="100"></canvas>


				</div>
			</div>
		</div>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">월별 수익(배송비 포함)</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">

					<canvas id="myChart2" width="400" height="100"></canvas>


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
	            label: '월별 총 판매금액',
	            data:[${mdata}],
	           // data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0)'
	             ], 
	            borderColor: [
	                'rgba(255, 99, 132, 1)'
	            ],
	            borderWidth: 2,
	        },{
	            label: '월별 배송비 포함 판매금액',
	            data:[${mdataa}],
	           // data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 222, 222, 5)'
	             ], 
	            borderColor: [
	                'rgba(111, 111, 111, 7)'
	            ],
	            borderWidth: 2,
	        	
	        },{
	            label: '월별 순수익',
	            data:[${mdatab}],
	           // data: [12, 19, 3, 5, 2, 3],
	            backgroundColor: [
	                'rgba(255, 222, 222, 5)'
	             ], 
	            borderColor: [
	                'rgba(235, 213, 52, 8)'
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
    	
    	labels: [${month}],
        datasets: [{
            label: '# of Votes',
            
            data:[${mdataa}],
           // data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0)',
                'rgba(54, 162, 235, 0)',
                'rgba(255, 206, 86, 0)' ,
                'rgba(75, 192, 192, 0)',
                'rgba(153, 102, 255, 0)',
                'rgba(255, 159, 64, 0)' 
            ], 
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)' ,
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)' 
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

</script>

</body>
</html>