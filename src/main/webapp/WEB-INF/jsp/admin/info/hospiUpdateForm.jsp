<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/form/hospiUpdateform.css">
<style>
	.docCode {
		height: 31px;
    	margin-left: 5px;
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
        <form action="infoUpdate.do" method="post" enctype="multipart/form-data" id="hospiForm">
            <table id="hospiTable">
                <colgroup>
                    <col style="width: 10%;background: #f7f7f7;">
                    <col style="width: 50%;">
                </colgroup>
                <tr class="hospiRows" style="display:none;">
                    <th class="hospiDetail">
                        <input class="inputs" type="text" name="hospitalSeq" id="hospiName" placeholder="병원명을 입력해주세요" value="${hospInfo.hospitalSeq}">
                    </th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">병원명</th>
                    <th class="hospiDetail">
                        <input class="inputs" type="text" name="dutyName" id="hospiName" placeholder="병원명을 입력해주세요" value="${hospInfo.dutyName}">
                    </th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">주소</th>
                    <th class="hospiDetail">
                    	<div>
	                        <input class="hospiAddr" type="text" name="dutyAddr" id="hospiAddr" placeholder="주소를 입력해주세요" value="${hospInfo.dutyAddr}">
                    	</div>
                    </th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">전화번호</th>
                    <th class="hospiDetail"><input class="inputs" name="dutyTel1" type="text" placeholder="전화번호를 입력하세요" value="${hospInfo.dutyTel1}"></th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">영업시간</th>
                    <th id="times" class="hospiDetail">
                        <div data-flag="monday" >
                            <div class="monday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime1s" class="ampm" maxlength="4" value="${hospInfo.dutyTime1s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime1c" class="ampm" maxlength="4" value="${hospInfo.dutyTime1c}">
                        </div>
                        <div data-flag="tuesday">
                            <div class="tuesday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime2s" class="ampm" maxlength="4" value="${hospInfo.dutyTime2s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime2c" class="ampm" maxlength="4" value="${hospInfo.dutyTime2c}">
                        </div>
                        <div data-flag="wednesday">
                            <div class="wednesday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime3s" class="ampm" maxlength="4" value="${hospInfo.dutyTime3s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime3c" class="ampm" maxlength="4" value="${hospInfo.dutyTime3c}">
                        </div>
                        <div data-flag="thursday">
                            <div class="thursday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime4s" class="ampm" maxlength="4" value="${hospInfo.dutyTime4s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime4c" class="ampm" maxlength="4" value="${hospInfo.dutyTime4c}">
                        </div>
                        <div data-flag="friday">
                            <div class="friday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime5s" class="ampm" maxlength="4" value="${hospInfo.dutyTime5s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime5c" class="ampm" maxlength="4" value="${hospInfo.dutyTime5c}">
                        </div>
                        <div data-flag="saturday">
                            <div class="saturday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime6s" class="ampm" maxlength="4" value="${hospInfo.dutyTime6s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime6c" class="ampm" maxlength="4" value="${hospInfo.dutyTime6c}">
                        </div>
                        <div data-flag="sunday">
                            <div class="sunday"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime7s" class="ampm" maxlength="4" value="${hospInfo.dutyTime7s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime7c" class="ampm" maxlength="4" value="${hospInfo.dutyTime7c}">
                        </div>
                        <div data-flag="medical">
                            <div class="medical"></div>
                            <label for="" class="start">시작시간:</label>
                            <input type="text" name="dutyTime8s" class="ampm" maxlength="4" value="${hospInfo.dutyTime8s}">
                            <label for="">종료시간:</label>
                            <input type="text" name="dutyTime8c" class="ampm" maxlength="4" value="${hospInfo.dutyTime8c}">
                        </div>
                    </th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">병원 분류</th>
                    <th class="hospiDetail"><input type="text" name="dutyDivNam" class="inputs" placeholder="병원분류를 입력해주세요" value="${hospInfo.dutyDivNam}" readonly="readonly"></th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">진료항목</th>
                    <th class="hospiDetail"><input type="text" name="addTreat" class="inputs" placeholder="진료항목을 입력하세요" value="${hospInfo.addTreat}"></th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">의사정보</th>
                    <th class="hospiDetail">
                    	<div>
	                        <input class="inputs" type="text" name="doctorName" class="hospiDoctor" placeholder="의사이름을 입력하세요"><select class="inputs docCode" name="majorSeq" required="required">
							<option value="1">가정의학과</option>
							<option value="2">내과</option>
							<option value="3">소아과</option>
							<option value="4">신경정신과</option>
							<option value="5">이비인후과</option>
							<option value="6">안과</option>
							<option value="7">피부과</option>
							<option value="8">성형외과</option>
							<option value="9">정형외과</option>
							<option value="10">흉부외과</option>
	                        </select><a href="#1" id="addDoctor">의사추가</a>
                    	</div>
                    </th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">병원사진</th>
                    <th class="hospiDetail"><input type="file" name="files" multiple="multiple"></th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">부가정보</th>
                    <th class="hospiDetail"><textarea name="dutyEtc" cols="100" rows="10">"${hospInfo.dutyEtc}"</textarea></th>
                </tr>
            </table>
        </form>
        <div id="btnsBox">
            <div>
                <button id="hospiMod">수정</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
	$(".ampm").keyup(function(e){
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test($(this).val())){
			$(this).val("");
			alert("숫자값을 입력하세요");
			return;
		}
	})
	$("#addDoctor").click(function(){
		var text = ['<select class="inputs docCode" name="majorSeq" required="required">',
    	'<option value="1">가정의학과</option>',
    	'<option value="2">내과</option>',
    	'<option value="3">소아과</option>',
    	'<option value="4">신경정신과</option>',
    	'<option value="5">이비인후과</option>',
    	'<option value="6">안과</option>',
    	'<option value="7">피부과</option>',
    	'<option value="8">성형외과</option>',
    	'<option value="9">정형외과</option>',
    	'<option value="10">흉부외과</option>',
    	'</select>'
    	].join('');
		$(this).parent().parent().append('<div><input class="inputs" type="text" name="doctorName" class="hospiDoctor" placeholder="의사이름을 입력하세요">'+ text +'<a href="#1" class="removeDoctor">의사삭제</a></div>')
	});
	$(".hospiDetail").on("click",'.removeDoctor',function(){
		$(this).parent().remove();
	})
	$("#hospiMod").click(function(){
		$("#hospiForm").submit();
		
	})
</script>
</body>
</html>