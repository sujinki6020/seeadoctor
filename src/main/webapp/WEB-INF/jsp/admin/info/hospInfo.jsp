<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#hospiTitle {
   margin-top: 2%;
   margin-left: 5%;
   margin-bottom: 2%;
}
#hospiForm {
    box-sizing: border-box;
    text-align: left;   
    background: #fff;
    margin-top: 3%;
    width: 60%;
    margin-left: 5%;
}
#hospiTable {
    width: 100%;
    border-collapse: collapse;
    border-top: 2px solid #555;
    font-size: 1.3em;
}
.hospiRows {
    height: 50px;
    vertical-align: middle; 
    border-bottom: 1px solid #ddd;
}
.hospiDetail {
    padding-left: 3%;
    font-weight: normal;
}
#wall {
    width: 100%;
    height: 5%;
    padding-top: 10px;
    background: url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_pattern_mint.png) repeat-x 0 0;
}
#hospiTitle > p {
    font-size: 11px;
}
#hospiTitle > h1 {
    font-size: 3em;
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
.hospiAddr {
	padding: 5px 10px;
    width: 356px;
}
.hospiAddrDetail {
	padding: 5px 10px;
    width: 250px;
}
.days {   
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
    padding-top: 3%;
    padding-bottom: 5%;
    margin-left: 25%;
}

#btnsBox > div > button {
    width: 100%;
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
    position: relative;
}

.monday {
    background-image: url("http://localhost/seeadoctor/images/admin/form/monday1.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.tuesday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/tuesday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.wednesday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/wednesday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.thursday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/thursday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.friday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/friday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.saturday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/saturday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.sunday {
	background-image: url("http://localhost/seeadoctor/images/admin/form/sunday.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.medical {
	background-image: url("http://localhost/seeadoctor/images/admin/form/medical.png");
    position: absolute;
    background-position: center;
    background-size: 50%;
    background-repeat: no-repeat;
    width: 50px;
    height: 30px;
    left: -2%;
}
.start {
	margin-left: 5%;
}

.hospiDetail > div {
	margin-top: 1%;
	margin-bottom: 1%;
}
.hospiDetail > div > a {
	margin-left: 2%;
	text-decoration: none;
	background: #aaa;
   	border: 1px solid #aaa;
    padding: 4px 10px 6px;
    box-sizing: border-box;
    color: white;
}
.hospiDetail > div > a:hover {
	text-decoration: none;
	color: black;
}
.docCode {
	height: 31px;
   	margin-left: 5px;
}
#docPic {
	width: 288px;
    margin-left: 22px;
    position: absolute;
    right: 7%;
    top: 23%;
}
#hospiPic {
	width: 288px;
    margin-left: 22px;
    position: absolute;
    right: 7%;
    top: 80%;
}

#docPic > div > h3 , #hospiPic > div > h3 {
	position: relative;
    padding: 7px 20px;
    background: #65c1da url(http://fiximage.10x10.co.kr/web2015/my10x10/bg_sprite.png) no-repeat 0 -113px;
    color: #fff;
    font-size: 19px;
    line-height: 1.25em;
}
#pics ,#hospiPics {
	padding-top: 20px;    
	height: 375px;
	background-color: #fff;
}
#hospiPics {
	padding-top: 20px;    
	height: 280px;
	background-color: #fff;
}

