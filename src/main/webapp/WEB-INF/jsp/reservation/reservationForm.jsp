<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	예약 접수하기 <font color="#529dbc">| 비트내과</font></h2>
</div>
<div id="patientInfo">
<hr>
<table id="patInfoTb">
<tr>
<th width="150px;">진료자명</th>
<td width="400px;">김기영</td>
<td><button id="infoBnt">개인정보수정</button></td>
</tr>
<tr>
<th>생년월일</th>
<td>1993/01/24 (여)</td>
</tr>
<tr>
<th>전화번호</th>
<td>010-1234-5678</td>
</tr>
</table>
<hr>
</div>

<div id="selectZone">
<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/doctor.png" /> 진료실 선택</h2>
<div id="radioArea">
 	<input type="radio" id="r1" name="doctor" checked="checked" />
    <label for="r1"><span></span><font size="4px"><strong>성중원 원장</strong></font> (소아청소년과)</label>
    <p>
    <input type="radio" id="r2" name="doctor" />
    <label for="r2"><span></span><font size="4px"><strong>기수진 원장</strong></font> (흉부외과)</label>
</div>
</div>

<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/appointment2.png" /> 날짜 선택
<input type="text" id="datepicker" placeholder=" 클릭하세요."></h2>
</div>

<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/time.png" /> 시간 선택</h2>

	<div id="timeList">
		<button class="timeBnt">10:00</button>
		<button class="timeBnt closeTime">10:30</button>
		<button class="timeBnt">11:00</button>
		<button class="timeBnt">11:30</button>
		<button class="timeBnt closeTime">12:00</button>
		<button class="timeBnt">12:30</button>
		<button class="timeBnt closeTime">13:00</button>
		<button class="timeBnt closeTime">13:30</button>
		<button class="timeBnt">14:00</button>
		<button class="timeBnt">14:30</button>
		<button class="timeBnt">15:00</button>
		<button class="timeBnt">15:30</button>
		<button class="timeBnt closeTime">16:00</button>
		<button class="timeBnt">16:30</button>
		<button class="timeBnt closeTime">17:00</button>
		<button class="timeBnt closeTime">17:30</button>
	</div>
</div>




<div class="select">
<h2><img src="${pageContext.request.contextPath}/images/reservation/check-list.png" /> 증상 기입</h2>
<textarea id="symptoms" maxlength="200"></textarea>
</div>
<button id="reservBtn">예약 접수</button>

</div>
</div>
<script>
$(document).on("click", ".timeBnt", function () {
	var that = $(this);
	var bnts = $('.timeBnt');
	
	if(that.hasClass('selectTime')) {
			that.toggleClass('selectTime');
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
		};
	}

});
</script>
</body>
</html>