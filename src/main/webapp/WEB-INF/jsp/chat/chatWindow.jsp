<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/chatWindow.css?ver=1">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</head>
<body>
		<div style="position:relative; height:500px;">
            <div id="chatArea" style="height:400px; overflow:scroll;">
				<blockquote class="chatBox">
				</blockquote>
			</div>
			
             <div style="background:lavender; height:100px; postion:absolute;" id="inputArea">
	            ${sessionScope.user.id}님 : 
	   			<textarea rows="4" cols="40" id="message" placeholder="Type a message"></textarea>
				<input type="hidden" id="rcvId" value="${param.receiverId}" />
	            <button id="sendBtn" class="glyphicon glyphicon-share-alt"></button>
             </div> 
		</div>
<script src="${pageContext.request.contextPath}/js/chat/chatWindow.js"></script>
<script>
	$("#sendBtn").click(function () {
		send();
	});
</script>	
</body>
</html>