#pics > div , #hospiPics > div {
	width: 184px;
    margin: 0 auto;
    position: relative;
}
.doctor, .hospis, #emptyHosp ,#emptyDoc {
	position: absolute;
}
.doctor > a > img , .hospis > a > img {
	width: 184px;
    height: 184px;
    border-radius: 100%;
}
#emptyHosp > a >img , #emptyDoc > a > img {
	width: 184px;
    height: 184px;
}
.doctorName {
	padding: 5px 10px;
    margin: 20px 0;
    width: 100%;
    text-align: center;
}
.doctorDept {
	padding: 5px 10px;
    width: 100%;
    text-align-last: center;
}
.docBtns ,.hospiBtns , .emptyBtns {
	position: relative;
	width: 100%;
    margin-top: 25px;
}
.docBtns > a ,.hospiBtns > a {
	box-sizing: border-box;
    padding: 5px 15px;
    background-color: #dc3545;
    color: white;
    text-decoration: none;
    border: none;
    font-size: 1.2em;
    margin-left: 2%;
    margin-right: 2%;
}
.emptyBtns > a {
    box-sizing: border-box;
    padding: 5px 15px;
    background-color: #dc3545;
    color: white;
    text-decoration: none;
    border: none;
    font-size: 1.2em;
    margin-left: 30%;
}
#prevDoc ,#prevHosp {
	left: 20px;
    background-position: 4px 0;
    overflow: hidden;
    position: absolute;
    top: 143px;
    width: 15px;
    height: 15px;
    text-indent: -999em;
    background-repeat: no-repeat;
    background-image: url(http://fiximage.10x10.co.kr/web2015/common/blt05.gif);
}
#nextDoc , #nextHosp {
	right: 20px;
    background-position: -209px 0;
    overflow: hidden;
    position: absolute;
    top: 143px;
    width: 15px;
    height: 15px;
    text-indent: -999em;
    background-repeat: no-repeat;
    background-image: url(http://fiximage.10x10.co.kr/web2015/common/blt05.gif)
}
.movePic {
	z-index : 1;
}
.whiteBackground {
	background-color: white;
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
    <div id="docPic">
    	<div>
    		<h3>의사</h3>
    		<div id="pics">
    			<a href="#1" id="prevDoc"></a>
    			<a href="#1" id="nextDoc"></a>
    			<div>
    				<c:choose>
    					<c:when test="${not empty doctors}">
    					<c:forEach var="item" items="${doctors}">
    						<div class="doctor">
			   					<input type="text" name="hospitalSeq" style="display:none" value="${sessionScope.user.hospitalSeq}">
			   					<input type="text" name="doctorSeq" style="display:none" value="${item.doctorSeq}">
			   					<input type="text" name="fileSeq" style="display:none" value="${item.fileSeq}">
			   					<a href="#1"><img src='${pageContext.request.contextPath}/hospital/fileOutPut.do?filePath=${item.filePath}&sysName=${item.sysName}'/></a>
			   					<input class="doctorName" type="text" name="doctorName" class="hospiDoctor" placeholder="의사이름을 입력하세요" value="${item.doctorName}">
			   					<select class="doctorDept" name="majorSeq">
									<option value="1" ${item.doctorDept == 1 ? 'selected="selected"' : '' }>가정의학과</option>
									<option value="2" ${item.doctorDept == 2 ? 'selected="selected"' : '' }>내과</option>
									<option value="3" ${item.doctorDept == 3 ? 'selected="selected"' : '' }>소아과</option>
									<option value="4" ${item.doctorDept == 4 ? 'selected="selected"' : '' }>신경정신과</option>
									<option value="5" ${item.doctorDept == 5 ? 'selected="selected"' : '' }>이비인후과</option>
									<option value="6" ${item.doctorDept == 6 ? 'selected="selected"' : '' }>안과</option>
									<option value="7" ${item.doctorDept == 7 ? 'selected="selected"' : '' }>피부과</option>
									<option value="8" ${item.doctorDept == 8 ? 'selected="selected"' : '' }>성형외과</option>
									<option value="9" ${item.doctorDept == 9 ? 'selected="selected"' : '' }>정형외과</option>
									<option value="10" ${item.doctorDept == 10 ? 'selected="selected"' : '' }>흉부외과</option>
			                       </select>
		                       <div class="docBtns">
			                        <a href="#1" class="addDoctor">의사추가</a>
			                        <a href="#1" class="removeDoctor">의사삭제</a>
		                       </div>
			   				</div>
    					</c:forEach>
    					</c:when>
    					<c:otherwise>
	    					<div id="emptyDoc">
	    						<a href="#1"><img src='${pageContext.request.contextPath}/images/admin/form/add-image.png'/></a>
	    						<div class="emptyBtns">
			                        <a href="#1" id="addFirstDoc">의사추가</a>
		                        </div>
	    					</div>
    					</c:otherwise>
    				</c:choose>
    				<div id="emptyDoc" style="display:none;">
   						<a href="#1"><img src='${pageContext.request.contextPath}/images/admin/form/add-image.png'/></a>
   						<div class="emptyBtns">
	                        <a href="#1" id="addFirstDoc">의사추가</a>
                        </div>
   					</div>
    			</div>
    		</div>
    	</div>
    </div>
    <div id="hospiPic">
    	<div>
    		<input type="text" id="nowHospitalSeq" style="display:none" value="${sessionScope.user.hospitalSeq}">
    		<h3>병원 사진</h3>
    		<div id="hospiPics">
    			<a href="#1" id="prevHosp"></a>
    			<a href="#1" id="nextHosp"></a>
    			<div>
    				<c:choose>
    				<c:when test="${not empty files}">
    				<c:forEach var="item" items="${files}">
	    				<div class="hospis">
	    					<input type="text" style="display:none" value="${sessionScope.user.hospitalSeq}">
	    					<input type="text" style="display:none" value="${item.fileSeq}">
	    					<a href="#1"><img src='${pageContext.request.contextPath}/hospital/fileOutPut.do?filePath=${item.filePath}&sysName=${item.sysName}'/></a>
	                        <div class="hospiBtns">
		                        <a href="#1" class="addHospi">사진추가</a>
		                        <a href="#1" class="removeHospi">사진삭제</a>
	                        </div>
	    				</div>
    				</c:forEach>
    				</c:when>
    				<c:otherwise>
    					<div id="emptyHosp">
    						<a href="#1"><img src='${pageContext.request.contextPath}/images/admin/form/add-image.png'/></a>
    						<div class="emptyBtns">
		                        <a href="#1" id="addFirstPic">사진추가</a>
	                        </div>
    					</div>
    				</c:otherwise>
    				</c:choose>
    					<div id="emptyHosp" style="display:none;">
    						<a href="#1"><img src='${pageContext.request.contextPath}/images/admin/form/add-image.png'/></a>
    						<div class="emptyBtns">
		                        <a href="#1" id="addFirstPic">사진추가</a>
	                        </div>
    					</div>
    			</div>
    		</div>
    	</div>
    </div>
    <div id="modForm">
        <form action="infoUpdate.do" method="post" enctype="multipart/form-data" id="hospiForm">
            <table id="hospiTable">
                <colgroup>
                    <col style="width: 15%;background: #f7f7f7;">
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
                    <th class="hospiDetail">병원 분류</th>
                    <th class="hospiDetail"><input type="text" name="dutyDivNam" class="inputs" placeholder="병원분류를 입력해주세요" value="${hospInfo.dutyDivNam}" readonly="readonly"></th>
                </tr>
                <tr class="hospiRows">
                    <th class="hospiDetail">진료항목</th>
                    <th class="hospiDetail"><input type="text" name="addTreat" class="inputs" placeholder="진료항목을 입력하세요" value="${hospInfo.addTreat}"></th>
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
                    <th class="hospiDetail">부가정보</th>
                    <th class="hospiDetail"><textarea name="dutyEtc" cols="90" rows="10">"${hospInfo.dutyEtc}"</textarea></th>
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

$("#addFirstDoc").click(function(){
	$("#emptyDoc").hide();
	var docText = ['<div class="doctor" >',
		'<a href="#1"><img src="${pageContext.request.contextPath}/images/admin/form/add.png"/></a>',
		'<input class="doctorName" type="text" name="doctorName" class="hospiDoctor" placeholder="의사이름을 입력하세요">',
		'<select class="doctorDept" name="majorSeq">',
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
		'</select>',
		'<div class="docBtns">',
		'<a href="#1" class="addDoctor">의사추가</a>',
		'<a href="#1" class="removeDoctor">의사삭제</a>',
		'</div></div>'].join("");
	$(".doctor").each(function(){
		$(this).removeClass("movePic");
	})
	$('#pics > div').prepend(docText);
	$(".doctor").eq(0).addClass("movePic");
	console.log("파일업로드중")
	var doctors = document.querySelectorAll(".doctor");
	console.log("의사들",doctors)
	doctors.forEach(function(item){
		item.ondragover = function(event){
            return false;
        };
        item.ondrop = function(event){
            var files = event.dataTransfer.files; 
            for(var i = 0 ; i < files.length ; i++){
                console.log(files[i].name);
                console.log(files[i].size);
                console.log($(item).find("img"));
                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
                sendFile(files[i],$(item));
            }
            return false;
        }
	})
})


	$("#addFirstPic").click(function(){
		$("#emptyHosp").hide();
	    var docText = [
			'<div class="hospis">',
			'<input type="text" style="display:none" value="${sessionScope.user.hospitalSeq}">',
			'<input type="text" style="display:none" value="${item.fileSeq}">',
			'<a href="#1"><img src="${pageContext.request.contextPath}/images/admin/form/add.png"/></a>',
			'<div class="hospiBtns">',
			'<a href="#1" class="addHospi">사진추가</a>',
			'<a href="#1" class="removeHospi">사진삭제</a>',
			'</div>',
			'</div>'
		].join("");
		$(".hospis").each(function(){
			$(this).removeClass("movePic");
		})
		$('#hospiPics > div').prepend(docText);
		$(".hospis").eq(0).addClass("movePic");
		var hospis = document.querySelectorAll(".hospis");
		console.log("의사들",hospis)
		hospis.forEach(function(item){
			item.ondragover = function(event){
				event.stopPropagation();
			    event.preventDefault();
	            return false;
	        };
	        item.ondrop = function(event){
	        	event.stopPropagation();
			    event.preventDefault();
	            var files = event.dataTransfer.files; 
	            for(let i = 0 ; i < files.length ; i++){
	                console.log("파일 이름",files[i].name);
	                console.log("파일 사이즈",files[i].size);
	                console.log($(item).find("img"));
	                console.log("병원번호",$(item).find("input:eq(0)").val());
	                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
	                sendHospital(files[i] , $(item).find("input:eq(0)").val(), $(item).find("input:eq(1)"));
	            }
	            return false;
	        }
		})
	})
	
$(document).ready(function(){
	var hospis = document.querySelectorAll(".hospis");
	console.log("의사들",hospis)
	hospis.forEach(function(item){
		item.ondragover = function(event){
			event.stopPropagation();
		    event.preventDefault();
            return false;
        };
        item.ondrop = function(event){
        	event.stopPropagation();
		    event.preventDefault();
            var files = event.dataTransfer.files; 
            for(let i = 0 ; i < files.length ; i++){
                console.log("파일 이름",files[i].name);
                console.log("파일 사이즈",files[i].size);
                console.log($(item).find("img"));
                console.log("병원번호",$(item).find("input:eq(0)").val());
                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
                sendHospital(files[i] , $(item).find("input:eq(0)").val(), $(item).find("input:eq(1)"));
                $(".hospis").eq(0).removeClass("whiteBackground");
            }
            return false;
		}
	})
	var doctors = document.querySelectorAll(".doctor");
	console.log("의사들",doctors)
	doctors.forEach(function(item){
		item.ondragover = function(event){
            return false;
        };
        item.ondrop = function(event){
            var files = event.dataTransfer.files; 
            for(var i = 0 ; i < files.length ; i++){
                console.log(files[i].name);
                console.log(files[i].size);
                console.log($(item).find("img"));
                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
                sendFile(files[i],$(item));
                $(".doctor").eq(0).removeClass("whiteBackground");
            }
            return false;
        }
	})
	
})

	$(".ampm").keyup(function(e){
		var regNumber = /^[0-9]*$/;
		if(!regNumber.test($(this).val())){
			$(this).val("");
			alert("숫자값을 입력하세요");
			return;
		}
	})
	
	$("#hospiMod").click(function(){
		$("#hospiForm").submit();
	})
	$("#prevDoc").click(function(){
		var picIndex = 0;
		$(".doctor").each(function(index){
			if($(this).hasClass("movePic")){
				picIndex = index;
				$(this).removeClass("movePic");
				return;
			}
		})
		$(".doctor:eq(" + --picIndex +")").addClass("movePic");
	})
	$("#nextDoc").click(function(){
		var picIndex = 0;
		$(".doctor").each(function(index){
			if($(this).hasClass("movePic")){
				picIndex = index;
				$(this).removeClass("movePic");
				return;
			}
		})
		if(++picIndex >= $(".doctor").length){
			picIndex = 0;
		}
		$(".doctor:eq(" + picIndex +")").addClass("movePic");
	})
	
	$("#prevHosp").click(function(){
		var picIndex = 0;
		$(".hospis").each(function(index){
			if($(this).hasClass("movePic")){
				picIndex = index;
				$(this).removeClass("movePic");
				return;
			}
		})
		$(".hospis:eq(" + --picIndex +")").addClass("movePic");
	})
	$("#nextHosp").click(function(){
		var picIndex = 0;
		$(".hospis").each(function(index){
			if($(this).hasClass("movePic")){
				picIndex = index;
				$(this).removeClass("movePic");
				return;
			}
		})
		if(++picIndex >= $(".hospis").length){
			picIndex = 0;
		}
		$(".hospis:eq(" + picIndex +")").addClass("movePic");
	})
$(document).on("click",".addDoctor",function(){
	var docText = ['<div class="doctor" >',
		'<a href="#1"><img src="${pageContext.request.contextPath}/images/admin/form/add.png"/></a>',
		'<input class="doctorName" type="text" name="doctorName" class="hospiDoctor" placeholder="의사이름을 입력하세요">',
		'<select class="doctorDept" name="majorSeq">',
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
		'</select>',
		'<div class="docBtns">',
		'<a href="#1" class="addDoctor">의사추가</a>',
		'<a href="#1" class="removeDoctor">의사삭제</a>',
		'</div></div>'].join("");
	$(".doctor").each(function(){
		$(this).removeClass("movePic");
	})
	$('#pics > div').prepend(docText);
	$(".doctor").eq(0).addClass("movePic").addClass("whiteBackground");
	console.log("파일업로드중")
	var doctors = document.querySelectorAll(".doctor");
	console.log("의사들",doctors)
	doctors.forEach(function(item){
		item.ondragover = function(event){
            return false;
        };
        item.ondrop = function(event){
            var files = event.dataTransfer.files; 
            for(var i = 0 ; i < files.length ; i++){
                console.log(files[i].name);
                console.log(files[i].size);
                console.log($(item).find("img"));
                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
                sendFile(files[i],$(item));
                $(".doctor").eq(0).removeClass("whiteBackground");
            }
            return false;
        }
	})
})	

$(document).on("click",".addHospi",function(){
	$("#emptyHosp").hide();
    var docText = [
		'<div class="hospis">',
		'<input type="text" style="display:none" value="${sessionScope.user.hospitalSeq}">',
		'<input type="text" style="display:none" value="${item.fileSeq}">',
		'<a href="#1"><img src="${pageContext.request.contextPath}/images/admin/form/add.png"/></a>',
		'<div class="hospiBtns">',
		'<a href="#1" class="addHospi">사진추가</a>',
		'<a href="#1" class="removeHospi">사진삭제</a>',
		'</div>',
		'</div>'
	].join("");
	$(".hospis").each(function(){
		$(this).removeClass("movePic");
	})
	$('#hospiPics > div').prepend(docText);
	$(".hospis").eq(0).addClass("movePic").addClass("whiteBackground");
	var hospis = document.querySelectorAll(".hospis");
	console.log("의사들",hospis)
	hospis.forEach(function(item){
		item.ondragover = function(event){
			event.stopPropagation();
		    event.preventDefault();
            return false;
        };
        item.ondrop = function(event){
        	event.stopPropagation();
		    event.preventDefault();
            var files = event.dataTransfer.files; 
            for(let i = 0 ; i < files.length ; i++){
                console.log("파일 이름",files[i].name);
                console.log("파일 사이즈",files[i].size);
                console.log($(item).find("img"));
                console.log("병원번호",$(item).find("input:eq(0)").val());
                $(item).find("img").attr("src", URL.createObjectURL(files[i]));
                sendHospital(files[i] , $("#nowHospitalSeq").val(), $(item).find("input:eq(1)"));
                $(".hospis").eq(0).removeClass("whiteBackground");
            }
            return false;
        }
	})
})	
function sendHospital(file , hospitalSeq , fileSeq){
	var fd = new FormData();
   	fd.append("attach",file); // 객체를 어펜드 시킨다.
   	fd.append("hospitalSeq",hospitalSeq);
   	fd.append("fileSeq",fileSeq.val());
   	console.dir(file);
   	console.log("병원 시퀀스",hospitalSeq);
   	$.ajax({
   		url : "http://localhost/seeadoctor/admin/info/uploadHospPic.do",
   		data : fd,
   		type : "POST",
   		contentType : false,
   		processData : false, 
   		success : function(data){
   			console.log(data);
   			fileSeq.val(data);
   			console.dir(fileSeq);
   		},
   		error : function (e) { console.log(e);}
   	})
	
}
$(document).on("click",".removeHospi",function(){
	let fileDiv = $(this).parent().parent();
	let fileSeq = $(this).parent().parent().find("input:eq(1)").val();
	console.log("삭제되기 전 파일 div",fileDiv.length);
	if(!fileSeq) return;
	console.log("삭제 시퀀스",fileSeq);
	$.ajax({
   		url : "http://localhost/seeadoctor/admin/info/removeHospPic.do",
   		data : "fileSeq="+fileSeq,
   		type : "POST",
   		success : function(data){
   			fileDiv.remove();
   			console.log("병원사진 길이",$(".hospis").length)
   			if($(".hospis").length == 0){
   				console.log("병원 삭제 테스트");
   				$("#emptyHosp").show();
   			}
   		},
   		error : function (e) { console.log(e);}
   	})
})

$(document).on("click",".removeDoctor",function(){
	let fileDiv = $(this).parent().parent();
	let fileSeq = $(this).parent().parent().find("input[name='fileSeq']").val();
	console.log("삭제되기 전 파일 div",fileDiv.length);
	if(!fileSeq) return;
	console.log("삭제 시퀀스",fileSeq);
	$.ajax({
   		url : "http://localhost/seeadoctor/admin/info/removeDoctor.do",
   		data : "fileSeq="+fileSeq,
   		type : "POST",
   		success : function(data){
   			fileDiv.remove();
   			console.log("병원사진 길이",$(".doctor").length)
   			if($(".doctor").length == 0){
   				console.log("병원 삭제 테스트");
   				$("#emptyDoc").show();
   			}
   		},
   		error : function (e) { console.log(e);}
   	})
})
	
function sendFile(file, doctor){
   	var fd = new FormData();
   	//hospitalSeq, doctorName , doctorDept , doctorSeq , fileSeq
   	fd.append("attach",file); // 객체를 어펜드 시킨다.
   	console.log("잘들어옴")
   	var hospitalSeq = $("#nowHospitalSeq").val();
   	var doctorSeq = doctor.find("input[name='doctorSeq']").val();
   	var fileSeq = doctor.find("input[name='fileSeq']").val();
   	var doctorName = doctor.find("input[name='doctorName']").val();
   	var doctorDept = doctor.find("option:selected").val();
   	console.log("병원 시퀀스",hospitalSeq);
   	console.log("의사 시퀀스", doctorSeq);
   	console.log("파일 시퀀스",fileSeq);
   	console.log("의사 이름",doctorName);
   	console.log("의사 부서",doctorDept);
   	if(doctorName == null || doctorName == ""){
   		alert("이름을 입력한후 사진을 첨부하세요");
   		doctor.remove();
   		if($(".doctor").length == 0){
   			$("#emptyDoc").show();
   		}
   		return;
   	}
   	fd.append("hospitalSeq",hospitalSeq);
   	fd.append("doctorDept",doctorDept);
   	fd.append("doctorName",doctorName);
   	fd.append("doctorSeq",doctorSeq);
   	fd.append("fileSeq",fileSeq);
   	// MultipartFile attach ,String hospitalSeq , String doctorName , String doctorDept , String doctorSeq ,String fileSeq
   	$.ajax({
   		url : "http://localhost/seeadoctor/admin/info/uploadDoctor.do",
   		data : fd,
   		type : "POST",
   		contentType : false,
   		processData : false, 
   		success : function(data){
   			console.log(data);
   			doctor.find("input[name='fileSeq']").val(data);
   			console.dir(fileSeq);
   		},
   		error : function (e) { console.log(e);}
   	})
}
</script>
</body>
</html>