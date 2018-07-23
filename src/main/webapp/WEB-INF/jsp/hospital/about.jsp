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
<link rel="stylesheet" href="/seeadoctor/css/hospital/info.css?ver=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IutEeaTAqvux8P5IXvhG&submodules=geocoder"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.2.6/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.2.6/js/swiper.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=X_0Pf35zZ_CLoet1bVpE&submodules=geocoder"></script>
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
.table-bordered>tbody>tr>th,.table-bordered>tbody>tr>td,
.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th, 
.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border: 0px solid;
	border-bottom: 1px solid #ddd;
}
.table>tbody>tr>td{
	padding:10px;
}
.table > tbody {
	border: 1px solid white;
}
.table{
    width: 90%;
    max-width: 100%;
    margin-bottom: 35px;
    margin-left: 35px;
}
textarea.form-control {
    height: 400px;
}
#btn_booking_blocked {
 cursor: not-allowed;
}
.swiper-container {
  width: 100%;
  height: 100%;
  margin-bottom: 95px;
}
.swiper-slide {
    	width: 600px;
      heght: 400px;
      text-align: center;
      font-size: 18px;
      background: #fff;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox; /*내용중앙정렬*/
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center; /*좌우기준 중앙정렬*/
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center; /*위아래기준 중앙정렬*/
    }


</style>
</head>
<body>
<div id="boardMain">

	<div id="map">지도</div>
	
	
	<div id="main">
		<div id="head_box">
			
			<hr id="head_top_hr">
			
			<div id="head_name_area">
				<div id="head_name">
					<div id="head_name_s">
						<span id="hosp_name">${result.hospResult.dutyName}</span>
						<span class="category">${result.hospResult.dutyDivNam}</span>
					</div>
				</div>
			</div>	
			
			<div id="head_btn_area">
				<div id="head_btns">
				
					<a href="">
						<img src="${pageContext.request.contextPath}/images/board/search.png" class="pull-right" id="btn_search"/><br>
						<span>길찾기</span>
					</a>
					
					<c:choose>
						<c:when test="${result.docCnt==0}">
					<a href="#1">
						<img src="${pageContext.request.contextPath}/images/board/booking-blocked.png" class="pull-right" id="btn_booking_blocked"/><br>
						<span>예약하기</span>
					</a>
						</c:when>
						
					<c:otherwise>
					<a id="2" href="${pageContext.request.contextPath}/reservation/reservationForm.do?hospitalSeq=${result.hospResult.hospitalSeq}">
						<img src="${pageContext.request.contextPath}/images/board/booking.png" class="pull-right" id="btn_booking"/><br>
						<span>예약하기</span>
					</a>
					</c:otherwise>
					</c:choose>
					
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
						
						<a href="${pageContext.request.contextPath}/hospital/about.do?hospitalSeq=${param.hospitalSeq}&tab=1">
							<span>주요정보</span>
						</a>	
						
						<a href="#1" onclick="photo(${param.hospitalSeq});">
							<span>포토요약</span>
						</a>
						
						<a href="#1" onclick="review();">
							<span>리뷰</span>
						</a>
					</div>
				<hr id="head_tap_hr">
			</div>
		</div>
		
		<div id="content_box">
			<div id="content_area_about">
				<div id="about_s">
					<div>
						병원명
						<span style="padding-left: 37px;">${result.hospResult.dutyName}</span>
					</div>
					<div>
						주소
						<span style="padding-left: 50px;">${result.hospResult.dutyAddr}</span>
					</div>
					<div>
						진료항목
						<span style="padding-left: 22px;">#내과#이비인후과#영상의학과#통증의학과#피부과#피부클리닉#통장클리닉</span>
	<%-- 					<span>${result.hospResult.addTreat}</span>//병원어드민이 상세정보 입력 시 가져올수있음 --%>
					</div>
					<div>
						전화번호
						<span style="padding-left: 26px;">${result.hospResult.dutyTel1}</span>
						<span style="padding-left: 26px;">${result.hospResult.dutyTel3}</span>
					</div>
					<div style="height: 47px;">
						<span id="info1">부가정보</span>
						<span style="padding-left: 26px;">${result.hospResult.dutyEtc}, ${result.hospResult.dutyInf}</span><br>
					</div>
				</div>
				<div style="width: 710px; margin: 28px 13px 0px -34px;">
