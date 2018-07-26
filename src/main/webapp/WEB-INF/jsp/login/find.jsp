<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login/find.css" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.25.3/dist/sweetalert2.all.min.js"></script>
</head>
<body>
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'findId')" id="defaultOpen">아이디 찾기</button>
		<button class="tablinks" onclick="openCity(event, 'findPw')">비밀번호 찾기</button>
	</div>

	<div id="findId" class="tabcontent">
		<form action="findId.do">
			<div class="container">
				<div class="signup">
					<h3>아이디를 찾기 위한 정보를 입력해 주세요.</h3>
					<br>
					<div class="form-group">
						<input type="text" id="name" name="name" class="form-control" placeholder="이름" required>
					</div>
					<div class="form-group">
						<input type="text" id="birth" name="birth" class="form-control" placeholder="생년월일 (6자리)" required>
					</div>
					<input class="btn form-submit" type="submit" value="FIND" id="findId">
				</div>
			</div>
		</form>
	</div>

	<div id="findPw" class="tabcontent">
		<form action="findPw.do">
			<div class="container">
				<div class="signup">
					<h3>비밀번호를 찾기 위한 정보를 입력해 주세요.</h3>
					<br>
					<div class="form-group">
						<input type="text" id="id" class="form-control" placeholder="아이디" required>
					</div>
					<div class="form-group">
						<input type="text" id="email" class="form-control" placeholder="이메일" required>
					</div>
					<input class="btn form-submit" type="submit" value="FIND" id="findPw">
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
	
	// ID & PW 찾기		
	$("#findId").on("submit", function (event) {
		var name = $("#name").val();
		var birth = $("#birth").val();
		event.preventDefault();
		$.ajax({
			url: "${pageContext.request.contextPath}/login/findId.do",
			data: {name:name, birth:birth},
			type: "POST",
			success: function(data) {
				if(data == "") {
					swal('사용자 정보와 일치하는 ID가 존재하지 않습니다.');
				} else {
					swal('고객님의 ID는' + data + '입니다.');
				}
			}
		});
	});
	
	$("#findPw").on("submit", function (event) {
		var id = $("#id").val();
		var email = $("#email").val();
		event.preventDefault();
		$.ajax({
			url: "${pageContext.request.contextPath}/login/findPw.do",
			data: {id:id, email:email},
			type: "POST",
			success: function(data) {
				if(data == "") {
					swal('사용자 정보와 일치하는 비밀번호를 찾을 수 없습니다.');
				} else {
					swal('고객님의 비밀번호는' + data + '입니다.');
				}
			}
		});
	});
	</script>
</body>
</html>