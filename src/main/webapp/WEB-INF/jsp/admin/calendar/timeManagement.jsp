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
var hospitalSeq = "${reservation.hospitalSeq}";
var dateStr = "${dateStr}";
</script>
<script src="${pageContext.request.contextPath}/js/admin/calendar/timeManagement.js"></script>
</body>
</html>