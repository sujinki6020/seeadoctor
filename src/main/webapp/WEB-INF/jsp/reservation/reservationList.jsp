<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservation/reservationList.css">
</head>
<body>

<div class="viewWrap">

<div id="titleArea">
<h3 style="display:inline-block;"><font color="#529dbc">예약 현황 확인</font></h3>

<div id="selectBoxs">
           <select name="reserveStatus" onchange="selectCategory(this.name, this.value)">
                <option value = "">예약상태</option>
                <option value = "1">예약접수</option>
                <option value = "2">예약취소</option>
                <option value = "3">미방문</option>
                <option value = "4">진료완료</option>
           </select>
           <select name="reserveDate" onchange="selectCategory(this.name, this.value)">
                <option value = "">예약일자</option>
                <option value = "1">최근 한 달</option>
                <option value = "2">2개월 전</option>
                <option value = "3">3개월 전</option>
                <option value = "4">이전 내역</option>
           </select>
</div>
</div>

<div id="reservList">



</div>

<div id="listFooter">
<ul>
<li>예약 변경은 취소 후 재접수를 통해서만 가능합니다.</li>
<li>예약 접수는 지도에서 병원을 선택한 후 절차에 따라 등록해주세요.</li>
</ul>
</div>

<div>
  <span id="topBtn">TOP</span>
</div>

</div>

<script>

var start = 0;
var end = 7;
var name;
var val;

function lastPostFunc(name, val) {  
	console.log(start);
	console.log(name);
	console.log(val);
	$.ajax({
		type : "POST",
		url : "/seeadoctor/reservation/listAjax.json",
        data: {
        	'name' : name,
        	'val' : val,
        	start : start,
        	end : end
        },
		success : function(list) {
			$("#reservList").append("<img id='loadingImg' src='/seeadoctor/images/reservation/loading-heart.gif'/>");
			
			if(list.length == 0){
				setTimeout(function () {
					$("#loadingImg").remove();
				$("#reservList").append("<p id='endPost'>더 이상 불러올 정보가 없습니다.</p>");
				},500);
				return;
			}
			

					var appendData = '';
				for(var i = 0; i < list.length; i++) {
					
						var date = new Date(list[i].reserveDate);
						var year = date.getFullYear();
						var month = date.getMonth() + 1;
						var dateday = date.getDate();
						var day = date.getDay();
						var dayArr = new Array('일', '월', '화', '수', '목', '금', '토');
						if(month <  10){
							month = '0'+month;
						}
						if(dateday < 10){
							dateday = "0" + dateday;
						}
						var dateStr = year+"."+month+"."+dateday+"."+dayArr[day];
					
						var hour = list[i].reserveTime.substr(0,2);
						var min = list[i].reserveTime.substr(2,2);
					
						appendData += '<div class="reservDetail">';
						appendData += '<h4>'+dateStr+'</h4>';
					var status = '';
						if(list[i].reserveStatus==1) {status = '예약접수';}
						if(list[i].reserveStatus==2) {status = '예약취소';}
						if(list[i].reserveStatus==3) {status = '미방문';}
						if(list[i].reserveStatus==4) {status = '진료완료';}
						appendData += '<div class="stateIcon state'+list[i].reserveStatus+'">'+status+'</div>';
						appendData += '<span>　'+hour+':'+min+' | '+'병원코드'+list[i].hospCode+' | '+'의사코드'+list[i].docCode+'</span>';
						appendData += '</div>';
				};
				
						setTimeout(function () {
							$("#loadingImg").remove();
							$("#reservList").append(appendData);
						},900);

			
			start += 7;
			
			$(window).on("scroll", getScroll); 
		}
		});
};  

lastPostFunc();


function getScroll() { 
	if(($(window).scrollTop())+10 > $(document).height() - $(window).height()) {
    	$(window).off("scroll");
    	lastPostFunc(name, val);
    }  
}

function selectCategory(name, val) {
	$(window).off("scroll");
	$("#reservList").html("");
	this.name = name;
	this.val = val;
	start = 0;
	end = 7;
	lastPostFunc(name, val);
}


$('#topBtn').on('click', function() {
	  $('html').stop().animate({scrollTop: 0}, 500);
	});

</script>

</body>
</html>