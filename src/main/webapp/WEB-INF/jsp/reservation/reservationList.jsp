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

<script src="${pageContext.request.contextPath}/js/reservation/reservationList.js"></script>

</body>
</html>