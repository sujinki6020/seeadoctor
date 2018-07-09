<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/calendar/timeManagement.css">
</head>
<body>
<div class="popWrap">

	<div id="popTitle">
		<h2><font color="#529dbc">예약가능 시간 설정</font></h2><h3> | 2018.07.03.화</h3>
	</div>
	
	
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
	
	<div id="confirmBtns">
	<button class="confirmBtn">확인</button>
	<button class="confirmBtn">취소</button>
	</div>


</div>
<script>
$('.timeBnt').click(function () {
	$(this).toggleClass('closeTime');
});


</script>
</body>
</html>