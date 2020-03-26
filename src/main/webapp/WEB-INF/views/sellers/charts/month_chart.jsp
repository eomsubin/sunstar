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
<canvas id="myChart" width="400" height="100"></canvas>
<script>

var ctx = document.getElementById('myChart').getContext('2d');


var myChart = new Chart(ctx, {

	
	type: 'line',
    data: {
    	
    	labels: [${month}],
   // 	labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
        datasets: [{
            label: '# of Votes',
            
            data:[${mdata}],
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