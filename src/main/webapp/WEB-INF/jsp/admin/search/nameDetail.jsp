<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/search/nameDetail.css">
</head>
<body>

<div class="viewWrap">

	<c:choose>
	<c:when test="${reserveHistory.userInfo.gender eq 'F'.charAt(0)}">
	<c:set var="gender" value="여"/>
	</c:when>
	<c:otherwise>
	<c:set var="gender" value="남"/>
	</c:otherwise>
	</c:choose>

	<div id="detailTitle">
		<h2><font color="#529dbc">${reserveHistory.userInfo.name}</font></h2><h3>　${reserveHistory.userInfo.birth}(${gender})　/　${reserveHistory.userInfo.phone}</h3>
	</div>
	
	<div id="privacyLaw">
	<ul>
	<li>병원은 개인정보 보호법 제30조에 따라 정보주체의 개인정보를 보호할 의무가 있습니다.</li>
	<li>병원은 정보주체의 개인정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.</li>
	</ul>
	</div>

	<div id="detailList">
	
<c:forEach var="reservation" items="${reserveHistory.reserveList}">	
		<div class="listBox">
			<c:set var="time" value="${reservation.reserveTime.substring(0,2)}:${reservation.reserveTime.substring(2)}" />
			<fmt:formatDate value="${reservation.reserveDate}" var="date" pattern="yyyy.MM.dd"/>
			<p class="detailInfo"><font size="3px"><strong>${date}</strong>　${time} ${reservation.doctor.doctorName} 원장 </font>
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
						  <input type="hidden" value="${reservation.reserveSeq}">
						  <input type="checkbox">
						  <span class="slider round"></span>
						</label>
					<p id="on" style="display:none;">진료완료</p>
				</c:otherwise>
				</c:choose>
				
				
			</div>
			<p class="detailBox">└ 배아프고 열이 나면 어떡할까요?</p>
		</div>
</c:forEach>


	</div>
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
			  type: "POST",
			  url: "/seeadoctor/admin/calendar/updateReserveStatus.json",
			  data: {
				  reserveSeq : $(this).prev().val()
			  },
			  sucess: function () {
				alert("정상적으로 완료처리 되었습니다.");
		   	}
		  });
		}
	});
	</script>
</body>
</html>