<%-- 					<span style="padding: 0px;">${result.hospResult.time}</span> //차트--%>
					<canvas id="myChart" width="700" height="300"></canvas>
					<div id="time_help">점심시간은 통상 12시부터 1시30분까지이므로 방문시 미리 전화 주세요</div>
				</div>
				
<!-- 			<div id="wrong_info"> -->
<%-- 				<a href="${pageContext.request.contextPath}/hospital/wrongInfoForm.do">잘못된 정보 수정하기</a> --%>
<!-- 			</div> -->
			</div>
		</div>

<!-- 		리뷰		 -->
		<div id="content_review" style="display: none;">
		
			<div id="content_area1">
				<div id="review_row">
					<span id="review">리뷰<span id="reviewCount"></span>개의 글</span>
					<span id="review1">${result.hospResult.dutyName}에 다녀온 후기를 남겨주세요!</span>
					<hr id="review_hr">
				</div>
				
				<div id="content_review">
					<table summary="This table shows how to create responsive tables using Datatables' extended functionality" 
	     					 class="table table-bordered table-hover dt-responsive gy">
							<tbody></tbody>
					</table>
				</div>
					
				<nav>	
					<ul class="pagination"></ul>
				</nav>	
					
		   		<div id= search_area>
					<form id="search">
					   		<select name="selectCategory" class="btn btn-default search-bar1" style="width:100px;">
					   			<option value="">선택</option>
				   				<option value="1">글쓴이</option>
				   				<option value="2">제목+내용</option>
				   			</select>
					   	
					   	<input type="text" name="searchKeyWord" class="search" placeholder="검색어를 입력하세요" style="height: 30px;"/>
						<button type="button" class="btn btn-default search-bar1" onclick="review()">검색</button> 
						<button type="button" id="writeid" class="btn btn-default pull-right"onclick='writeForm()'>글쓰기</button>
					</form>
				</div>
			</div>
		</div>

<!-- 포토요약 -->
		<div id="content_photo" style="display: none;">
			
			<div id="in_out_photo">
				<span style="float: left;">"${result.hospResult.dutyName}"의 사진입니다.</span> 
				<span style="float: right;">내외부 사진(<span id="picCnt"></span>개)</span>
			</div>
			
			<div class="swiper-container">
			  
			  <div class="swiper-wrapper">
<!-- 			    <div class="swiper-slide">Slide 10</div> -->
			  </div>
			  
			  <!-- Add Pagination -->
			  <div class="swiper-pagination"></div>
			  <!-- Add Arrows -->
			  <div class="swiper-button-next"></div>
			  <div class="swiper-button-prev"></div>
			  
			</div>
			
		</div>
		
<!-- 	글쓰기 -->
			<div id="content_area_writeForm" style="display: none;">
				
				<div id="form1">
					<form id="form" enctype="multipart/form-data" method="post">
					<input type="hidden" name="hospitalSeq" value="${param.hospitalSeq}">
					<input type="hidden" name="reserveSeq" value="${param.reserveSeq}">
					<div id="review_row1">
					<span id="review">리뷰쓰기</span>

					<input type="text" id="name" name="name" style="border: 1px; width: 74px; margin-left: 510px;">
					<input type="hidden" name="userSeq" value="${sessionScope.user.userSeq}">
					<hr id="review_hr">
				</div>
					<input type="hidden" name="no" >
					<div id="title">
						<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
					</div>
						
					<div id="msg">
						<textarea class="form-control" id="content" name="content" placeholder="내용을 입력해주세요"></textarea>
					</div>

					<div id="filearea_write">
							<span id="file_span" >첨부파일</span>
							<input type="file" multiple="multiple" name="files" id="file"
									accept=".gif, .jpg, .png" placeholder="지원되는 파일 양식: jpg, png, gif">
									
							<div onchange="dropfile();">Drap and Drop here.</div>
					</div>

					<hr id="review_hr">
					<div id="btn_adm">
						<button type="button" id="updateBtn" class="btn btn-default" style="display:none; margin-bottom: 10px;" onclick="updateReview();">수정</button>
						<button type="button" id="registBtn" class="btn btn-default" style="display:none; margin-bottom: 10px;" onclick="writeReview();">등록</button>
						<button type="button" class="btn btn-default" style="margin-bottom: 10px;" 
								onclick="review()">취소</button>
					</div>
				</form>
				</div>
			</div>
		
