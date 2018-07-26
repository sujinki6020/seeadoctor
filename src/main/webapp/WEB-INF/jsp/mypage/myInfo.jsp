<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/myInfo.css?ver=1" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage/like.css" />
<style>
.small-block-grid-2.medium-block-grid-3.flip-cards > li:nth-of-type(3n+1){
	margin-left: 17%;
}
</style>
</head>
<body>
	<main> 
	<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">개인정보</label> 
	<input id="tab2" type="radio" name="tabs"> 
		<label id="geLabel" for="tab2">즐겨찾기(병원)</label>

	<section id="content1">
		<div id="myInfo">
			<form class="register" id="update">
				<h1 id="myH1">내 정보 수정</h1>
				<fieldset class="row1">
					<legend>아이디 & 비밀번호</legend>
					<p>
						<label>아이디</label> <input type="text" name="id" id="id" readonly value="${myUser.id}" />
					</p>
					<p>
						<label>비밀번호</label> 
						<input type="password" name="pw" id="password" value="${myUser.pw}"/> 
						<label>비밀번호 확인</label> 
						<input type="password" name="password_confirmation" id="password_confirmation" />
					</p>
						<p id="pwp" style="color:red;"></p>
						<p id="pwConfirm" style="color:red;"></p>
				</fieldset>
				<fieldset class="row2">
					<legend>개인 상세 정보</legend>
					<p>
						<label>이름</label> 
						<input type="text" class="long" name="name" id="name" readonly value="${myUser.name}" />
					</p>
					<p>
						<label>핸드폰 번호</label> 
						<input type="text" name="phone" id="phone" value="${myUser.phone}"/>
						<p id="phonep" style="color:red;"></p>
					</p>
					<p>
						<label>주소</label> 
						<textarea rows="2" cols="27" name="addr1" id="addr1" style="resize:none; margin-left:20px; border: 1px solid #E1E1E1; font-family: Verdana,Arial, Helvetica, sans-serif; font-size:17px; color:#505050;">${myUser.addr1}</textarea>
					</p>
					<p>
						<label>상세 주소</label> 
						<input type="text" class="long" name="addr2" id="addr2" value="${myUser.addr2}"/>
					</p>
					<p>
						<label>이메일</label> 
						<input type="text" class="long" name="email" id="email" value="${myUser.email}" />
					</p>
						<p id="emailp" style="color:red;"></p>
				</fieldset>
				<fieldset class="row3">
				<p></p>
					<legend>기타 정보</legend>
					<c:set var="userGender">${myUser.gender}</c:set>
						<c:choose>
							<c:when test="${userGender eq 'M'}">
							<p style="position:relative;">
							<label>성별</label>  
								<input type="radio" name="gender" value="M" disabled="disabled" checked style="position:absolute; top:22px;" /> 
								<label class="gender" style="margin-right:50px;">Male</label> 
								<input type="radio" name="gender" value="F" disabled="disabled" style="position:absolute; top:22px;" /> 
								<label class="gender" style="margin-right:50px;">Female</label>
							</p>
							</c:when>
							<c:otherwise>
							<p style="position:relative;">
							<label>성별</label>  
								<input type="radio" name="gender" value="M" disabled="disabled" style="position:absolute; top:22px;" /> 
								<label class="gender" style="margin-right:50px;">Male</label> 
								<input type="radio" name="gender" value="F" disabled="disabled" checked /> 
								<label class="gender" style="margin-right:50px;">Female</label>
							</p>
							</c:otherwise>
						</c:choose>
					<p>
						<label>생년월일</label> 
						<input class="birth" type="text" size="6" maxlength="6" readonly value="${myUser.birth}" />
					</p>
				</fieldset>
						<button type="button" class="button" id="updateInfo">수정하기</button>
			</form>
		</div>
	</section>

	<section id="content2">
				<div class="row">
					<div class="large-12 columns">

						<ul class="small-block-grid-2 medium-block-grid-3 flip-cards">
							<c:forEach var="like" items="${hList}">
							<li ontouchstart="this.classList.toggle('hover');" >
								<div class="large button card-front">
									<a href="#">${like.dutyName}</a>
								</div>
								<div class="panel card-back">
									<br><br>
									<a href="#" class="chat" data-flag="${like.adminId}" style="display: block;font-size:17px; text-align: center;width: 100%;" >관리자와 채팅하기</a>
									<a href="${pageContext.request.contextPath}/hospital/about.do?hospitalSeq=${like.hospitalSeq}" style="display: block;font-size:17px; text-align: center;width: 100%;" >병원 정보</a>
								</div>
							</li>
							</c:forEach>

						</ul>
					</div>
				</div>
	</section>
	</main>
	
<script>
$("#updateInfo").on("click", function(event) {
	if($("#password_confirmation").val() != "") {
    event.preventDefault();
    var data = $("#update").serialize();
    console.dir(data);
    $.ajax({
    	url:"${pageContext.request.contextPath}/mypage/updateUser.do",
    	type: "post",
    	data: data,
    	success: function () {
    		location.href="${pageContext.request.contextPath}/mypage/myInfo.do?id=${sessionScope.user.id}"
    	}
    })
	} else {
		alert("비밀번호 확인란이 비어 있습니다.");
	}
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

$(".panel").on("click",".chat",function(){
	var userId = "${sessionScope.user.id}";
	var adminId = $(this).data("flag");
	console.log("userId : ", userId);
	console.log("adminId : ", adminId);
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/chatboard/chatBoard.do",
		data: {"adminId":adminId,"userId":userId},
		type: "post",
		success : function () {
				window.open('http://localhost/seeadoctor/chat/chatWindow.do?receiverId=' + adminId, 'popup01', 'width=400, height=550, toolbar=0, menubar=no');
		}
	});
});

</script>
</body>
</html>