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
<h3>연간 예약건수<span id="lineDateStr"></span></h3>
<div id="lineCanvasBox"></div>
</div>

<div id="weekStat">
<h3>주간 페이지 방문자수</h3>
<div id="barCanvasBox"></div>
</div>

<div id="monthStat">
<br><h3><button onclick="setPrevDate()">prev</button><span id="pieDateStr"></span> 예약자 정보<button onclick="setNextDate()">next</button></h3>
<h4>　<span id="sexCanvasTitle">성별</span> <span id="ageCanvasTitle">연령대</span> </h4>
<div id="sexPieCanvasBox"></div>
<div id="agePieCanvasBox"></div>
</div>



</div>
<script>
var date = new Date();
var thisYear = date.getFullYear();
var thisMonth = date.getMonth()+1;

function setPrevDate() {
	if(thisMonth==1) {
		thisYear = thisYear-1;
		thisMonth = 12;
	}else {
	thisMonth = thisMonth - 1;
	}
	console.log(thisMonth);
	getPieData();
}

function setNextDate() {
	if(thisMonth==12) {
		thisYear = thisYear+1;
		thisMonth = 1;
	}else {
	thisMonth = thisMonth + 1;
	}
	console.log(thisMonth);
	getPieData();
}


function getLineData() {
	$.ajax({
		type: "POST",
		url: "/seeadoctor/admin/statistics/getLineData.json",
		data: {
			hospitalSeq : "${user.hospitalSeq}",
			thisYear : thisYear,
			thisMonth : thisMonth
		},
		success: function (lineData) {
			
			$("#lineDateStr").text("("+thisYear+"년)");
			
			var lineMonthArr = [];
			var lineCntArr = [];
			for(let i=0; i<lineData.lineMonth.length; i++) {
				lineMonthArr[i] = lineData.lineMonth[i];
				lineCntArr[i] = lineData.lineCnt[i];
			}
//		 	console.log(lineMonthArr);
//		 	console.log(lineCntArr);

			setLineCanvas(lineMonthArr, lineCntArr);
		}
	});
}

getLineData();

function setLineCanvas(lineMonthArr, lineCntArr){
	
var data = {
	    labels: 
	    	lineMonthArr
	    , 
	    datasets: [
	        {
	    		fill: false,
	            label: '예약건수',
	            data: 
	            	lineCntArr
	            ,
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
	                    stepSize: 5
	                }
	            }
	        ]
	    }
	};
document.getElementById('lineCanvasBox').innerHTML = '<canvas id="lineCanvas"></canvas>';
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
document.getElementById('barCanvasBox').innerHTML = '<canvas id="barCanvas"></canvas>';
var ctx = document.getElementById("barCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: data,
    options: options
});
}
setBarCanvas();

function getPieData() {


	$.ajax({
		type: "POST",
		url: "/seeadoctor/admin/statistics/getPieData.json",
		data: {
			hospitalSeq : "${user.hospitalSeq}",
			thisYear : thisYear,
			thisMonth : thisMonth
		},
		success: function (pieData) {
			
			$("#pieDateStr").text(thisYear+"년 "+thisMonth+"월 ");
			console.log(pieData.sexArr);
			console.log(pieData.ageArr);
			setSexPieCanvas(pieData.sexArr);
			setAgePieCanvas(pieData.ageArr);
		}
	});

}
getPieData();

function setSexPieCanvas(dataArr){
$("#sexPieCanvas").html("");
var data = {
	    labels: [
	    	'여', '남'
	    ], 
	    datasets: [
	        {
	            label: '성별',
	            data: [
	            	dataArr[0], dataArr[1]
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
document.getElementById('sexPieCanvasBox').innerHTML = '<canvas id="sexPieCanvas"></canvas>';
var ctx = document.getElementById("sexPieCanvas").getContext('2d');                                           
var myBarChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options
});
}


function setAgePieCanvas(dataArr){
var data = {
	    labels: [
	    	'10대', '20대', '30대', '40대', '50대', '60대', '70대이상'
	    ], 
	    datasets: [
	        {
	            label: '나이대',
	            data: [
	            	dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4], dataArr[5], dataArr[6]
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
document.getElementById('agePieCanvasBox').innerHTML = '<canvas id="agePieCanvas"></canvas>';
var ctx = document.getElementById("agePieCanvas").getContext('2d');                                            
var myBarChart = new Chart(ctx, {
    type: 'pie',
    data: data,
    options: options
});
}



</script>
</body>
</html>