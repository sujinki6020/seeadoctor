<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/js/reservation/reservationForm.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservation/reservationForm.css">
</head>
<body>
<div class="viewWrap">
<div id="reservTitleArea">
	<h2><img id="formTitleImg" src="${pageContext.request.contextPath}/images/reservation/appointment.png" /> 
	예약 접수하기 <font color="#529dbc">| ${docList[0].hospital.dutyName}</font></h2>
</div>
<div id="patientInfo">
<hr>
<table id="patInfoTb">
<tr>
<th width="150px;">진료자명</th>
<td width="400px;">${user.name}</td>
<td><a href="${pageContext.request.contextPath}/mypage/myInfo.do?"><button type="button" id="infoBnt">개인정보수정</button></a></td>
</tr>

<c:choose>
<c:when test="${user.gender eq 'F'.charAt(0)}">
<c:set var="gender" value="여"/>
</c:when>
<c:otherwise>
<c:set var="gender" value="남"/>
</c:otherwise>
</c:choose>
<tr>
<th>생년월일</th>
<td>${user.birth} (${gender})</td>
</tr>
<tr>
<th>전화번호</th>
<td>${user.phone}</td>
</tr>
</table>
<hr>
</div>

<form action="${pageContext.request.contextPath}/reservation/reserve.do" method="post">
<input type="hidden" name="hospitalSeq" value="${docList[0].hospitalSeq}">
<div id="selectZone">
<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/doctor.png" /> 진료실 선택</h2>
<div id="radioArea">

<c:forEach items="${docList}" var="doc">
 	<input type="radio" id="${doc.doctorSeq}" name="doctorSeq" value="${doc.doctorSeq}" checked="checked" />
    <label for="${doc.doctorSeq}"><span></span><font size="4px"><strong>${doc.doctorName} 원장</strong></font> (${doc.majorCode.majorName})</label><br>
</c:forEach>
    
    
</div>
</div>

<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/appointment2.png" /> 날짜 선택
<input type="text" id="datepicker" name="date" placeholder=" 클릭하세요." onchange="dayOfTheWeek(this.value)"></h2>
</div>

<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/time.png" /> 시간 선택</h2>

	<div id="timeList">

	</div>
	<input type="hidden" name="reserveTime">
</div>




<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/check-list.png" /> 증상 기입</h2>
<textarea id="symptoms" name="symptom" maxlength="200"></textarea>
</div>
<button id="reservBtn">예약 접수</button>
</div>

</form>

</div>
<script>

$(document).on("click", ".timeBnt", function () {
	var that = $(this);
	var bnts = $('.timeBnt');
	
	if(that.hasClass('selectTime')) {
			that.toggleClass('selectTime');
			$("input[name='reserveTime']").val("");
			return;
	}
	if(that.hasClass('closeTime')) {
		return;
	}
	
	for(var i=0; i<bnts.size(); i++) {
		if($(bnts[i]).hasClass('selectTime')) {
			alert("예약시간은 한 구간만 선택 가능합니다.");
			return;
		}
		if(i==bnts.size()-1) {
			that.toggleClass('selectTime');
			$("input[name='reserveTime']").val(that.attr("id"));
		};
	}

});

function dayOfTheWeek(value) {
	var date = new Date($("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' }).val());
	//1월~6토, 0일
	//db는 1월~7일
	$("#timeList").html("<img id='loadingImg' src='/seeadoctor/images/reservation/loading-rolling.gif'/>");
	$.ajax({
		type : "POST",
		url : "/seeadoctor/reservation/timeList.json",
        data: {
        	hospitalSeq: $("input[name='hospitalSeq']").val(),
        	doctorSeq: $("input[name='doctorSeq']").val(),
//         	date: new Date($("input[name='date']").val()),
			date: $("input[name='date']").val(),
        	day : date.getDay()
        },
		success : function(reserveTimeList) {
			var timeBnt = "";
			if(reserveTimeList.length == 0) timeBnt += "<h4>휴무일입니다.</h4>"
			for(var i = 0; i < reserveTimeList.length; i++) {
				timeBnt += '<button type="button" id="'+reserveTimeList[i].time+'" class="timeBnt';
				if(reserveTimeList[i].bookedStatus=="t" || reserveTimeList[i].blockedStatus=="t") {
					timeBnt += ' closeTime';
				}
				timeBnt += '">'+reserveTimeList[i].time.substr(0,2)+':'+reserveTimeList[i].time.substr(2,2)+'</button>';
			}
			$("#timeList").html(timeBnt);
		}
	});
}
</script>
</body>
</html>