<!-- 디테일 -->
		<div id="content_detail" style="display: none;">
			
			<div id="content_are_detail">
				<div id="detail_row">
					<span id="title1"></span>
					<span id="nickName1"></span>
						<hr id="detail_hr">
					<span id="view_cnt1"></span>
					<span id="date1"></span>
						<hr id="detail_hr">
				</div>
				
				<div id="filearea"></div>
				<div id="detail_content">${result.board.content}</div>
			</div>
			
			
			<!-- 댓글파트 -->
			<div id="allComment">
<!-- 				<form action="commentUpdate.json" method="post"> -->
<%-- 					<input type="hidden" name="no" value="${result.board.no}"/> --%>
<!-- 					<input type="hidden" name="commentNo" value=""/> -->
<!-- 				</form> -->
					
					<%-- 댓글 리스트--%>
					<div id="commentList"></div>
				
				<div id="commentComment">
					<%-- 댓글입력파트 --%>
					<form role="form" id="rForm" class="clearfix" >
						<div class="comment">
							<div id="commentId">
								<label class="sr-only" for="name" >아이디</label>
								<input type="hidden" name="userSeq" id="id" value="${sessionScope.user.userSeq}" /> 
								<input type="text" id="name" name="name" class="form-control" value="${sessionScope.user.name}" readonly />
							</div>
							
							<div id="commentWrite" style="height: 140px;">
								<label class="sr-only" for="content">댓글내용입력</label>
								<textarea class="form-control" id="cmt_Content" name="content" placeholder="내용을 입력하세요"></textarea>
								
								<button type="submit" id="btnCommentWrite" class="btn btn-primary btnCommentWrite">댓글쓰기</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			
<!-- 			<hr id="detail_hr"> -->
			<div id="buttons" style="display: none;">
				<div id="btn_s">
					<%-- 목록버튼 --%>
					<button type="button" class="btn btn-default" onclick="review()">목록</button>
					<%-- 글쓰기버튼 --%>
					<button type="button" class="btn btn-default" id="writeid" onclick="writeForm();">글쓰기</button>
					<%-- 수정삭제버튼--%>
					<div id="btn_update_delete" style="display:none;">
						<button type="button" class="btn btn-default" id="updateid" onclick="updateForm()">수정</button>
						<button type="button" class="btn btn-default" id="deleteid" onclick='delete1()'>삭제</button>
					</div>
				</div>	
			</div>
			 
		</div>
		
		
		
	</div>


</div>

<script>
//탭 케이스 이름 줘서 각각 페이지로 들어갈 수 있도록 하는 코드

$(function () {
	   if("${param.review}" == 1){
			$("#content_box").hide();
			$("#content_review").hide();
			$("#content_photo").hide();
			$("#content_area_writeForm").show();
			$("#content_detail").hide();
			
			$("#registBtn").show();
			$("#updateBtn").hide();

			/*예약리뷰용*/
			//$("#form input[name='reserveSeq']").val("${param.reserveSeq}");
			
			$("#form input[name='name']").val("${sessionScope.user.name}");
			$("#form input[name='no']").val("0");
			$("#form input[name='title']").val("");
			$("#form textarea[name='content']").val("");
	   }
	   if("${param.review}" == 2){
				$("#content_box").hide();
				$("#content_area_writeForm").show();
				
			$.ajax({
				url : "updateForm.json",
				data : {
					no: "${param.reviewNo}",
					hospitalSeq: "${param.hospitalSeq}"
				},
				dataType: "json"
			})
			.done(function(result){
				$("#content_detail").hide();
				
				$("#registBtn").hide();
				$("#updateBtn").show();
				
				$("#form input[name='name']").val(result.board.name);
				$("#form input[name='no']").val(result.board.no);
				$("#form input[name='title']").val(result.board.title);
				$("#form textarea[name='content']").val(result.board.content);
			});
	};
});

//위에 지도맵코드
let map = new naver.maps.Map('map', {center : new naver.maps.LatLng( "${result.hospResult.wgs84Lat}" , "${result.hospResult.wgs84Lon}")} );
let marker = new naver.maps.Marker( { position : new naver.maps.LatLng( "${result.hospResult.wgs84Lat}" , "${result.hospResult.wgs84Lon}") ,  map:map });

