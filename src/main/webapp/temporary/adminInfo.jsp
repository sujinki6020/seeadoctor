<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/form/hospiUpdateform.css">
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
	        <form action="" method="post" enctype="multipart/form-data" id="hospiForm">
	            <table id="hospiTable">
	                <colgroup>
	                    <col style="width: 10%;background: #f7f7f7;">
	                    <col style="width: 50%;">
	                </colgroup>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">병원명</th>
	                    <th class="hospiDetail">
	                        <input class="inputs" type="text" name="hospiName" id="hospiName" placeholder="병원명을 입력해주세요">
	                    </th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">주소</th>
	                    <th class="hospiDetail">
	                    	<div>
		                        <input class="inputs" type="text" name="hospiAddr" id="hospiAddr" placeholder="우편번호">
		                        <a href="#1">주소검색</a>
	                    	</div>
	                    	<div>
		                        <input class="hospiAddr" type="text" name="hospiAddr" id="hospiAddr" placeholder="도로명주소">
		                        <input class="hospiAddrDetail" type="text" name="hospiAddr" id="hospiAddr" placeholder="상세주소">
		                        <input class="hospiAddrDetail" type="text" name="hospiAddr" id="hospiAddr" placeholder="상세주소">
	                    	</div>
	                    </th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">전화번호</th>
	                    <th class="hospiDetail"><input class="inputs" name="hospiPhone" type="text" placeholder="전화번호를 입력하세요"></th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">운영요일 설정</th>
	                    <th class="hospiDetail">
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
	                <tr class="hospiRows">
	                    <th class="hospiDetail">영업시간</th>
	                    <th id="times" class="hospiDetail">
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
	                <tr class="hospiRows">
	                    <th class="hospiDetail">병원 분류</th>
	                    <th class="hospiDetail"><input type="text" name="hospiKind" class="inputs" placeholder="병원분류를 입력해주세요"></th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">진료항목</th>
	                    <th class="hospiDetail"><input type="text" name="treatDept" class="inputs" placeholder="진료항목을 입력하세요"></th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">의사정보</th>
	                    <th class="hospiDetail"><input type="text" name="treatDept" class="inputs" placeholder="진료항목을 입력하세요"></th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">병원사진</th>
	                    <th class="hospiDetail"><input type="file" name="file"></th>
	                </tr>
	                <tr class="hospiRows">
	                    <th class="hospiDetail">부가정보</th>
	                    <th class="hospiDetail"><textarea name="addInfo" cols="100" rows="10"></textarea></th>
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


