<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/search/nameList.css">
</head>
<body>

<div class="viewWrap">

<div id="resultTitle">
<h2 id="searchKey"><img src="${pageContext.request.contextPath}/images/admin/search/search.png" />${userList[0].name}<font color="#529dbc"></font></h2><strong> 검색결과</strong>(${userList.size()}건)
</div>

<div id="resultList">
<ol>
<c:forEach items="${userList}" var="user">

	<c:choose>
	<c:when test="${user.gender eq 'F'.charAt(0)}">
	<c:set var="gender" value="여"/>
	</c:when>
	<c:otherwise>
	<c:set var="gender" value="남"/>
	</c:otherwise>
	</c:choose>

<li class="resultIndex">${user.name}　/　${user.birth}(${gender})　/　${user.phone}<a class="detailBnt" href="<c:url value='/admin/search/nameDetail.do?userSeq=${user.userSeq}'/>">조회</a></li>
</c:forEach>
</ol>
</div>

</div>

</body>
</html>