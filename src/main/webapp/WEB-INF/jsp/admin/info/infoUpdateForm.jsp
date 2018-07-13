<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
body { 
   font-family: 'NanumSquare', sans-serif; 
}
#h1{
	background: #777;
	margin: 0;
    width: 715px;
}
#admin{
/* 	 border: 1px solid red; */
	 height: auto;
}
#main{
    /* border: 1px solid; */
    /* padding: 63px; */
    margin: 0 auto;
    border: 1px solid #ccc;
    padding: 3%;
    height: auto;
    width: 800px;
}
#admin_head{
    height: 80px;
    padding-left: 30px;
    margin-left: -13px;
    width: 890px;
}
#form{
/* 	border: 1px solid; */
}
#form div{
	padding: 20px;
	margin: -20px;
}
#form div span{
	padding: 10px;
/* 	font-size: 15px; */
}

input:focus, textarea:focus, input:hover, textarea:hover{
	outline:none;
	border-color: #C7C7C7;
}

input[type='text'] {
    width: 600px;
    height: 45px;
    font-weight: bold;
    margin-left: 18px;
    background-color: #fafafa;
    display: inline;
}

#address{
	margin-left: 32px;
	font-weight: bold;
	background-color: #fafafa;
}

#call{
	width: 85px;
	height: 45px;
	margin: 0px 0px 20px;
}
#call1{
	width: 200px;
}
#day{
	width: 900px;
    height: 80px;
    margin-left: -3px;
}
#day_area{
	width:700px;
	border: 1px solid #C7C7C7;
	background-color: #fafafa;
	
}
#day_area label{
	padding-right: 34px;
}
#time input{
	margin:20px
}
#filearea input{
	background-color: #fafafa;
    border: 1px solid #c7c7c7;
    margin: 20px;
}

#info{
	width: 940px;
  	height: auto;
    margin-top: -5px;
}

#info span{
	height: 60px;
    display: block;
    font-size: 14px;
    width: 100px;
    float: left;
}
#btn_adm{
	height: 80px;
	width: 147px;
	position: relative;
/*     bottom: -20px; */
    left: 323px;
}
#times{
	width: 90px;
	display: inline;
}
#major input{
	width: 589px;
} 
#treat input{
	width: 589px;
}
#msg{
	width: 600px;
    height: 180px;
	border:1px solid #C7C7C7;
	background-color: #fafafa;
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
			<form enctype="multipart/form-data" method="post" action="">
				<div><span>병원명</span><input type="text" class="form-control" name="name" placeholder="병원 명을 입력해 주세요"></div>
				<div><span>주소</span><input type="text" class="form-control" id="address" name="address" placeholder="주소를 입력해 주세요"></div>
				<div>
					<span>전화번호</span>
						<select id="call" name="call">
							<option value="">지역번호</option>
							<option value="서울">02</option>
							<option value="부산">051</option>
							<option value="대구">053</option>
							<option value="인천">032</option>
							<option value="광주">062</option>
							<option value="대전">042</option>
							<option value="울산">052</option>
							<option value="세종">044</option>
							<option value="경기">031</option>
							<option value="강원">033</option>
							<option value="충북">043</option>
							<option value="충남">041</option>
							<option value="전북">063</option>
							<option value="전남">061</option>
							<option value="경북">054</option>
							<option value="경남">055</option>
							<option value="제주">064</option>
						</select>
						-<input type="text" id ="call1" name="call1" class="form-control" placeholder="전화번호를 입력하세요">
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
					<span>대표진료</span>
					<input type="text" class="form-control" name="major" placeholder="대표진료항목">
				</div>
				<div id="treat">
					<span>진료항목</span>
					<input type="text" class="form-control" name=" treat" placeholder="#내과">
				</div>
				<div id="filearea">
					<span>병원사진(최대30장)</span>
					<input type="file" id="file" name="files" multiple="multiple">
				</div>
				<div id="info">
					<span>부가정보</span>
					<textarea class="form-control" id="msg" name="msg" placeholder="부가정보가 있다면 입력해주세요"></textarea>
				</div>
				
				<div id="btn_adm">
					<button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" onclick="">취소</button>
				</div>
			</form>
	</div>
	</div>
</div>	
							
</body>



</html>

