<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/statistics/statistics.css?ver=1">
</head>
<body>

<div class="viewWrap">

<div id="yearStat">
<h3><img src="${pageContext.request.contextPath}/images/admin/statistics/left-arrow.png" onclick="setPrevYear()" /> 연간 예약건수<span id="lineDateStr"> </span> <img src="${pageContext.request.contextPath}/images/admin/statistics/right-arrow.png" onclick="setNextYear()" /></h3>
<div id="lineCanvasBox"></div>
</div>

<div id="weekStat">
<h3>주간 페이지 방문자수</h3>
<div id="barCanvasBox"></div>
</div>

<div id="monthStat">
<br><h3><img src="${pageContext.request.contextPath}/images/admin/statistics/left-arrow.png" onclick="setPrevMonth()" /> <span id="pieDateStr"> </span> 예약자 정보 <img src="${pageContext.request.contextPath}/images/admin/statistics/right-arrow.png" onclick="setNextMonth()" /></h3>
<h4>　<span id="sexCanvasTitle">성별</span> <span id="ageCanvasTitle">연령대</span> </h4>
<div id="sexPieCanvasBox"></div>
<div id="agePieCanvasBox"></div>
</div>

<div id="mask">
<img id="maskImg" src="/seeadoctor/images/admin/calendar/loading-ellipsis.gif"/>
</div>

</div>

<script>
var hospitalSeq = "${user.hospitalSeq}";
</script>
<script src="${pageContext.request.contextPath}/js/admin/statistics/statistics.js"></script>
</body>
</html>