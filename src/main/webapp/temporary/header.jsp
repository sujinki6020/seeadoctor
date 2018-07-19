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
		position: fixed;
		top: 5%;
		right: 2%;
		width: 3%;
	}
	#notification:hover {
		cursor: pointer;
	}
	#count {
		position: fixed;
	    display: inline-block;
	    width: 19px;
	    height: 19px;
	    background-color: #f22727;
	    border-radius: 50%;
	    color: white;
	    text-align: center;
	    right: 31px;
	    top: 42px;
	    line-height: 19px;
	    font-family: sans-serif;
	}
	#notifList {
		position: fixed;
		top: 13%;
    	right: 2%;
    	width: 20%;
    	height: auto;
    	max-height: 50%;
    	border: 1px solid rgba(100, 100, 100, .4);
    	overflow: auto;
    	box-shadow: 0 3px 8px rgba(0, 0, 0, .25);
	}
	.notif {
		width: 100%;
		background-color: #c3fdff;
		height: 50px;
		font-size: 1.5em;
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
	.notif > p {
		padding: 10px;
	}
	::-webkit-scrollbar{width: 10px;}
	::-webkit-scrollbar-track{background-color:transparent;}
	::-webkit-scrollbar-thumb{background-color:#eee ;border-radius:10px;}
	::-webkit-scrollbar-thumb:hover{bacground:#555;}
	::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
		width:10px; height:10px; bacground:#f1ef79;
	}
	
</style>
</head>
<body>
<header>
    <h1 id="logo"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/header/title1.JPG" alt=""></a></h1>
	<img id="notification" src="${pageContext.request.contextPath}/temporary/notification.png"></img>
	<span id="count">0</span>
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
	<div class="notif">
		<p><span>id</span>님이 채팅을 보냈습니다.</p>
	</div>
	<div class="notif success">
		<p><span>id</span>님이 채팅을 보냈습니다.</p>
	</div>
	<div class="notif info">
		<p><span>id</span>님이 예약을 했습니다.</p>
	</div>
	<div class="notif warning">
		<p><span>id</span>님이 예약을 취소했습니다.</p>
	</div>
	<div class="notif danger">
		<p><span>id</span>님이 댓글을 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	<div class="notif">
		<p><span>id</span>님이 리뷰를 작성했습니다.</p>
	</div>
	
	
</div>
<script type="text/javascript">
	
</script>
</body>
</html>