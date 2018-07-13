<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/joinUser.css" />
</head>
<body>
	<div class="container">

		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form">
					<h2>
						회원가입 <small>Admin</small>
					</h2>
					<hr class="colorgraph">
					<div class="form-group">
						<input type="text" name="id" id="id" class="form-control input-lg"
							placeholder="아이디" tabindex="1">
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="password" id="password"
									class="form-control input-lg" placeholder="비밀번호" tabindex="2">
							</div>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6">
							<div class="form-group">
								<input type="password" name="password_confirmation"
									id="password_confirmation" class="form-control input-lg"
									placeholder="비밀번호 확인" tabindex="3">
							</div>
						</div>
					</div>

					<h4>병원 정보</h4>
					<div class="form-group">
						<input type="text" name="hospitalName" id="hospitalName"
							class="form-control input-lg" placeholder="병원이름(API 검색할 것!)"
							tabindex="4">
					</div>
					<div class="form-group">
						<input type="text" name="birth" id="birth"
							class="form-control input-lg" placeholder="병원 전화번호" tabindex="6">
					</div>
					<div class="form-group">
						<input type="text" name="addr1" id="addr1"
							class="form-control input-lg" placeholder="병원주소(우체국 API?)"
							tabindex="9">
					</div>
					<div class="form-group">
						<input type="text" name="addr2" id="addr2"
							class="form-control input-lg" placeholder="상세주소" tabindex="10">
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
					</div>
					<div class="form-group">
						<input type="text" name="phone" id="phone"
							class="form-control input-lg" placeholder="담당자 핸드폰 번호"
							tabindex="4">
					</div>



					<hr class="colorgraph">
					<div class="row">
						<div style="width: 100px; margin-left: 470px;">
							<input type="submit" value="Register"
								class="btn btn-primary btn-block btn-lg" tabindex="7">
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</body>
</html>