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
<script defer type="text/javascript">
// var HOME_PATH = window.HOME_PATH || '.';
// var infowindow = new naver.maps.InfoWindow();
// var latitude = null;
// var longitude = null;
// var map = new naver.maps.Map('searchedmap', {
//     center: new naver.maps.LatLng(latitude || 37.5666805, longitude || 126.9784147),
//     zoom: 11,
//     mapTypeId: naver.maps.MapTypeId.NORMAL
// });
// function onSuccessGeolocation(position) {
//     var location = new naver.maps.LatLng(position.coords.latitude,
//                                          position.coords.longitude);
//     latitude = position.coords.latitude;
//     longitude = position.coords.longitude;
//     map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
//     map.setZoom(10); // 지도의 줌 레벨을 변경합니다.
//     console.log('Coordinates: ' + location.toString());
// 	var imageMarker = new naver.maps.Marker({
// 	    position: new naver.maps.LatLng(latitude, longitude),
// 	    map: map,
// 	    title: 'imageMarker',
// 	    icon: "http://localhost/seeadoctor/images/map/placeholder.png",
// 	    animation: naver.maps.Animation.BOUNCE
// 	});
// }

// $(window).on("load", function() {
//     if (navigator.geolocation) {
//         navigator.geolocation.getCurrentPosition(onSuccessGeolocation);
//     } else {
//         var center = map.getCenter();
//         infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
//         infowindow.open(map, center);
//     }
// });

// function setAnimateMarker(latitude, longitude){
// 	var imageMarker = new naver.maps.Marker({
// 	    position: new naver.maps.LatLng(latitude, longitude),
// 	    map: map,
// 	    title: 'imageMarker',
// 	    icon: "http://localhost/seeadoctor/images/map/placeholder.png",
// 	    animation: naver.maps.Animation.BOUNCE
// 	});
// }


var MARKER_ICON_URL = 'http://localhost/seeadoctor/images/map/placeholder.png';
var MARKER_HIGHLIGHT_ICON_URL = 'http://localhost/seeadoctor/images/map/pin.png';
var HOME_PATH = window.HOME_PATH || '.';
var MARKER_SPRITE_POSITION = {
        "A0": [37.3595704, 127.105399],
        "A1": [37.3596704, 127.106399]
    };

var map = new naver.maps.Map('searchedmap', {
    center: new naver.maps.LatLng(37.3595704, 127.105399),
    zoom: 10
});


var markers = [],
    infoWindows = [];

for (var key in MARKER_SPRITE_POSITION) {

    var position = new naver.maps.LatLng(
    		MARKER_SPRITE_POSITION[key][0], MARKER_SPRITE_POSITION[key][1]);

    var marker = new naver.maps.Marker({
        map: map,
        position: position,
        title: key,
        icon: {
            url: 'http://localhost/seeadoctor/images/map/pin.png',
            size: new naver.maps.Size(24, 37)
        },
        zIndex: 100
    });
    var imageMarker = new naver.maps.Marker({
        position: new naver.maps.LatLng(37.3637770, 127.1174332),
        map: map,
        title: 'imageMarker',
        icon: 'http://localhost/seeadoctor/images/map/placeholder.png',
        animation: naver.maps.Animation.BOUNCE
    });

    var infoWindow = new naver.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:10px;">The Letter is <b>"'+ key.substr(0, 1) +'"</b>.</div>'
    });

    markers.push(marker);
    infoWindows.push(infoWindow);
};

naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.setMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.setMap()) return;
    marker.setMap(null);
}

// 해당 마커의 인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
function getClickHandler(seq) {
    return function(e) {
        var marker = markers[seq],
            infoWindow = infoWindows[seq];

        if (infoWindow.getMap()) {
            infoWindow.close();
        } else {
            infoWindow.open(map, marker);
        }
    }
}

for (var i=0, ii=markers.length; i<ii; i++) {
    naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i));
}

</script>
</body>
</html>