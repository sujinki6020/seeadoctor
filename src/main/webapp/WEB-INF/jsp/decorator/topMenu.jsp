<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<header>
    <h1 id="logo"><a href="${pageContext.request.contextPath}/index.jsp"><img src="${pageContext.request.contextPath}/images/header/title1.JPG" alt=""></a></h1>
    <img id="notification" src="${pageContext.request.contextPath}/temporary/notification.png"></img>
	<span id="count">0</span>
    <p id="userBox">
	    <c:choose>
		    <c:when test="${empty sessionScope.user}">
		    <a href="${pageContext.request.contextPath}/login/loginForm.do" id="login" onchange="changeUI();">로그인</a>
		    /<a href="${pageContext.request.contextPath}/join/joinUser.do" id="joinUser">회원가입</a><br>
		    </c:when>
		    <c:otherwise>
	        <span id="greeting">${user.name}님 환영합니다.</span>
		    <a href="${pageContext.request.contextPath}/login/logout.do" >로그아웃</a>
		    </c:otherwise>
	    </c:choose>
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
            		<li><a href="${pageContext.request.contextPath}/admin/chatboard/chatBoard.do">1:1 채팅방</a></li>
            	</c:when>
            	<c:otherwise>
		            <li><a href="${pageContext.request.contextPath}/mypage/myInfo.do?id=${sessionScope.user.id}">마이페이지</a></li>
            	</c:otherwise>
            </c:choose>
            
            <c:if test="${sessionScope.user.admin eq 'Y'.charAt(0)}">
            		<li><a href="${pageContext.request.contextPath}/admin/info/infoUpdateForm.do">병원정보수정</a></li>
            </c:if>
            
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
</div>