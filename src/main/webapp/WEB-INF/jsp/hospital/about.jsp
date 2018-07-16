<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/hospital/info.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
</style>
</head>
<body>

<div id="boardMain">

	<div id="photo">
 			지도  			 
	</div>
	
	
	<div id="main">
		<div id="head_box">
			
			<hr id="head_top_hr">
			
			<div id="head_name_area">
				<div id="head_name">
					<span class="name">메디스캔의원</span>
					<span class="category">내과</span>
				</div>
			</div>	
			
			<div id="head_btn_area">
				<div id="head_btns">
					<a href="">
						<img src="${pageContext.request.contextPath}/images/board/search.png" class="pull-right" id="btn_search"/><br>
						<span>길찾기</span>
					</a>
					<a id="2" href="${pageContext.request.contextPath}/reservation/reservationForm.do">
						<img src="${pageContext.request.contextPath}/images/board/booking.png" class="pull-right" id="btn_booking"/><br>
						<span>예약하기</span>
					</a>
					<a>
					
						<c:if test="${result.cnt ==0}">
							<img src="${pageContext.request.contextPath}/images/board/unstar.png" data-flag="no" class="pull-right" id="btn_unlike"/><br>
						</c:if>
						<c:if test="${result.cnt != 0}">
							<img src="${pageContext.request.contextPath}/images/board/star.png" data-flag="yes" class="pull-right" id="btn_unlike"/><br>
						</c:if>
						<span>즐겨찾기</span>
					</a>	
				</div>
			</div>
			
			<div id="head_btn_tap">
				<hr id="head_tap_hr">
					<div id="head_taps">
						<a href="${pageContext.request.contextPath}/hospital/info.do">
							<span>주요정보</span>
						</a>	
						<a href="${pageContext.request.contextPath}/board/photo.do">
							<span>포토요약</span>
						</a>
						<a href="${pageContext.request.contextPath}/board/review.do">
							<span>리뷰</span>
						</a>
					</div>
				<hr id="head_tap_hr">
			</div>
		</div>
		
		<div id="content_box">
			<div id="content_area">
				<div>
					병원명
					<span>매디스캔의원</span>
				</div>
				<div>
					주소
					<span>서울 서초구 강남ㄴ대로 369</span>
				</div>
				<div>
					전화번호
					<span>02-123-1234</span>
				</div>
				<div>
					진료항목
					<span>#내과#이비인후과#영상의학과#통증의학과#피부과#피부클리닉#통장클리닉</span>
				</div>
				<div>
					<span style="padding: 0px;">영업시간</span>
					<canvas id="myChart" width="700" height="300" style="display: block;height: 300px;width: 700px;margin-left: -30px;"></canvas>
					<div id="time_help">점심시간은 통상 12시부터 1시30분까지이므로 방문시 미리 전화 주세요</div>
				</div>
				
				
			<div id="wrong_info">
				<a href="${pageContext.request.contextPath}/hospital/wrongInfoForm.do">잘못된 정보 수정하기</a>
			</div>
			</div>
		</div>
	</div>
</div>

<script>

console.log( "${result.cnt}")



// 		var barChartData = {
// 			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
// 			datasets: [{
// 				label: 'Dataset 1',
// 				backgroundColor: [
// 					window.chartColors.red,
// 					window.chartColors.orange,
// 					window.chartColors.yellow,
// 					window.chartColors.green,
// 					window.chartColors.blue,
// 					window.chartColors.purple,
// 					window.chartColors.red
// 				],
// 				yAxisID: 'y-axis-1',
// 				data: [
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor()
// 				]
// 			}, {
// 				label: 'Dataset 2',
// 				backgroundColor: window.chartColors.grey,
// 				yAxisID: 'y-axis-2',
// 				data: [
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor(),
// 					randomScalingFactor()
// 				]
// 			}]

// 		};
// 		window.onload = function() {
// 			var ctx = document.getElementById('canvas').getContext('2d');
// 			window.myBar = new Chart(ctx, {
// 				type: 'bar',
// 				data: barChartData,
// 				options: {
// 					responsive: true,
// 					title: {
// 						display: true,
// 						text: 'Chart.js Bar Chart - Multi Axis'
// 					},
// 					tooltips: {
// 						mode: 'index',
// 						intersect: true
// 					},
// 					scales: {
// 						yAxes: [{
// 							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
// 							display: true,
// 							position: 'left',
// 							id: 'y-axis-1',
// 						}, {
// 							type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
// 							display: true,
// 							position: 'right',
// 							id: 'y-axis-2',
// 							gridLines: {
// 								drawOnChartArea: false
// 							}
// 						}],
// 					}
// 				}
// 			});
// 		};

// 		document.getElementById('randomizeData').addEventListener('click', function() {
// 			barChartData.datasets.forEach(function(dataset) {
// 				dataset.data = dataset.data.map(function() {
// 					return randomScalingFactor();
// 				});
// 			});
// 			window.myBar.update();
// 		});
	
		
		
		
		
		

var ctx = document.getElementById("myChart").getContext('2d');

var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: ["일","월", "화", "수", "목", "금", "토"],
        datasets: [{
            label: '마감시간',
            data: [24, 14, 21, 22, 23, 18, 15],
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
            borderWidth: 1
        }]
    },
    options: {
    	responsive: false,
        scales: {
           	xAxes: [{
               	ticks: {
                   	beginAtZero:false,
                   	min:0,
           			stepSize:1
               	}
           	}]
    	}
    }
});
var myCnt = ${result.myCnt};

$("#btn_unlike").click(function(){
	if($(this).data("flag")=="no"){
		if(confirm("관심병원 등록 하시겠습니까?")){
			plusStar($(this));
		}
	}else {
		if(confirm("관심병원 취소 하시겠습니까?")){
			minusStar($(this));
		}
	}
})
function plusStar(target){
	 if(myCnt >= 6 ){
		 alert("최대 관심병원 등록은 6개만 가능합니다.");
		 return;
	 }
	 $.ajax({ //
		url:"${pageContext.request.contextPath}/hospital/plusStar.json", //통신할url
		data : {
			id:'${result.hospLike.id}',
			hospCode:'${result.hospLike.hospCode}',
			name:'${result.hospLike.name}',
			mainTreat:'${result.hospLike.mainTreat}'	
		}
	})
	.done(function(result){
		target.attr("src", "${pageContext.request.contextPath}/images/board/star.png");
		target.data("flag","yes");
	})
}
function minusStar(target){
	$.ajax({ //
		url:"${pageContext.request.contextPath}/hospital/minusStar.json", //통신할url
		data : {
			id:'${result.hospLike.id}',
			hospCode:'${result.hospLike.hospCode}'
		}
	})
	.done(function(result){
		target.attr("src", "${pageContext.request.contextPath}/images/board/unstar.png");
		target.data("flag","no");
	})
	.fail(function(result){
		console.log(result);
	})
}



</script>
	

</body>
</html>