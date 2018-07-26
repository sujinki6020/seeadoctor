<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/map/searchinghospital.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IutEeaTAqvux8P5IXvhG&submodules=geocoder"></script>
</head>
<body>
<div id="searchbox">
        <div id="searchcondition">
            <a href="#1" id="searchForName">진료과 검색</a>
            <a href="#1" id="searchForSitu">상황별 검색</a>
        </div>
        <div id="search">
            <a href="#1"><span>진료과목</span><span id="hospiDept"></span><i id="icon"></i></a>
        </div>
        <div id="result">
            <div id="resultcount"><span>전체 보기</span><span id="count">0</span>개</div>
            <div id="resultlist">
                
            </div>
            <div id="categorybox" style="display:none;">
			    <ul id="category">
			        <li><a href="#1">전체선택</a></li>
			        <li><a href="#1">소아청소년과</a></li>
			        <li><a href="#1">내과</a></li>
			        <li><a href="#1">이비인후과</a></li>
			        <li><a href="#1">피부과</a></li>
			        <li><a href="#1">정형외과</a></li>
			        <li><a href="#1">치과</a></li>
			        <li><a href="#1">안과</a></li>
			        <li><a href="#1">한의원</a></li>
			        <li><a href="#1">산부인과</a></li>
			        <li><a href="#1">비뇨기과</a></li>
			        <li><a href="#1">가정의학과</a></li>
			        <li><a href="#1">정신건강의학과</a></li>
			        <li><a href="#1">외과</a></li>
			        <li><a href="#1">신경외과</a></li>
			        <li><a href="#1">성형외과</a></li>
			        <li><a href="#1">신경과</a></li>
			        <li><a href="#1">항문외과</a></li>
			        <li><a href="#1">응급의학과</a></li>
			        <li><a href="#1">마취통증의학과</a></li>
			        <li><a href="#1">재활의학과</a></li>
			        <li><a href="#1">흉부외과</a></li>
			        <li><a href="#1">진단검사의학과</a></li>
			        <li><a href="#1">영상의학과</a></li>
			        <li><a href="#1">결핵과</a></li>
			        <li><a href="#1">병리학</a></li>
			        <li><a href="#1">예방의학과</a></li>
			        <li><a href="#1">핵의학과</a></li>
			    </ul>
			</div>
            <div id="resultpage">
            	<ul>
                </ul>
            </div>
            <div id="ourinfo">
            </div>
        </div>
    </div>
    <div id="mapbox">
        <div id="searchaddress">
        	<input type="text" name="address" placeholder="주소 및 병원이름" autocomplete="off">
        	<div id="resultaddress">
        		<ul>
        		
        		</ul>
        	</div>
        </div>
        <div id="searchedmap">
        </div>
    </div>
<script src="${pageContext.request.contextPath}/js/map/searchinghospital.js"></script>
<script type="text/javascript">

</script>
</body>
</html>