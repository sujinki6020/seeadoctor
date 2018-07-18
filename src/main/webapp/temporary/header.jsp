<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header/header.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<style>
	#userBox {
		position: relative;
	}
	#greeting {
		display : block;
		width : 100%;
		margin-bottom: 10px;
	}
	#notification {
		position: absolute;
		top: 0%;
		right: 0%;
	}
</style>
</head>
<body>
<header>
    <h1 id="logo"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/header/title1.JPG" alt=""></a></h1>
    <p id="userBox">
        <span id="greeting">${user.name}님 환영합니다.</span><img id="notification" src="${pageContext.request.contextPath}/temporary/send1.png"></img>
	    <a href="${pageContext.request.contextPath}/login/logout.do" >로그아웃</a>
    </p>
    <nav>
        <ul id="mainMenu">
            <c:choose>
            	<c:when test="${sessionScope.user.admin eq 'Y'.charAt(0)}">
            	
		            <li><a href="${pageContext.request.contextPath}/admin/statistics/statistics.do">고객 통계</a></li>
            	</c:when>
            	<c:otherwise>
		            <li><a href="${pageContext.request.contextPath}/map/mapMain.do">병원 찾기</a></li>
            	</c:otherwise>
            </c:choose>
            
            <c:choose>
             	<c:when test="${sessionScope.user.admin eq 'Y'.charAt(0)}">
            		<li><a href="${pageContext.request.contextPath}/admin/calendar/calendar.do">예약자 현황</a></li>
            	</c:when>
            	<c:otherwise>
            		<li><a href="${pageContext.request.contextPath}/reservation/reservationList.do">내 접수현황</a></li>
            	</c:otherwise>
            </c:choose>

            <c:choose>
             	<c:when test="${sessionScope.user.admin eq 'Y'.charAt(0)}">
            		<li><a href="${pageContext.request.contextPath}/admin/chat/chatBoard.do">1:1 채팅방</a></li>
            	</c:when>
            	<c:otherwise>
		            <li><a href="${pageContext.request.contextPath}/mypage/myInfo.do">마이페이지</a></li>
            	</c:otherwise>
            </c:choose>
            
        </ul>
        
    </nav>
    <div id="bottomArea">
        <ul class="etcInfo">
	        <li style="font-weight:900;">
	        	<a href="${pageContext.request.contextPath}/join/joinAdmin.do" id="joinAdmin">Admin 회원가입</a> 
	        </li>
            <li>
                <a href="#1">About us</a>
            </li>
        </ul>
        <address>서울특별시 강남구 강남동 비트캠프 3층 1강의실</address>
        <div class="copyright">ⓒ 2018 See a doctor All rights reserved.</div>
    </div>
    
</header>
<script>
	$("#notification").hover(
			function(){
					
			}, 
			function(){
			}
	);
	
	var ws = null;
	var loginId = null;

	$(function () {
		
	    ws = new WebSocket('ws://localhost/seeadoctor/header.do');
		ws.onopen = function() {
	   	    console.log('웹소켓 서버 접속 성공');
	    };
	    // 메세지 받기
	    ws.onmessage = function(evt) {
	        $("#result").prepend(evt.data + "<br>");
	    };
	    ws.onerror = function(evt) {
	   	    $("#result").prepend('웹소켓 에러 발생 : ' + evt.data)
	    };
	    ws.onclose = function() {
	   	    $("#result").prepend("웹소켓 연결이 종료됨.");
	    };
	    
	    $("#msgBox, #logoutBox").hide();
	    
	});

	$('#loginBtn').click(function() { 
		$.ajax({
			url: "<c:url value='/websocket/login.do' />",
			type: "POST",
			data: {
				id: $("#id").val(),
				pass: $("#pass").val()
			}
		})
		.done(function (result) {
			
			loginId = $("#id").val();
			
			$("#logoutBox > span").text(loginId);
			
			ws.send("login:" + loginId);
			
			$("#id").val("");
			$("#pass").val("");
			
			$("#loginBox, #msgBox, #logoutBox").toggle();
			
		}); // 실제 로그인이 성공하면 login
	});


	$('#sendBtn').click(function() { 
	    var $msg = $("#message");
	    // 웹소켓 서버에 데이터 전송하기
	    ws.send(loginId + ":" + $msg.val());
	    $msg.val(""); 
	});

	$('#logoutBtn').click(function() { 
		$.ajax({
			url: "<c:url value='/websocket/logout.do' />"
		})
		.done(function (result) {
			
			ws.send("logout:" + loginId);
			
			$("#loginBox, #msgBox, #logoutBox").toggle();
			
			loginId = null;
			
			$("#result").html("");
		});
	});
	
</script>
</body>
</html>