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
<h2 id="searchKey"><img src="${pageContext.request.contextPath}/images/admin/search/search.png" /> <font color="#529dbc">김기영</font></h2><strong> 검색결과</strong>(3건)
</div>

<div id="resultList">
<ol>
<c:forEach items="${userList}" var="user">
<li class="resultIndex">${user.name}　/　${user.birth}(${user.gender})　/　${user.phone}<a class="detailBnt" href="<c:url value='/admin/search/nameDetail.do?userSeq=${user.userSeq}'/>">조회</a></li>
</c:forEach>
<li class="resultIndex">김기영　/　1967.06.21(남)　/　010-3534-5785<a class="detailBnt" href="<c:url value='/search/nameDetail.do'/>">조회</a></li>
<li class="resultIndex">김기영　/　2000.08.11(여)　/　010-3454-5555<a class="detailBnt" href="<c:url value='/search/nameDetail.do'/>">조회</a></li>
</ol>
</div>

</div>

</body>
</html>