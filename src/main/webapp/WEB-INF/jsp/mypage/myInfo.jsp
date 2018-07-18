<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/myInfo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/like.css" />
</head>
<body>
	<main> 
	<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">개인정보</label> 
	<input id="tab2" type="radio" name="tabs"> 
		<label id="geLabel" for="tab2">즐겨찾기(병원)</label>

	<section id="content1"">
		<div id="myInfo">
			<form class="register" id="updateTest" action="${pageContext.request.contextPath}/mypage/updateUser.do">
				<h1 id="myH1">My Information</h1>
				<fieldset class="row1">
					<legend>ID & PW </legend>
					<p>
						<label>ID </label> <input type="text" name="id" id="id" readonly value="${user.id}" />
					</p>
					<p>
						<label>Password </label> 
						<input type="password" name="pw" id="password" value="${user.pw}"/> 
						<label>Repeat Password </label> 
						<input type="password" name="password_confirmation" id="password_confirmation" />
						<p id="pwp" style="color:red;"></p>
						<p id="pwConfirm" style="color:red;"></p>
					</p>
				</fieldset>
				<fieldset class="row2">
					<legend>Personal Details </legend>
					<p>
						<label>Name </label> 
						<input type="text" class="long" name="name" id="name" readonly value="${user.name}님" />
					</p>
					<p>
						<label>Phone </label> 
						<input type="text" name="phone" id="phone" value="${user.phone}"/>
						<p id="phonep" style="color:red;"></p>
					</p>
					<p>
						<label>Address </label> 
						<input type="text" class="long" name="addr1" id="addr1" value="${user.addr1}"/>
					</p>
					<p>
						<label>Address(Detail) </label> 
						<input type="text" class="long" name="addr2" id="addr2" value="${user.addr2}"/>
					</p>
					<p>
						<label>Email </label> 
						<input type="text" class="long" name="email" id="email" value="${user.email}" />
						<p id="emailp" style="color:red;"></p>
					</p>
				</fieldset>
				<fieldset class="row3">
					<legend>Further Information </legend>
					<p>
					<c:set var="userGender">${user.gender}</c:set>
						<c:choose>
							<c:when test="${userGender eq 'M'}">
							<label>Gender</label>  
								<input type="radio" name="gender" value="M" checked /> 
								<label class="gender">Male</label> 
								<input type="radio" name="gender" value="F" /> 
								<label class="gender">Female</label>
							</c:when>
							<c:otherwise>
							<label>Gender</label>  
								<input type="radio" name="gender" value="M"  /> 
								<label class="gender">Male</label> 
								<input type="radio" name="gender" value="F" checked/> 
								<label class="gender">Female</label>
							</c:otherwise>
						</c:choose>
					</p>
					<p>
						<label>Birthdate</label> 
<%-- 						${user.birth}  --%>
						<input class="birth" type="text" size="6" maxlength="6" readonly value="${user.birth}" />
					</p>
				</fieldset>
						<button type="submit" class="button" id="updateInfo">수정하기</button>
			</form>
		</div>
	</section>

	<section id="content2">
<!-- 		<div id="likeContainer" class="container"> -->

<!-- 			<section class="hero-unit"> -->

				<div class="row">
					<div class="large-12 columns">

						<ul class="small-block-grid-2 medium-block-grid-3 flip-cards">

							<c:forEach var="like" items="${hList}">
							<li ontouchstart="this.classList.toggle('hover');">
								<div class="large button card-front">
									<a href="#">${like.dutyName}</a> <i class="fa fa-code card-icon "></i>
								</div>
								<div class="panel card-back"><p>name</p></div>
								<div class="panel card-back"><a href="#" onclick="chat();">관리자와 채팅하기</a></div>
							</li>
							</c:forEach>

						</ul>
					</div>
				</div>
<!-- 			</section> -->
<!-- 		</div> -->
	</section>
	</main>
	
	<script>
	$("#updateInfo").on("click", function(event) {
	    event.preventDefault();
// 	    console.log("addr1", addr1);
// 	    console.log("addr2", addr2);
	    console.log("pw", $('#password').val());
	    console.log("name", $('#name').val());
	    console.log("id", $('#id').val());
	    $('#updateTest').submit();
	 });
	
	$("#password").keyup(function () {
		var pw = $(this).val();
		var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}/;
		if(pw.length==0) {
			$("#pwp").hide();
		} else if(!pwReg.test(pw)) {
			$("#pwp").show();
			$("#pwp").text("비밀번호는 6~20자 영문자/숫자/특수문자 조합이어야 합니다.");
		} else {
			$("#pwp").hide();
		}
	});
	
	$("#password_confirmation").keyup(function () {
		var pw = $("#password").val();
		var pwConfirm = $(this).val();
 		console.log(pwConfirm.length);
 		if(pwConfirm.length == 0) {
			$("#pwConfirm").hide();
 		} else if(pw != pwConfirm) {
			$("#pwConfirm").show();
			$("#pwConfirm").text("비밀번호가 일치하지 않습니다.");
		} else {
			$("#pwConfirm").hide();
		}
	});
	
	$("#email").keyup(function() {
		var email = $(this).val();
		var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(email.length == 0) {
			$("#emailp").hide();
		} else if(email.match(emailReg) == null) {
			$("#emailp").show();
			$("#emailp").text("email 형식에 맞지 않습니다.");
		} else {
			$("#emailp").hide();
		}
	});
	
	$("#phone").keyup(function () {
		var phone = $(this).val();
		var phoneReg = /^01([016789]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		if(phone.length==0) {
			$("#phonep").hide();
		} else if(!phoneReg.test(phone)) {
			$("#phonep").show();
			$("#phonep").text("핸드폰 번호는 -을 포함한 숫자로만 입력해 주세요.");
		} else {
			$("#phonep").hide();
		}
	});
	
	function chat() {
		// 팝업을 띄우기, width 300, height 400, 스크롤바, 툴바, 메뉴바를 모두 숨기는 경우
		window.open('http://localhost:8001/seeadoctor/chat/chatWindow.do', 'popup01', 'width=400, height=500, scrollbars= 0, toolbar=0, menubar=no');
	};
	
// 	alert('${hList}');

	</script>
</body>
</html>