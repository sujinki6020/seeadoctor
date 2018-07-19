<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/seeadoctor/css/admin/form/infoUpdateForm.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
</style>
</head>
<body>
	
	<div id="admin">
		<div id="main">
		<div id="admin_head">
			<h1>병원 정보 수정 폼</h1>
			<hr id="h1">
		</div>
		
		
		<div id="form">
			<form enctype="multipart/form-data" method="post" action="infoUpdate.do">
				<input type="hidden" name="hospitalSeq" value="${hospInfo.hospitalSeq}">
				<div><span>병원명</span><input type="text" class="form-control" name="dutyName" placeholder="병원 명을 입력해 주세요" value="${hospInfo.dutyName}"></div>
				<div><span>주소</span><input type="text" class="form-control" id="address" name="dutyAddr" placeholder="주소를 입력해 주세요" value="${hospInfo.dutyAddr}"></div>
				<div>
					<span>전화번호</span>
						<input type="text" id="call1" name="dutyTel1" class="form-control" placeholder="전화번호를 입력하세요" value="${hospInfo.dutyTel1}">
						<input type="text" id="call3" name="dutyTel3" class="form-control" placeholder="전화번호를 입력하세요" value="${hospInfo.dutyTel3}">
				</div>
				
				
				<div id="day">
					<span>운영 요일 설정</span>
					<span id="day_area">
						<input type="checkbox" name="day" value="1"><label for="day1">월</label>
						<input type="checkbox" name="day" value="2"><label for="day2">화</label>
						<input type="checkbox" name="day" value="3"><label for="day3">수</label>
						<input type="checkbox" name="day" value="4"><label for="day4">목</label>
						<input type="checkbox" name="day" value="5"><label for="day5">금</label>
						<input type="checkbox" name="day" value="6"><label for="day6">토</label>
						<input type="checkbox" name="day" value="7"><label for="day7">일</label>
						<input type="checkbox" name="day" value="8"><label for="day8">공휴일</label>
					</span>
				</div>		
				
				
				<div id="time">
					<span>영업시간</span>
					<span>해당요일</span>
					<input type="time" class="form-control" name="startTime" id="times">~<input type="time" class="form-control" name="lastTime" id="times">
				</div>
						
						
				<div id="major">
					<span>병원분류</span>
					<input type="text" class="form-control" name="dutyDivNam" placeholder="병원분류" value="${hospInfo.dutyDivNam}">
				</div>
				<div id="treat">
					<span>진료항목</span>
					<input type="text" class="form-control" name="treat" placeholder="#태그로 입력해 주세요 (ex)#내과#내시경 ">
				</div>
				<div id="filearea">
					<span>병원사진(최대30장)</span>
					<input type="file" id="file" name="files" multiple="multiple">
				</div>
				<div id="info">
					<span>부가정보</span>
					<textarea class="form-control" id="msg" name="dutyEtc" placeholder="부가정보가 있다면 입력해주세요">${hospInfo.dutyEtc}</textarea>
				</div>
				
				<div id="btn_adm">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" onclick="location.href='${pageContext.request.contextPath}/'">취소</button>
				</div>
			</form>
	</div>
	</div>
</div>	
							
</body>



</html>


