<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/calendar/calendar.css">
</head>
<body>


<div class="viewWrap">

	<table id="calendarTitle">
		<tr>
		
		 <td align="left" >
					<h1>

                    <a href="<c:url value='/calendar/calendar.do'/>?year=${year-1}&amp;month=${month}"  target="_self">
                           <button class="calBnt">&lt;&lt;</button><!-- 이전해 --></a>
                    
                    	<c:choose>
							<c:when test="${month > 0}">
								<a href="<c:url value='/calendar/calendar.do' />?year=${year}&amp;month=${month-1}" target="_self">
                          		 <button class="calBnt">&lt;</button><!-- 이전달 --></a>
							</c:when>
						    <c:otherwise>
						          <button class="calBnt">&lt;</button>
						    </c:otherwise>
						</c:choose>


                    &nbsp;&nbsp;

					${year}.${month+1}

                    &nbsp;&nbsp;
                    
                       <c:choose>
							<c:when test="${month < 11}">
								<a href="<c:url value='/calendar/calendar.do' />?year=${year}&amp;month=${month+1}" target="_self">
                          		 <button class="calBnt">&gt;</button><!-- 다음달 --></a>
							</c:when>
						    <c:otherwise>
						          <button class="calBnt">&gt;</button>
						    </c:otherwise>
						</c:choose>

					<!-- 다음해 -->
                    <a href="<c:url value='/calendar/calendar.do' />?year=${year+1}&amp;month=${month}" target="_self"><button class="calBnt">&gt;&gt;</button></a>
					</h1>
             </td>
             
             <td align ="right">
             	<input type="text"> <button id="searchBnt">이름검색</button>
             	<input id="todayBnt" type="button" onclick="javascript:location.href='<c:url value='/calendar/calendar.do' />'" value="TODAY"/>
			</td>

		
		</tr>
	
	</table>
	
	<table id="calendar">
	<thead>
		<tr id="calDayArea">
		<td class="calDay"><font color="red">Sun</font></td>
		<td class="calDay">Mon</td>
		<td class="calDay">Tue</td>
		<td class="calDay">Wed</td>
		<td class="calDay">Thu</td>
		<td class="calDay">Fri</td>
		<td class="calDay"><font color="#529dbc">Sat</font></td>
		</tr>
	</thead>
	<tbody>
	
	<tr id="calBox">
	
	 <!-- 처음 빈공란 표시 -->

<c:set var="newLine" value="0"></c:set>

<c:forEach begin="1" end="${start-1}" var="temp">

<TD style="background-color: #f6f6f6;">&nbsp;</TD>

<c:set var="newLine" value="${newLine+1}"></c:set><!-- newline -->

</c:forEach>



<c:forEach begin="1" end="${endDay}" var="day">

    <c:choose>
		<c:when test="${newLine==0}">
			<c:set var="color" value="red"/>
		</c:when>
		<c:when test="${newLine==6}">
			<c:set var="color" value="#529dbc"/>
		</c:when>
	    <c:otherwise>
			<c:set var="color" value="black"/>
	    </c:otherwise>
	</c:choose>

    <c:choose>
		<c:when test="${month+1<10}">
			<c:set var="todayMonth" value="0${month+1}"/>
		</c:when>
	    <c:otherwise>
			<c:set var="todayMonth" value="${month+1}"/>
	    </c:otherwise>
	</c:choose>

    <c:choose>
		<c:when test="${day<10}">
			<c:set var="todayDate" value="0${day}"/>
		</c:when>
	    <c:otherwise>
			<c:set var="todayDate" value="${day}"/>
	    </c:otherwise>
	</c:choose>
	
	<c:set var="tdBack" value="#fff"/>

	<fmt:parseNumber var="parseToday" type="number" value="${year}${todayMonth}${todayDate}" />

	<c:if test="${parseToday == intToday}">
		<c:set var="tdBack" value="#eee"/>
	</c:if>
	

	<td class='dateBox' valign='top' align='left' height='163px' style="background-color: ${tdBack};" nowrap>

		<!-- 일자찍기 -->

		<font color="${color}"><strong>${day}</strong></font>
		
		<a href="calendarPop.do" onclick="window.open(this.href, '팝업리스트', 'width=800, height=700'); return false;"><font color="#4d4d4d">　　<img src="${pageContext.request.contextPath}/images/calendar/board.png" /> 접수확인</span></font></a>

	</td>

	<c:set var="newLine" value="${newLine+1}"/>

	<c:choose>

		<c:when test="${newLine==7}">
			<c:if test="${day <= endDay}">
			<TR>
			</c:if>
			<c:set var="newLine" value="0"></c:set>
		</c:when>

	</c:choose>

</c:forEach>  


	
	
	</tr>
	
	</tbody>
	</table>

</div>

<script> 

</script>

</body>
</html>