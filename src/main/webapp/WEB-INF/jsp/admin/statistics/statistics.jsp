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
<h3><button onclick="setPrevYear()">prev</button>연간 예약건수<span id="lineDateStr"></span><button onclick="setNextYear()">next</button></h3>
<div id="lineCanvasBox"></div>
</div>

<div id="weekStat">
<h3>주간 페이지 방문자수</h3>
<div id="barCanvasBox"></div>
</div>

<div id="monthStat">
<br><h3><button onclick="setPrevMonth()">prev</button><span id="pieDateStr"></span> 예약자 정보<button onclick="setNextMonth()">next</button></h3>
<h4>　<span id="sexCanvasTitle">성별</span> <span id="ageCanvasTitle">연령대</span> </h4>
<div id="sexPieCanvasBox"></div>
<div id="agePieCanvasBox"></div>
</div>



</div>
<script>
var date = new Date();
var thisYear = date.getFullYear();
var thisMonth = date.getMonth()+1;
var thisLineYear = date.getFullYear();
var thisLineMonth = date.getMonth()+1;

function setPrevMonth() {
	if(thisMonth==1) {
		thisYear = thisYear-1;
		thisMonth = 12;
	}else {
	thisMonth = thisMonth - 1;
	}
	getPieData();
}

function setNextMonth() {
	if(thisMonth==12) {
		thisYear = thisYear+1;
		thisMonth = 1;
	}else {
	thisMonth = thisMonth + 1;
	}
	getPieData();
}
function setPrevYear() {
	thisLineYear = thisLineYear - 1;
	thisLineMonth = 12;
	getLineData();
}

function setNextYear() {
	thisLineYear = thisLineYear + 1;
	if(thisLineYear== date.getFullYear()) {
		thisLineMonth = date.getMonth()+1;
	}
	getLineData();
}


function getLineData() {
	$.ajax({
		type: "POST",
		url: "/seeadoctor/admin/statistics/getLineData.json",
		data: {
			hospitalSeq : "${user.hospitalSeq}",
			thisYear : thisLineYear,
			thisMonth : thisLineMonth
		},
		success: function (lineArr) {
			
			$("#lineDateStr").text("("+thisLineYear+"년)");
			
			/*
			var lineMonthArr = [];
			var lineCntArr = [];
			for(let i=0; i<lineData.lineMonth.length; i++) {
				lineMonthArr[i] = lineData.lineMonth[i];
				lineCntArr[i] = lineData.lineCnt[i];
			}
//		 	console.log(lineMonthArr);
//		 	console.log(lineCntArr);

			setLineCanvas(lineMonthArr, lineCntArr);*/
			var monthArr = new Array();
			for(var i=0; i<thisLineMonth; i++) {
				monthArr[i] = i+1;
			}
			setLineCanvas(monthArr, lineArr);
		}
	});
}

getLineData();

function setLineCanvas(monthArr, lineArr){
	
var data = {
	    labels: 
	    	monthArr
	    , 
	    datasets: [
	        {
	    		fill: false,
	            label: '예약건수',
	            data: 
	            	lineArr
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


function getBarData() {
	$.ajax({
		type: "POST",
		url: "/seeadoctor/admin/statistics/getBarData.json",
		data: {
			hospitalSeq : "${user.hospitalSeq}"
		},
		success: function (visitArr) {
			setBarCanvas(visitArr);
		}
	});
}

getBarData();


function setBarCanvas(visitArr){
var data = {
	    labels: [
	    	'월', '화', '수', '목', '금', '토', '일'
	    ], 
	    datasets: [
	        {
	            label: '페이지방문자수',
	            data: visitArr,
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