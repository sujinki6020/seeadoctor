<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinUser.css" />
<style>
	.form-group {
		position:relative;
	}
	.form-group > p {
		position: absolute;
		color:red;
		top: 10px;
		right: 10px;
	}
</style>
</head>
<body>
	<div class="container">

		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" name="form" id="form" method="post" action="insertUser.do">
					<h2>
						회원가입 <small>User</small>
					</h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="text" name="id" id="id" class="form-control input-lg"
							placeholder="아이디" tabindex="1">
						<p id="idp"></p>
					</div>
					<div class="form-group">
						<input type="password" name="pw" id="password"
						    	class="form-control input-lg" placeholder="비밀번호" tabindex="2">
						<p id="pwp"></p>
					</div>
					<div class="form-group">
						<input type="password" name="password_confirmation"
								id="password_confirmation" class="form-control input-lg"
								placeholder="비밀번호 확인" tabindex="3">
						<p id="pwConfirm"></p>
					</div>

					<div class="form-group">
						<input type="text" name="name" id="name"
							class="form-control input-lg" placeholder="이름" tabindex="4">
					</div>
					<div class="form-group" 
						style="font-size: 18px; color: rgb(175, 171, 171); border: 1px solid rgba(161, 160, 160, 0.76); height: 46px; border-radius: 6px; padding: 10px 16px; line-height: 22px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)">
						성별 &nbsp;:&nbsp; 
						<input type="radio" name="gender" id="female" placeholder="성별" tabindex="5" value="F" checked /> 
						<label for="female">여</label>
						&nbsp;&nbsp; 
						<input type="radio" name="gender" id="male" placeholder="성별" tabindex="5" value="M" /> 
						<label for="male">남</label>
					</div>
					<div class="form-group">
						<input type="text" name="birth" id="birth"
							class="form-control input-lg" placeholder="생년월일 (6자리 ex.921122)"
							tabindex="6">
					</div>
					<div class="form-group">
						<input type="email" name="email" id="email"
							class="form-control input-lg" placeholder="Email Address"
							tabindex="7">
						<p id="emailp"></p>
					</div>
					<div class="form-group">
						<input type="text" name="phone" id="phone"
							class="form-control input-lg" placeholder="핸드폰 번호" tabindex="8">
						<p id="phonep"></p>
					</div>
					<div class="form-group" class="form-control input-lg" style="font-size: 18px; color: rgb(175, 171, 171); border: 1px solid rgba(161, 160, 160, 0.76); height: 46px; border-radius: 6px; padding: 5px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075)">
					    <input type="hidden" id="confmKey" name="confmKey" value="" />
						<input type="text" id="zipNo" name="zip" readonly placeholder="우편번호" style="font-size: 18px; color: rgb(175, 171, 171); padding-left:10px;" >  
						<input type="button"  value="주소검색" onclick="goPopup();" class="btn btn-info">
					</div>
					<div class="form-group">
						<input type="text" name="addr1" id="roadAddrPart1" class="form-control input-lg" placeholder="도로명 주소"> 
					</div>
					<div class="form-group">
						<input type="text" name="addr2" id="addrDetail" value="" class="form-control input-lg" placeholder="상세주소" style="width:50%; float:left;">
						<input type="text" name="addr3" id="roadAddrPart2" value="" class="form-control input-lg" style="width:50%; float:left;">
					</div>
					<div class="row"></div>

					<hr class="colorgraph">
					<div class="row">
						<div style="width: 100px; margin-left: 470px;">
							<input type="submit" id="save" value="Register"
								class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
	
<script>
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";
var addr1;
var addr2;
var zip;
function goPopup(){
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
    var pop = window.open("${pageContext.request.contextPath}/temp/jusoPopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}
/** API 서비스 제공항목 확대 (2017.02) **/
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.form.roadAddrPart1.value = roadAddrPart1;
	document.form.roadAddrPart2.value = roadAddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipNo.value = zipNo;
	
	addr1 = roadAddrPart1;
	addr2 = roadAddrPart2 + " " + addrDetail;
	zip = zipNo;
}

// 회원가입Form 유효성 검사(정규식 표현)

$("#id").keyup(function () {
	var id = $(this).val();
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	if(!idReg.test(id)) {
		$("#idp").show();
		$("#idp").text("id는 영문자로 시작하는 6~20자 영문자/숫자 조합이어야 합니다.");
	} else {
		$("#idp").hide();
	}
});
$("#password").keyup(function () {
	var pw = $(this).val();
	var pwReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,20}/;
	if(!pwReg.test(pw)) {
		$("#pwp").show();
		$("#pwp").text("비밀번호는 6~20자 영문자/숫자/특수문자 조합이어야 합니다.");
	} else {
		$("#pwp").hide();
	}
});
$("#password_confirmation").keyup(function () {
	var pw = $("#password").val();
	var pwConfirm = $(this).val();
	if(pw != pwConfirm) {
		$("#pwConfirm").show();
		$("#pwConfirm").text("비밀번호가 일치하지 않습니다.");
	} else {
		$("#pwConfirm").hide();
	}
});
$("#email").keyup(function() {
	var email = $(this).val();
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if(email.match(emailReg) == null) {
		$("#emailp").show();
		$("#emailp").text("email 형식에 맞지 않습니다.");
	} else {
		$("#emailp").hide();
	}
});
$("#phone").keyup(function () {
	var phone = $(this).val();
	var phoneReg = /^01([016789]?)-?([0-9]{3,4})-?([0-9]{4})$/;
// 	console.log(phone);
	if(!phoneReg.test(phone)) {
		$("#phonep").show();
		$("#phonep").text("핸드폰 번호는 -을 포함한 숫자로만 입력해 주세요.");
	} else {
		$("#phonep").hide();
	}
});

// $("#save").click(function (e) {
// 	e.preventDefault();
// 	// 코드를 
	
// 	document.form.submit();
// });

$("#save").on("submit", function(event) {
    event.preventDefault();
    // process form
    console.log("addr1", addr1);
    console.log("addr2", addr2);
    console.log("pw", pw);
 });
	
</script>
</body>
</html>