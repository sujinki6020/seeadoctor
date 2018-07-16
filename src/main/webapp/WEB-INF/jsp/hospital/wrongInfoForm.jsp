<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/hospital/wrongInfoForm.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
</style>
</head>
<body>

<div id="wrong_info">
	<div id="wrong_info_area">
		<div id="wia">
			<div id="wia1">
				<div id="wrong_info_head">
					<img src="${pageContext.request.contextPath}/images/board/fast.png" id="fast">
					<h2>요청해주신 내용을 병원에 확인하여</h2>
					<h2>빠른 시일 내 정보를 수정하도록 하겠습니다</h2>
					<hr id="h1">
				</div>
				
				<div id="form">
					<form enctype="multipart/form-data" method="post" action="">		
						<div id="cBox">
							<label><input type="checkbox" name="wrong" id="w1" value="1"/> 병원주소가 올바르지 않아요</label>
							<br>
							<br>
							<label><input type="checkbox" name="wrong" id="w2" value="2"/> 진료시간이 올바르지 않아요</label>
							<br>
							<br>
							<label><input type="checkbox" name="wrong" id="w3" value="3"/> 등록된 번화번호가 올바르지 않아요</label>
							<br>
							<br>
							<label><input type="checkbox" name="wrong" id="w4" value="4"/> 실제 사진과 병원 사진이 달라요</label>
							<br>
							<br>
							<label><input type="checkbox" name="wrong" id="w5"value="5"/> 의료진 정보가 올바르지 않아요</label>
							<br>
							<br>
							<label><input type="checkbox" name="wrong" id="w6"value="6"/> 등록된 의료장비가 존재하지 않아요</label>
							<br>
						</div>
							<hr id="h1">
							
							<div id="btn_wrong">
								<button type="submit" class="btn btn-default">등록</button>
								<button type="button" class="btn btn-default" onclick="">취소</button>
							</div>
					</form>
				</div>

			</div>
		</div>	
		
	</div>
</div>




</body>
</html>