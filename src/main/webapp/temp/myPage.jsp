<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myInfo.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/like.css" />
</head>
<body>
	<main> 
	<input id="tab1" type="radio" name="tabs" checked>
		<label for="tab1">개인정보</label> 
	<input id="tab2" type="radio" name="tabs"> 
		<label id="geLabel" for="tab2">즐겨찾기(병원)</label>

	<section id="content1"">
		<div id="myInfo">
			<form action="" class="register">
				<h1 id="myH1">My Information</h1>
				<fieldset class="row1">
					<legend>ID & PW </legend>
					<p>
						<label>ID </label> <input type="text" value="My ID" />
					</p>
					<p>
						<label>Password </label> 
						<input type="password" value="My Password" /> 
						<label>Repeat Password </label> 
						<input type="password" />
					</p>
				</fieldset>
				<fieldset class="row2">
					<legend>Personal Details </legend>
					<p>
						<label>Name </label> <input type="text" class="long"
							value="My Name" />
					</p>
					<p>
						<label>Phone </label> <input type="text" maxlength="11" />
					</p>
					<p>
						<label>Address </label> <input type="text" class="long" />
					</p>
					<p>
						<label>Address(Detail) </label> <input type="text" class="long" />
					</p>
					<p>
						<label>Email </label> <input type="text" class="long" />
					</p>
				</fieldset>
				<fieldset class="row3">
					<legend>Further Information </legend>
					<p>
						<label>Gender</label> <input type="radio" value="radio" /> <label
							class="gender">Male</label> <input type="radio" value="radio"
							checked /> <label class="gender">Female</label>
					</p>
					<p>
						<label>Birthdate</label> <input class="birth" type="text"
							size="6" maxlength="6" />예 901202
					</p>
				</fieldset>
					<button class="button">수정하기 &raquo;</button>
			</form>
		</div>
	</section>

	<section id="content2">
		<div id="likeContainer" class="container">
			<div id="likeRow" class="row">
				<div class="col-xs-12 shelf hidden-md hidden-lg"></div>

				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>
				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>
				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>
				<div class="col-xs-12 shelf"></div>
				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>
				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>
				<div class="col-xs-4 col-md-2">
					<a href=""><img src="../images/like.png"
						class="img-responsive book"></a>
				</div>

				<div class="col-xs-12 shelf hidden-md hidden-lg"></div>
				<div class="col-xs-12 shelf"></div>
			</div>
		</div>
	</section>
	</main>
</body>
</html>