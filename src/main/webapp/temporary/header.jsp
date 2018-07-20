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
	.notif	{
		position: relative;
		background-color: white;
		border-radius: 5px;
	}
	.notif > p {
		margin-left: 17%;
	    box-sizing: border-box;
	    height: 100%;
	    line-height: 50px;
	    padding: 0px;
	}
	.checkIcon {
		width: 20%;
		height: 100%;
		background-image: url("http://localhost/seeadoctor/temporary/error1.png");
		box-sizing: border-box;
		position: absolute;
		background-position: center;
    	background-size: 60%;
    	background-repeat: no-repeat;
	}
	.cancelIcon {
		width: 50px;
		height: 100%;
		background-image: url("http://localhost/seeadoctor/temporary/error1.png");
		box-sizing: border-box;
		position: absolute;
		background-position: center;
    	background-size: 50%;
    	background-repeat: no-repeat;
	}
	.successIcon {
		width: 50px;
		height: 100%;
		background-image: url("http://localhost/seeadoctor/temporary/success.png");
		box-sizing: border-box;
		position: absolute;
		background-position: center;
    	background-size: 50%;
    	background-repeat: no-repeat;
	}
	.questionIcon {
		width: 50px;
		height: 100%;
		background-image: url("http://localhost/seeadoctor/temporary/question.png");
		box-sizing: border-box;
		position: absolute;
		background-position: center;
    	background-size: 50%;
    	background-repeat: no-repeat;
	}
	.infoIcon {
		width: 50px;
		height: 100%;
		background-image: url("http://localhost/seeadoctor/temporary/icon.png");
		box-sizing: border-box;
		position: absolute;
		background-position: center;
    	background-size: 50%;
    	background-repeat: no-repeat;
	}
	.xIcon {
		background-image: url("http://localhost/seeadoctor/temporary/cancel-music.png");
		box-sizing: border-box;
	    position: absolute;
	    width: 20px;
	    height: 20px;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    right: 1%;
	    top: 5%;
	}
	.success {
		background-color: #28a745;
		color: white;
	}
	.info {
		background-color: #17a2b8;
		color: white;
	}
	.warning {
		background-color:  #ffc107;
		color : black;
	}
	.danger {
		background-color: #dc3545;
		color: white;
	}
</style>
</head>
<body>
<header>
    <h1 id="logo"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/header/title1.JPG" alt=""></a></h1>
	<img id="notification" src="${pageContext.request.contextPath}/temporary/notification.png"></img>
	<span id="notifCount">0</span>
    <p id="userBox">
        <span id="greeting">${user.name}님 환영합니다.</span>
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
<div id="notifList" style="display:none;">
	<div class="notif info">
		<div class="infoIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 채팅을 보냈습니다.</p>
	</div>
	<div class="notif warning">
		<div class="questionIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 채팅을 보냈습니다.</p>
	</div>
	<div class="notif success">
		<div class="successIcon"></div>
		<div class="xIcon"></div>
		<p title="2018-07-20"><span>id</span>님이 예약을 했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<div class="cancelIcon"></div>
		<div class="xIcon"></div>
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
</div>
<script type="text/javascript">
$(document).on("click","#notification",function(){
	$("#notifList").toggle();
});
$(document).on("click",".xIcon",function(){
	$(this).parent().animate({"opacity":0, "height": 0 }, "slow" ,function(){
		$(this).remove();
	});
})
</script>
</body>
</html>