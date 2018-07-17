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
            <a href="#1">진료과 검색</a>
            <a href="#1">상황별 검색</a>
        </div>
        <div id="search">
            <a href="#1"><span>진료과목</span><i id="icon"></i></a>
        </div>
        <div id="result">
            <div id="resultcount"><span>전체 보기</span><span id="count">0</span>개</div>
            <div id="resultlist">
                
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
</body>
</html>