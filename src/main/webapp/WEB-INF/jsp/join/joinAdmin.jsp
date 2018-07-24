<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/join/joinUser.css" />
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
				<form role="form" name="form" id="form" method="post" action="insertAdmin.do">
					<h2>
						회원가입 <small>Admin</small>
					</h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="text" name="id" id="id" class="form-control input-lg" placeholder="아이디" tabindex="1" >
						<span id = "chkMsg"></span> 
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

					<h4>병원 정보</h4>
					<div class="form-group">
						<input type="text" name="dutyName" id="searchHospitalName"
							class="form-control input-lg" placeholder="병원이름(DB 검색)" tabindex="4">
					</div>
					
					<div id="results"></div> 
					
					<div class="form-group">
						<input type="text" name="tel" id="tel"
							class="form-control input-lg" placeholder="병원 전화번호" tabindex="6">
					</div>
					<div class="form-group">
						<input type="text" name="addr1" id="addr1"
							class="form-control input-lg" placeholder="병원주소"
							tabindex="9">
						<input type="hidden" name="hospitalSeq" id="hospitalSeq"
							class="form-control input-lg" placeholder="hospitalSeq"
							tabindex="9">
					</div>
					<div class="row"></div>

					<h4>담당자 정보</h4>
					<div class="form-group">
						<input type="text" name="name" id="name"
							class="form-control input-lg" placeholder="담당자 이름" tabindex="4">
					</div>
					<div class="form-group">
						<input type="email" name="email" id="email"
							class="form-control input-lg" placeholder="담당자 이메일" tabindex="4">
						<p id="emailp"></p>
					</div>
					<div class="form-group">
						<input type="text" name="phone" id="phone"
							class="form-control input-lg" placeholder="담당자 핸드폰 번호"
							tabindex="4">
						<p id="phonep"></p>
					</div>

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
//회원가입Form 유효성 검사(정규식 표현)

$("#id").keyup(function () {
	var id = $(this).val();
	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	if(!$(this).val()) {
		$("#idp").hide();
		$('#chkMsg').html("");
		return;
	}
	if(!idReg.test(id)) {
		$("#idp").show();
		$("#idp").text("id는 영문자로 시작하는 6~20자 영문자/숫자 조합으로 가능합니다.");
	} else {
		$("#idp").hide();
		checkId();
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

// id 중복체크
function checkId(){
    var id = $('#id').val();
    $.ajax({
        url:'${pageContext.request.contextPath}/join/idDuplChk.do',
        type:'post',
        data:{id:id},
        success:function(data){
            if($.trim(data)==0){
                $('#chkMsg').html("<p style='color:blue;'>사용가능한 ID입니다.</p>");
            }else{
                $('#chkMsg').html("<p style='color:red;'>이미 존재하는 ID입니다.</p>");
            } 
        },
        error:function(){
                alert("에러입니다");
        }
    });
};
 
 $("#searchHospitalName").on("focus", function (event) {
	searchHospName();
 })
 
 // 병원이름 검색
var hospitals = null;
function searchHospName() {
	$("#searchHospitalName").keyup(function () {
		var words = $("#searchHospitalName").val();
		if(words != "") {
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/join/searchHospName.do",
				data: {dutyName : words},
				success: function(result) {
					var html = "";
					if(result.length==0) {
						str = "";
						$("#results").html(str);
					} else if(result.length > 0) {
						hospitals = result;
							html += "<ul>";
						for(let i=0; i<result.length; i++) {
							html += "	<li id='hospInfoLi'><a href='#' onclick='hospInfo(" + i + ");'>" + result[i].dutyName + "</a></li>";
						}
							html += "</ul>";
						$("#results").html(html);
						
						
					} else {
						$("#results").html("검색결과가 없습니다.");
					}
				},
				error: function (e) {
					console.log("error : ", e.status);
				}
			});
		}
	}); 
 };
 
 
 function hospInfo(index) {
	 var dutyName = hospitals[index].dutyName; 
	 var tel = hospitals[index].dutyTel1; 
	 var addr1 = hospitals[index].dutyAddr; 
	 var hospitalSeq = hospitals[index].hospitalSeq; 
// 	 console.log("hospInfo", dutyName)
// 	 console.log("hospInfo", tel)
// 	 console.log("hospInfo", addr1)
// 	 console.log("hospInfo", hospitalSeq)
	 $("input[name='dutyName']").val(dutyName);
	 $("input[name='tel']").val(tel);
	 $("input[name='addr1']").val(addr1);
	 $("input[name='hospitalSeq']").val(hospitalSeq);
	 
	 $("#results").html("");
 };
 
 $("#save").on("submit", function(event) {
	    event.preventDefault();
});
	 
 
</script>
</body>
</html>