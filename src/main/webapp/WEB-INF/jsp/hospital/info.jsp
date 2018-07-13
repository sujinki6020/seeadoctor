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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}

#boardMain{
	height: 100%;
}
#photo{
	z-index: 1;
    width: 1100px;
    height: 300px;
    margin: auto;
    border: 1px solid #ccc;
    position: relative;
}	
#main{
	position: relative;
    z-index: 2;
    outline: 1px solid #ccc;
    width: 800px;
    margin: 0 auto;
    margin-top: -150px;
}

#head_box{
/* 	border: 1px solid red; */
	width: 800px;
	height:330px;
	background: white;

}
#head_top_hr{
    margin-top:0px;
	height: 4px;
    background: #529dbc;
    border-top-width: 0px;
}	

#head_name_area{
	margin : 0 auto;
	line-height:40px;
	width: 800px;
    margin-top: 60px;
/* 	border: 1px solid; */
}
#head_name {
	line-height:80px;
	margin : 0 auto;
	width: 220px;
	height: 70px;
/* 	border: 1px solid; */
}

#head_tap_hr{
	background:#fafafa;
	width: 700px;
	margin: auto;
}

.name{
    font-weight: bold;
	font-size:30px;
}

#head_btn_area{
	text-align: center;
 	height:120px; 
    position: relative; 
/* 	border: 1px solid; */
}

#head_btns a{
	float:left;
    padding: 15px 30px 0px 20px;
}

#head_btns {
	width:350px;
	height:110px;
	margin : 0 auto;
/* 	border:1px solid blue; */
}
#head_btn_tap{
	height:45px;
/*  	border:1px solid blue;  */
}
#head_taps{
	width:320px;
	height:35px;
	margin : 10px 20px 10px 120px ;
	font-weight: bold;
	line-height: 33px;
}
#head_taps span{
	padding: 0px 20px 0px 0px;
}
#content_box{
 	width: 800px;
    height: 600px;
}
#content_area{
 	width: 700px;
    height: 100%;
    margin: 20px 0px 0px 75px;
}
#content_area span{
	padding: 0px 25px;
}
#content_area div{
	margin-bottom: 20px;
	font-weight: bold;
	height: auto;
}
#map{
    width: 600px;
    height: 250px;
    border: 1px solid #ccc;
    margin: 10px 0px 0px 0px;
}
#time_help{
	margin: 0 auto;
    width: 420px;
    line-height: 70px;
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
<%-- 						${result.myCnt}-${result.cnt} --%>
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
                   	min:9,
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
		 alert("관심병원이 6개이상이여서.. 더이상 즐겨찾기를 할 수 없습니다");
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