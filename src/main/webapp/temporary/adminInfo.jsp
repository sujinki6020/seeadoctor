<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<style>
	#hospiTitle {
	    margin-top: 2%;
	    margin-left: 5%;
	    margin-bottom: 2%;
	   
	}
	form {
	    margin-top: 3%;
	    box-sizing: border-box;
	    margin-left: 5%;
	    margin-right: 5%;
	    text-align: left;   
	    background: #fff;
	}
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border-top: 2px solid #555;
	    font-size: 1.3em;
	}
	tr {
	    height: 50px;
	    vertical-align: middle; 
	    border-bottom: 1px solid #ddd;
	}
	th {
	    padding-left: 2%;
	    font-weight: normal;
	}
	#wall {
	    width: 100%;
	    height: 5%;
	    padding-top: 40px;
	    background: url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_pattern_mint.png) repeat-x 0 0;
	}
	#hospiTitle > p {
	    font-size: 11px;
	}
	#hospiTitle > h1 {
	    font-size: 2em;
	}
	#adminBox {
	    background: #f4eade url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_pattern_beige.png);
	    height: auto;
	    min-height: 800px;
	}
	.inputs {
	    padding: 5px 10px;
	    width: 178px;
	}
	input.days {   
	    vertical-align: middle;
	}
	textarea {
	    resize: none;
	}
	.ampm {
	    padding: 5px 10px;
	    width: 75px;
	    margin-left: 1%;
	    margin-right: 1%;
	}
	#btnsBox > div {
	    width: 20%;
	    margin: 0 auto;
	    padding-top: 3%;
	    padding-bottom: 5%;
	}
	#btnsBox > div > button {
	    width: 47%;
	    box-sizing: border-box;
	    padding: 15px 32px;
	    background-color: #dc3545;
	    color: white;
	    text-decoration: none;
	    border: none;
	    font-size: 1.2em;
	    margin: 0 1%;
	}
	#times > div {
	    margin-top: 1%;
	    margin-bottom: 1%;  
	}
	.monday {
	    background-image: url("http://localhost/seeadoctor/temporary/monday1.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.tuesday {
		background-image: url("http://localhost/seeadoctor/temporary/tuesday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.wednesday {
		background-image: url("http://localhost/seeadoctor/temporary/wednesday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.thursday {
		background-image: url("http://localhost/seeadoctor/temporary/thursday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.friday {
		background-image: url("http://localhost/seeadoctor/temporary/thursday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.saturday {
		background-image: url("http://localhost/seeadoctor/temporary/saturday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.sunday {
		background-image: url("http://localhost/seeadoctor/temporary/sunday.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.medical {
		background-image: url("http://localhost/seeadoctor/temporary/medical.png");
	    position: absolute;
	    background-position: center;
	    background-size: 50%;
	    background-repeat: no-repeat;
	    width: 50px;
	    height: 30px;
	}
	.start {
		margin-left: 5%;
	}
</style>
</head>
<body>
	<div id="adminBox">
	    <div id="wall">
	        <div id="hospiTitle">
	            <h1>병원정보수정</h1>
	            <p>병원의 주소와 연락처 ,의사정보 및 병원정보를 수정하실 수 있습니다.</p>
	        </div>
	    </div>
	    <div id="modForm">
	        <form action="" method="post" enctype="multipart/form-data">
	            <table>
	                <colgroup>
	                    <col style="width: 10%;background: #f7f7f7;">
	                    <col style="width: 50%;">
	                </colgroup>
	                <tr>
	                    <th>병원명</th>
	                    <th>
	                        <input class="inputs" type="text" name="hospiName" id="hospiName" placeholder="병원명을 입력해주세요">
	                    </th>
	                </tr>
	                <tr>
	                    <th>주소</th>
	                    <th>
	                        <input class="inputs" type="text" name="hospiAddr" id="hospiAddr" placeholder="주소를 입력해주세요">
	                    </th>
	                </tr>
	                <tr>
	                    <th>전화번호</th>
	                    <th><input class="inputs" name="hospiPhone" type="text" placeholder="전화번호를 입력하세요"></th>
	                </tr>
	                <tr>
	                    <th>운영요일 설정</th>
	                    <th>
	                        <input type="checkbox" name="monday" id="mon" class="days">
	                        <label for="mon">월요일</label>
	                        <input type="checkbox" name="tuesday" id="tue" class="days">
	                        <label for="tue">화요일</label>
	                        <input type="checkbox" name="wednesday" id="wed" class="days">
	                        <label for="wed">수요일</label>
	                        <input type="checkbox" name="thursday" id="thu" class="days">
	                        <label for="thu">목요일</label>
	                        <input type="checkbox" name="friday" id="fri" class="days">
	                        <label for="fri">금요일</label>
	                        <input type="checkbox" name="saturday" id="sat" class="days">
	                        <label for="sat">토요일</label>
	                        <input type="checkbox" name="sunday" id="sun" class="days">
	                        <label for="sun">일요일</label>
	                        <input type="checkbox" name="medical" id="medical" class="days">
	                        <label for="medical">공휴일</label>
	                    </th>
	                </tr>
	                <tr>
	                    <th>영업시간</th>
	                    <th id="times">
	                        <div data-flag="monday" style="display:none;">
	                            <div class="monday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="mondayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="mondayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="tuesday" style="display:none;">
	                            <div class="tuesday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="tuesdayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="tuesdayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="wednesday" style="display:none;">
	                            <div class="wednesday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="wednesdayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="wednesdayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="thursday" style="display:none;">
	                            <div class="thursday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="thursdayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="thursdayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="friday" style="display:none;">
	                            <div class="friday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="fridayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="fridayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="saturday" style="display:none;">
	                            <div class="saturday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="saturdayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="saturdayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="sunday" style="display:none;">
	                            <div class="sunday"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="sundayAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="sundayPM" class="ampm" maxlength="4">
	                        </div>
	                        <div data-flag="medical" style="display:none;">
	                            <div class="medical"></div>
	                            <label for="" class="start">시작시간:</label>
	                            <input type="text" name="medicalAM" class="ampm" maxlength="4">
	                            <label for="">종료시간:</label>
	                            <input type="text" name="medicalPM" class="ampm" maxlength="4">
	                        </div>
	                    </th>
	                </tr>
	                <tr>
	                    <th>병원 분류</th>
	                    <th><input type="text" name="hospiKind" class="inputs" placeholder="병원분류를 입력해주세요"></th>
	                </tr>
	                <tr>
	                    <th>진료항목</th>
	                    <th><input type="text" name="treatDept" class="inputs" placeholder="진료항목을 입력하세요"></th>
	                </tr>
	                <tr>
	                    <th>병원사진</th>
	                    <th><input type="file" name="file"></th>
	                </tr>
	                <tr>
	                    <th>부가정보</th>
	                    <th><textarea name="addInfo" cols="100" rows="10"></textarea></th>
	                </tr>
	            </table>
	        </form>
	        <div id="btnsBox">
	            <div>
	                <button>수정</button>
	                <button>취소</button>
	            </div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
		$(".days").click(function(){
			var name = $(this).attr("name");
			$("#times").find("div[data-flag='" + name + "']").toggle();
		})
	</script>
</body>
</html>