console.log( "${result.cnt}")
var ctx = document.getElementById("myChart").getContext('2d');

var myChart = new Chart(ctx, {
    type: 'horizontalBar',
    data: {
        labels: ["월", "화", "수", "목", "금", "토","일"],
        datasets: [{
            label: '마감시간',
            data: ['${result.hospResult.dutyTime1c}', '${result.hospResult.dutyTime2c}',
            		'${result.hospResult.dutyTime3c}', '${result.hospResult.dutyTime4c}',
            		'${result.hospResult.dutyTime5c}', '${result.hospResult.dutyTime6c}',
            		'${result.hospResult.dutyTime7c}'],
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
           			stepSize:60
               	}
           	}]
    	}
    }
});
var myCnt = 0;

$("#btn_unlike").click(function(){
	
	$.ajax({
		url : "myCnt.json",
		data : {
			id: '${sessionScope.user.id}'
		},
		success : function(data){
			myCnt = data;
			
			if($("#btn_unlike").data("flag")=="no"){
				if(confirm("관심병원 등록 하시겠습니까? (나의 관심병원 개수:"+ myCnt +"/6)" )){
					plusStar($("#btn_unlike"));
				}
			}else {
				if(confirm("관심병원 취소 하시겠습니까?")){
					minusStar($("#btn_unlike"));
				}
			}
		}
	});
});
function plusStar(target){
	 if(myCnt >= 6 ){
		 alert("최대 관심병원 등록은 6개만 가능합니다.");
		 return;
	 } 
	 $.ajax({ 
		url:"${pageContext.request.contextPath}/hospital/plusStar.json", //통신할url
		data : {
			id:'${sessionScope.user.id}',
			hospitalSeq:'${result.hospResult.hospitalSeq}',
			dutyName:'${result.hospResult.dutyName}',
			dutyDivNam:'${result.hospResult.dutyDivNam}',
			userName: '${sessionScope.user.name}'
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
			id:'${sessionScope.user.id}',
			hospitalSeq:'${result.hospResult.hospitalSeq}'
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


// 리뷰
function review(pageNo) { //밑에 페이지번호 눌렀을 때도 실행됨
	if(pageNo === undefined){ //=== 타입과 값이 같을 때. 타입까지 같이 비교
		pageNo=1;
	}
// 	console.log($("select[name='selectCategory']").val());
// 	console.log($("input[name='searchKeyWord']").val());
	$.ajax({
		url:"review.json",
		data : {
			hospitalSeq: "${param.hospitalSeq}",
			selectCategory : $("select[name='selectCategory']").val(),
			searchKeyWord : $("input[name='searchKeyWord']").val(),
			pageNo : pageNo
		}
	})
	.done(function(result){
		makeReviewList(result);
	})
	.fail(function(result){
		console.log(result);
	})	
		
}

/*
//검색
function search(){
	$.ajax({
		type : "POST",
		url : "search.json",
		data : {
			hospitalSeq : "${param.hospitalSeq}",
			selectCategory : $("select[name='selectCategory']").val(),
			searchKeyWord : $("input[name='searchKeyWord']").val()
		}
	})
	.done(function (result) {
		makeReviewList(result);
	})
}
*/

function makeReviewList(result) {
	
	$("#content_box").hide();
	$("#content_photo").hide();
	$("#content_review").show();
	$("#content_area_writeForm").hide();
	$("#content_detail").hide();
	$("#buttons").hide();
	$("#btn_update_delete").hide();
	$("#reviewCount").text(result.count);
	
	var reviewListHtml = "";	
	for(var i = 0; i < result.list.length; i++) {
		var board = result.list[i];
		reviewListHtml += "<tr>";
		reviewListHtml += "<td><a href='#1' onclick='detail("+ board.no +");'>" + board.title+"("+board.commentCnt+")" + "</a></td>";
		var date = new Date(board.regDate);
		var time = date.getFullYear()+"-"+(date.getMonth()+1)
				+"-"+ date.getDate();
		reviewListHtml += "<td>" +time + "</td>";
		reviewListHtml += "<td>" + board.name + "</td>";
		reviewListHtml += "</tr>";
	}
	if (result.list.length == 0) {
		reviewListHtml += '<tr><td colspan="4">아직 작성된 리뷰가 없습니다!</td></tr>';
	}
	$("#content_review > table > tbody").html(reviewListHtml);
	
	makePageLink(result.pageResult);
}

//페이징
function makePageLink(paging){
	var html="";
	if(paging.count != 0){
		var clz="";
		if(paging.prev == false){ //없으면
			clz = "disabled";
		}
		html += '<li class="'+clz+'">';
		
		var fn="";
		
		if(paging.prev == true){//탭이 있으면
			fn = "javascript:review("+(paging.beginPage-1)+");"; //언제 이렇게 쓰느건가요? 코드이해안됨.. 비긴페이지-1이 무슨뜻인가요?
		}
		html += '<a href="'+fn+'"aria-label="Previous">';
		html += '	<span aria-hidden="true">&laquo;</span>';
		html += '</a>';
		html += '</li>';
// 		alert("beginPage"+paging.beginPage);
// 		alert("endPage"+paging.endPage);
		for (var i = paging.beginPage; i <= paging.endPage; i++){
			if(i == paging.pageNo){
				html += '<li class="active"><a href="#1">' + i + '</a></li>'; //코드이해못함
			}
			else{
				html += '<li><a href="javascript:review(' + i + ');">' + i + '</a></li>';
			}
		}
		
		clz = "";
		if(paging.next === false){
		//alert("다음페이지가 없으면" + paging.next) //탭의 다음탭? 1~10번, 11~20번
			clz="disabled";
		}
		html += '<li class="'+clz+'">';
		
		fn="";
		
		if(paging.next == true){
			fn = "javascript:review("+(paging.endPage+1)+");";
		}
		html += '<a href="'+fn+'" aria-label="Next">';
		html += '	<span aria-hidden="true">&raquo;</span>';
		html += '</a>';
		html += '</li>'
	}
	$("nav > ul.pagination").html(html);
}



//사진
function photo(hospitalSeq) {

	$.ajax({ 
		url:"photo.json",
		data : {
			hospitalSeq : hospitalSeq
		}
	})
	.done(function(files){
		$("#content_box").hide();
		$("#content_review").hide();
		$("#content_photo").show();
		$("#content_detail").hide();
		$("#content_area_writeForm").hide();
		$("#buttons").hide();
		console.dir(files);
		
	
		var fileList ="";
		for(var i=0; i< files.length; i++) {
			var file = files[i];
			fileList += " <div class='swiper-slide'><img width='600px' height='400px' src='${pageContext.request.contextPath}/hospital/fileOutPut.do?filePath="+file.filePath+"&sysName="+file.sysName+"'/></div>"
			}
		if (files.length == 0) {
			fileList += "<div><img width='600px' height='400px' src='${pageContext.request.contextPath}/images/board/no.png'/></div>"
		}
		$("#picCnt").html(files.length);
		$(".swiper-wrapper").html(fileList);
			var swiper = new Swiper('.swiper-container', {
			    pagination: { //페이징 설정
			      el: '.swiper-pagination',
			      type: 'progressbar',
			      clickable:true //페이징클릭 시 해당영역으로 이동
			    },
			    navigation: { //네비게이션 설정
			      nextEl: '.swiper-button-next', //다음
			      prevEl: '.swiper-button-prev'//이전
			    }
			  });
		})
	.fail(function(result){
		console.log(result);
	})	
}




//글쓰기폼
function writeForm(){
	$("#content_box").hide();
	$("#content_review").hide();
	$("#content_photo").hide();
	$("#content_area_writeForm").show();
	$("#content_detail").hide();
	
	$("#registBtn").show();
	$("#updateBtn").hide();

	$("#form input[name='name']").val("${sessionScope.user.name}");
	$("#form input[name='no']").val("0");
	$("#form input[name='title']").val("");
	$("#form textarea[name='content']").val("");
	$("#form input[name='files']").val("");
}

//글쓰기
function writeReview() {
	
	if($("input[name=title]").val()==""){
		alert("제목을 입력하세요")
	return false;
	}
	if($("textarea[name=content]").val()==""){
		alert("내용을 입력하세요")
	return false;
	}
	
	var formData = new FormData($("#form")[0])
	
	$.ajax({ 
		url:"write.json",
		data: formData,
		type: "POST",
		// 파일 업로드를 위한 속성 설정
		dataType: "text",
		processData: false,
		contentType: false
	})
	.done(function(result){
		if(result != "success"){
			alert("글안올라갔다!");
		}
		$("#content_box").hide();
		$("#content_photo").hide();
		$("#content_area_writeForm").hide();
		$("#content_detail").hide();
		$("#content_review").show();
		$("#buttons").show();
		review();
	});
}

var detailNo = 0;

//디테일
function detail(no){
	$("#content_box").hide();
	$("#content_photo").hide();
	$("#content_review").hide();
	$("#content_area_writeForm").hide();
	$("#content_detail").show();
	$("#buttons").show();
	
	$.ajax({ 
		url : "detail.json",
		data : {
			no: no,
			hospitalSeq: "${param.hospitalSeq}"
		}
	})
	.done(function(result) { //가지고온 result에 접근해서 result.board.no 이렇게 쓸 수 있는것.
		
		detailNo = result.board.no;
		
		$("#content_detail > #content_are_detail > #detail_row > #title1").html(result.board.title);
		$("#content_detail > #content_are_detail > #detail_row > #nickName1").html(result.board.name);
		$("#content_detail > #content_are_detail > #detail_row > #view_cnt1").html(result.board.viewCnt);
			var date = new Date(result.board.regDate);
			var time = date.getFullYear()+"-"+(date.getMonth()+1)
						+"-"+ date.getDate();
		$("#content_detail > #content_area > #review_row > #date1").html(time)
		$("#detail_content").html(result.board.content)
						
		
		var filearea = ""
		for(let i=0; i< result.files.length; i++){
			
			let file = result.files[i];
			filearea += "<img class='imgFile' src='${pageContext.request.contextPath}/hospital/fileOutPut.do?filePath="+result.files[i].filePath+"&sysName="+result.files[i].sysName+"'/><br>"
			filearea += "<button type='button' class='btn btn default' style='margin: 5px 0px 20px;'><a href='${pageContext.request.contextPath}/hospital/fileOutPut.do?filepath="+file.filePath+"&sysName="+file.sysName+"'>다운로드</a></button><br>"
		}
		$("#filearea").html(filearea)
		
		if("${sessionScope.user.userSeq}" == result.board.userSeq){
			console.log("${sessionScope.user.userSeq}");
			console.log(result.board.userSeq);
			$("#btn_update_delete").show()
		}
			console.dir(result.board);
		makeCommentList();
	});
}

//삭제
function delete1(){
	$.ajax({
		url : "delete.json",
		data : "no="+detailNo
	})
	.done(function(result){
		$("#content_box").hide();
		$("#content_photo").hide();
		$("#content_review").show();
		$("#content_area_writeForm").hide();
		$("#content_detail").hide();
 		review();
	})
	.fail(function(err){
		console.dir(err)
	})
}

function updateForm(){
	$.ajax({
		url : "updateForm.json",
		data : {
			no: detailNo,
			hospitalSeq: "${param.hospitalSeq}"
		},
		dataType: "json"
	})
	.done(function(result){
		
		console.dir("------------result")
		$("#content_detail").hide();
		$("#content_area_writeForm").show();
		
		$("#registBtn").hide();
		$("#updateBtn").show();
		
		$("#form input[name='name']").val(result.board.name);
		$("#form input[name='no']").val(result.board.no);
		$("#form input[name='title']").val(result.board.title);
		$("#form textarea[name='content']").val(result.board.content);
	})
}

function updateReview(board){
	
	var formData = new FormData($("#form")[0])
	
	$.ajax({
		url : "update.json",
		data : formData,
		type: "POST",
		// 파일 업로드를 위한 속성 설정
		dataType: "text",
		processData: false,
		contentType: false
	})	
	.done(function(result){
		$("#content_area_writeForm").hide();
		$("#content_review").show();
 		review();
	})
	.fail(function(err){
		console.dir(err)
	})
}


//댓글 삭제
function commentDelete(commentNo) {
		$.ajax({
			url : "commentDelete.json",
			data : {
				no : "${result.board.no}",
				commentNo : commentNo
			},
			dataType : "json",
			success : makeCommentList()
		});
	}

function commentUpdateForm(commentNo) {

// 	$("#commentList tr[id^=row]").show();
// 	$("#commentList tr[id^=modRow]").remove(); //수정폼

	var modId = $("#row" + commentNo + " > td:eq(0)").text();
	var modContent = $("#row" + commentNo + " > td:eq(1)").text();

	var html = '';
	html += '<tr id="modRow' + commentNo + '">';
	html += '	<td>' + modId + '</td>';
	html += '	<td>';
	html += '		<div class="form-group">';
	html += '			<input type="text" name="content" value="' + modContent + '" class="form-control input-wp2" placeholder="내용을 입력하세요">';
	html += '		</div>';
	html += '	</td>';
	html += '	<td colspan="2">';
	html += '		<a href="javascript:commentUpdate(' + commentNo
			+ ');"  class="btn btn-success btn-sm" role="button">수정</a>';
	html += '		<a href="javascript:commentCancel(' + commentNo
			+ ');"  class="btn btn-warning btn-sm" role="button">취소</a>';
	html += '	</td>';
	html += '</tr>';
	$("#row" + commentNo).after(html);
	$("#row" + commentNo).hide();
}

function commentUpdate(commentNo) {
	$.ajax({
		url : "commentUpdate.json",
		type : "POST",
		data : {
			no : detailNo,
			commentNo : commentNo,
			content : $("#modRow" + commentNo + " input[name=content]").val()
		},
		success : function() {
			makeCommentList();
		}
	});
}


//수정중 취소버튼
function commentCancel(commentNo){
	$("#row" + commentNo).show();
	$("#modRow" + commentNo).remove();
}


//댓글등록
$("#rForm").submit(function(e){
		e.preventDefault();
		
	if($("#rForm textarea[name='content']").val()==""){
		alert("댓글 내용을 입력하세요")
	return false;
	}
		
	$.ajax({
		url : "commentRegist.json",
		type : "POST",
		data : {
			no: detailNo,
			content : $("#rForm textarea[name='content']").val(),
			userSeq : $("#rForm input[name='userSeq']").val(),
			name :$("#rForm input[name='name']").val()
		}
	}).done(function(){
		/*
		if(!'${result.board.userSeq}'){
			$("#rForm input[name='userSeq']").val("");
		}
		*/
		$("#rForm textarea[name='content']").val("");
		makeCommentList();
	})
});

//댓글목록 그리기
function makeCommentList() {
	
	$.ajax({
		url : "commentList.json",
		type : "POST",
		data : {
			no: detailNo
		}
	}).done(function(result){

		var html = "";
		html += '<table class="table table-bordered">';
		html += '	<colgroup>';
		html += '		<col width="10%">';
		html += '		<col width="*">';
		html += '		<col width="14%">';
		html += '		<col width="10%">';
		html += '	</colgroup>';
	
		for(var i=0; i<result.length; i++){
			var comment = result[i];
			html+='<tr id="row'+comment.commentNo+'" width="600px">';
			html+='	<td width="150px">' + comment.name+'</td>';
			html+='	<td width="300px">'+comment.content+'</td>';
			var date = new Date(comment.regDate);
			var time = date.getFullYear()+"-"+(date.getMonth()+1)
					+"-"+ date.getDate();
			html += '	<td width="150px">' +time+'</td>';
			html += '	<td width="150px">';
			if('${sessionScope.user.userSeq}'==comment.userSeq){
				html += '	<a href="javascript:commentUpdateForm('
						+comment.commentNo
						+')" class="btn btn-success btn-sm" role="button">수정</a>';
				html += '		<a href="javascript:commentDelete('
					+ comment.commentNo
					+ ')"  class="btn btn-danger btn-sm" role="button">삭제</a>';
			}
			html += '	</td>';
			html += '</tr>';
			}
		if (result.length == 0) {
			html += '<tr><td colspan="4">댓글이 존재하지 않습니다.</td></tr>';
		}
		html += "</title>";
		$("#commentList").html(html);
	});
}

$(document).ready(function(){
	$("#cmt_Content").on("keyup", function(){
		if($(this).val().length > 1000){
			alert("1000자 이상은 쓸 수 없습니다");
			$(this).val($(this).val().substring(0,1000));
		}
	})
})
$(document).ready(function(){
	$("#cmt_Content").on("keyup", function(){
		if($(this).val().length > 1000){
			alert("1000자 이상은 쓸 수 없습니다");
			$(this).val($(this).val().substring(0,1000));
		}
	})
})




</script>
	

</body>
</html>