<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/calendar/timeManagement.css?ver=1">
</head>
<body>
<div class="popWrap">

	<div id="popTitle">
		<h2><font color="#529dbc">예약가능 시간 설정</font></h2><h3> | ${dateStr} </h3>
	</div>
	
	
	<div id="doctorTab">
		<c:forEach items="${docList}" var="doctor">
			<button type="button" class="doctorBnt" id="${doctor.doctorSeq}">${doctor.doctorName}</button>
		</c:forEach>
	</div>
	
	<div id="timeList">


		
	</div>
	
	<div id="confirmBtns">
	<button type="button" class="confirmBtn submitPop">확인</button>
	<button type="button" class="confirmBtn closePop">취소</button>
	</div>


</div>
<script>

$("button:first").addClass("activeDoc");

$(document).on("click", ".timeBnt", function () {	
	$(this).toggleClass('closeTime');
});

function makeTime() {
	console.log("메이크타임함수");
	$.ajax({
		type : "POST",
		url : "/seeadoctor/admin/calendar/makeTime.json",
		data : {
			hospitalSeq : "${reservation.hospitalSeq}",
			docCode : $(".activeDoc").attr("id"),
			dateStr : "${dateStr}"
		},
		success : function (data) {
			
			$("#timeList").html("");
			for(var i=0; i<data.length; i++) {
				
				
				var bnt = "";
				bnt += "<button id='"+data[i].time+"' class='timeBnt";
				if(data[i].blockedStatus=='t') {
					bnt += " closeTime";
				}
				bnt += "'>"+data[i].time.substr(0,2)+":"+data[i].time.substr(2,2)+"</button>";
				
				$("#timeList").append(bnt);
			}
			
		}
	});
}


function timeList() {
var datetime = new Date("${dateStr}");
$("#timeList").html("<img id='loadingImg' src='/seeadoctor/images/admin/calendar/loading-ellipsis.gif'/>");
$.ajax({
	type : "POST",
	url : "/seeadoctor/admin/calendar/timeList.json",
	data : {
		hospitalSeq : "${reservation.hospitalSeq}",
		docCode : $(".activeDoc").attr("id"),
		dateStr : "${dateStr}"
	},
	success : function (data) {
		
		if(data.length == 0) {
			makeTime();
			return;
		}
		
		$("#timeList").html("");
		for(var i=0; i<data.length; i++) {
			
			
			var bnt = "";
			bnt += "<button id='"+data[i].time+"' class='timeBnt";
			if(data[i].blockedStatus=='t') {
				bnt += " closeTime";
			}
			bnt += "'>"+data[i].time.substr(0,2)+":"+data[i].time.substr(2,2)+"</button>";
			
			$("#timeList").append(bnt);
		}
		
	}
});
}

timeList();



$(".doctorBnt").click(function () {
	$(".doctorBnt").removeClass("activeDoc");
	$(this).addClass("activeDoc");
	timeList();
});

$(".submitPop").click(function () {
var closeList = $(".closeTime");
var closeArr = new Array();

for(var i = 0; i < closeList.length; i++) {
	closeArr.push($(closeList[i]).attr("id"));
}

console.log(closeArr);
$.ajaxSettings.traditional = true;	
	$.ajax({
		type : "POST",
		url : "/seeadoctor/admin/calendar/closeTime.json",
		data : {
			hospitalSeq : "${reservation.hospitalSeq}",
			docCode : $(".activeDoc").attr("id"),
			closeArr : closeArr,
			dateStr : "${dateStr}"
		},
		success : function (result) {
			alert("시간설정이 정상적으로 완료되었습니다.");
		}
	});
	
});

$(".closePop").click(function () {
	self.close();
});


</script>
</body>
</html>