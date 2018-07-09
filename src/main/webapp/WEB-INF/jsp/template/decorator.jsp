<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><decorator:title default="See a doctor" /></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header/header.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<decorator:head />
</head>
<body>
	<div class="header">
	  <c:import url="/WEB-INF/jsp/decorator/topMenu.jsp" />
	</div>	
	<div class="content">
	  <decorator:body />
	</div>
</body>
</html>























