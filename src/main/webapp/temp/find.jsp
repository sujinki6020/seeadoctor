<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/find.css" />
</head>
<body>
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'findId')" id="defaultOpen">아이디 찾기</button>
		<button class="tablinks" onclick="openCity(event, 'findPw')">비밀번호 찾기</button>
	</div>

	<div id="findId" class="tabcontent">
		<form action="/action_page.php">
			<div class="container">
				<div class="signup">
					<h3>아이디를 찾기 위한 정보를 입력해 주세요.</h3>
					<br>
					<!-- 						<form class="form"> -->
					<div class="form-group">
						<input type="text" id="signup-name" class="form-control" placeholder="이름" required>
					</div>
					<div class="form-group">
						<input type="text" id="signup-surname" class="form-control" placeholder="생년월일 (6자리)" required>
					</div>
					<button class="btn form-submit" type="submit">FIND</button>
					<!-- 						</form> -->
				</div>
			</div>
		</form>
	</div>

	<div id="findPw" class="tabcontent">
		<form action="/action_page.php">
			<div class="container">
				<div class="signup">
					<h3>비밀번호를 찾기 위한 정보를 입력해 주세요.</h3>
					<br>
					<!-- <h1>Find ID</h1> -->
					<!-- 						<form class="form" novalidate="novalidate"> -->
					<div class="form-group">
						<input type="text" id="signup-name" class="form-control" placeholder="아이디" required>
					</div>
					<div class="form-group">
						<input type="text" id="signup-surname" class="form-control" placeholder="이메일" required>
					</div>
					<button class="btn form-submit" type="submit">FIND</button>
					<!-- 						</form> -->
				</div>
			</div>
		</form>
	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}

		// Get the element with id="defaultOpen" and click on it
		document.getElementById("defaultOpen").click();
	</script>
</body>
</html>