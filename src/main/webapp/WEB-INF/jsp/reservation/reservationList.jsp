<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reservation/reservationList.css">
</head>
<body>

<div class="viewWrap">

<div id="titleArea">
<h3 style="display:inline-block;"><font color="#529dbc">예약 현황 확인</font></h3>

<div id="selectBoxs">
           <select name="state">
                <option value = "">예약상태</option>
                <option value = "1">예약접수</option>
                <option value = "2">예약취소</option>
                <option value = "3">진료완료</option>
                <option value = "4">미방문</option>
           </select>
           <select name="month">
                <option value = "">예약일자</option>
                <option value = "1">6월</option>
                <option value = "2">5월</option>
                <option value = "3">4월</option>
                <option value = "4">이전기간</option>
           </select>
</div>
</div>

<div id="reservList">





	
	<div class="reservDetail">
		<h4>2018.07.06.금</h4>
		<div class="stateIcon stateOne">예약접수</div><span>　10:00 비트병원 | 흉부외과 | 기수진원장</span>
		<button class="stateBnts">예약취소</button>
	</div>
	<div class="reservDetail">
		<h4>2018.07.04.수</h4>
		<div class="stateIcon stateThree">진료완료</div><span>　12:00 비트병원 | 흉부외과 | 성중원원장</span>
		<button class="stateBnts">리뷰쓰기</button>
	</div>
	<div class="reservDetail">
		<h4>2018.07.03.화</h4>
		<div class="stateIcon stateTwo">예약취소</div><span>　09:00 자바내과 | 흉부외과 | 김기영원장</span>
	</div>
	<div class="reservDetail">
		<h4>2018.07.02.월</h4>
		<div class="stateIcon stateFour">미방문</div><span>　15:00 비트병원 | 흉부외과 | 기수진원장</span>
	</div>
	<div class="reservDetail">
		<h4>2018.07.02.월</h4>
		<div class="stateIcon stateFour">미방문</div><span>　15:00 비트병원 | 흉부외과 | 기수진원장</span>
	</div>
	<div class="reservDetail">
		<h4>2018.07.02.월</h4>
		<div class="stateIcon stateFour">미방문</div><span>　15:00 비트병원 | 흉부외과 | 기수진원장</span>
	</div>

</div>

<div id="listFooter">
<ul>
<li>예약 변경은 취소 후 재접수를 통해서만 가능합니다.</li>
<li>예약 접수는 지도에서 병원을 선택한 후 절차에 따라 등록해주세요.</li>
</ul>
</div>



</div>

</body>
</html>