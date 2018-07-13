<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->
			<h2 class="active">Sign In</h2>

			<!-- Icon -->
			<div class="fadeIn first">
				<img src="http://danielzawadzki.com/codepen/01/icon.svg" id="icon"
					alt="User Icon" />
			</div>

			<!-- Login Form -->
			<form method="post" action="${pageContext.request.contextPath}/temp/login.do">
				<input type="text" id="login" class="fadeIn second" name="id" placeholder="login"> 
				<input type="password" id="password" class="fadeIn third" name="pw" placeholder="password" style="color:black;">
				<button id="fourth">Log In</button>
			</form>

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="#">Forgot ID / Password?</a>
			</div>
		</div>
	</div>
</body>
</html>