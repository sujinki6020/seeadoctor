<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat/chatWindow.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
</head>
<body>
        <div class="col-sm-3 col-sm-offset-4 frame">
            <ul></ul>
            <div id="chatArea">area</div>
            <div>
                <div class="msj-rta macro">                        
                    	${user.id}님
                    <div class="text text-r" style="background:whitesmoke !important">
                    	<input type="hidden" id="user" value="${user.id}" />
                        <input id="inputMsg" class="mytext" placeholder="Type a message" onkeydown="enter();"/>
                    </div> 

                </div>
                <div style="padding:10px;">
                    <span class="glyphicon glyphicon-share-alt"></span>
                </div>                
            </div>
        </div>       
<script src="${pageContext.request.contextPath}/js/chat/chatWindow.js"></script>
</body>
</html>