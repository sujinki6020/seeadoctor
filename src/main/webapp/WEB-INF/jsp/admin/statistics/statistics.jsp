<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/statistics/statistics.css">
</head>
<body>

<div class="viewWrap">

<div id="yearStat">
<h3>연간 예약건수</h3>
<canvas id="lineCanvas"></canvas>
</div>

<div id="weekStat">
<h3>주간 페이지 방문자수</h3>
<canvas id="barCanvas"></canvas>
</div>

<div id="monthStat">
<br><h3>월간 예약자 정보</h3>
<h4>　<span id="sexCanvasTitle">성별</span> <span id="ageCanvasTitle">연령대</span> </h4>
<canvas id="sexPieCanvas"></canvas>
<canvas id="agePieCanvas"></canvas>

</div>



</div>
<script>
function setLineCanvas(){
var data = {
	    labels: [
	    	'1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'
	    ], 
	    datasets: [
	        {
	    		fill: false,
	            label: '예약건수',
	            data: [
	            	50, 56, 58, 54, 50, 49, 52, 53, 55, 57, 59, 60
	            ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',                                                               
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 0.5
	        }
	    ]
	};
var options = {
	    animation: {
	        animateScale: true
	    },
	    legend: {
	        display: false
	    },
	    responsive: false,
	    scales: {
	        yAxes: [
	            {
	                ticks: {
	                    beginAtZero: false,
	                    stepSize: 1
	                }
	            }
	        ]
	    }
	};
var ctx = document.getElementById("lineCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'line',
    data: data,
    options: options
});
}
setLineCanvas();


function setBarCanvas(){
var data = {
	    labels: [
	    	'월', '화', '수', '목', '금', '토', '일'
	    ], 
	    datasets: [
	        {
	            label: '페이지방문자수',
	            data: [
	            	50, 56, 58, 54, 50, 49, 52
	            ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',                                                               
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 0.5
	        },
	    ]
	};
var options = {
	    animation: {
	        animateScale: true
	    },
	    legend: {
	        display: false
	    },
	    responsive: false,
	    scales: {
	    	xAxes : [
	            {
	                ticks: {
	                    beginAtZero: true,
	                    stepSize: 10
	                }
	            }
	    	]
	    }
	};
var ctx = document.getElementById("barCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: data,
    options: options
});
}
setBarCanvas();

function setSexPieCanvas(){
var data = {
	    labels: [
	    	'여', '남'
	    ], 
	    datasets: [
	        {
	            label: '성별',
	            data: [
	            	60, 40
	            ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',                                                               
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 0.5
	        }
	    ]
	};
var options = {
	    animation: {
	        animateScale: true
	    },
	    responsive: false,
	};
var ctx = document.getElementById("sexPieCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options
});
}
setSexPieCanvas();

function setAgePieCanvas(){
var data = {
	    labels: [
	    	'10대', '20대', '30대', '40대', '50대', '60대', '70대이상'
	    ], 
	    datasets: [
	        {
	            label: '나이대',
	            data: [
	            	10, 30, 20, 10, 10, 10, 10
	            ],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',                                                               
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255,99,132,1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 0.5
	        }
	    ]
	};
var options = {
	    animation: {
	        animateScale: true
	    },
	    responsive: false,
	};
var ctx = document.getElementById("agePieCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options
});
}
setAgePieCanvas();


</script>
</body>
</html>