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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/calendar/calendarPop.css?ver=1">
</head>
<body>
<div class="popWrap">

	<div id="popTitle">
		<h2><font color="#529dbc">접수현황</font></h2><h3> | ${dateStr}
		<a href="timePop.do?dateStr=${dateStr}" onclick="window.open(this.href, '팝업시간관리', 'width=650, height=500'); return false;"><button id="timeManageBnt">예약가능 시간 설정</button></a></h3>
	</div>
	
	<div id="popList">
		<div class="listBox">
			<p class="detailInfo"><font size="3px"><strong>10:00 기수진원장 　 </strong></font> 김기영 1993.01.24(여) | 010-1234-5678　
			<img class="messageImg" src="${pageContext.request.contextPath}/images/admin/calendar/symptom.png" />
			</p>
			<div class="listBtns">
				<p id="off">미방문</p>
					<label class="switch">
					  <input type="checkbox">
					  <span class="slider round"></span>
					</label>
				<p id="on" style="display:none;">진료완료</p>
			</div>
			<p class="detailBox">└ 배아프고 열이 나면 어떡할까요?</p>
		</div>
		<div class="listBox">
			<p class="detailInfo"><font size="3px"><strong>11:30 성중원원장 　</strong></font> 김기영 1993.01.24(여) | 010-1234-5781　
			<img class="messageImg" src="${pageContext.request.contextPath}/images/admin/calendar/symptom.png" />
			</p>
			<div class="listBtns">
			<div id="cancleReserv">취소된 예약</div>
			</div>
			<p class="detailBox">└ 배아프고 열이 나면 어떡할까요?</p>
		</div>

		<c:forEach var="reservation" items="${reserveList}">
			<div class="listBox">
				<p class="detailInfo"><font size="3px"><strong>${reservation.reserveTime} ${reservation.docCode} 　</strong></font> ${reservation.userSeq} 1993.01.24(여) | 010-1234-5781　
				<img class="messageImg" src="${pageContext.request.contextPath}/images/admin/calendar/symptom.png" />
				</p>
				<div class="listBtns">
				
				<c:choose>
				<c:when test="${reservation.reserveStatus==2}">
					<div id="cancleReserv">취소된 예약</div>
				</c:when>
				<c:when test="${reservation.reserveStatus==4}">
					<p id="off" style="display:none;">미방문</p>
						<label class="switch">
						  <input type="checkbox" checked="checked">
						  <span class="slider round"></span>
						</label>
					<p id="on">진료완료</p>
				</c:when>
				<c:otherwise>
					<p id="off">미방문</p>
						<label class="switch">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
					<p id="on" style="display:none;">진료완료</p>
				</c:otherwise>
				</c:choose>
				</div>
				<p class="detailBox">└ ${reservation.symptom}</p>
			</div>
		</c:forEach>


	</div>
	
	<script>
	$(".messageImg").click(function () {
		var message = $(this).parent().next().next();
		if(message.css("display") == "none"){
			message.show();
		}else{
			message.hide();
		}
	});
	
	var check = $("input[type='checkbox']");
	check.click(function(){
		if($(this).parent().next().css("display") == "inline-block") {
			alert("이미 진료가 끝난 예약입니다.");
			$(this).prop("checked", true);
			return;
		}else {
		  $(this).parent().next().toggle();
		  $(this).parent().prev().toggle();
		  /* 상태 업데이트 ajax하기 */
		  $.ajax({
		  });
		}
	});
	</script>

</div>
</body>
</html>