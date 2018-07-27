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
var HOME_PATH = window.HOME_PATH || '.';
var infowindow = new naver.maps.InfoWindow();
var latitude = null;
var longitude = null;
// ------ 처음 검색한 위치의 마커 저장하는 배열
var connectedMarker = [];
// ------ 처음 검색한 위치의 인포를 저장하는 배열
var connectedInfo = [];

var MARKER_ICON_URL = 'http://localhost/seeadoctor/images/map/placeholder.png';
var MARKER_HIGHLIGHT_ICON_URL = 'http://localhost/seeadoctor/images/map/pin.png';
var markers = [],
    infoWindows = [];
var hospitalMarker = [];


// ---------- 처음에 맵을 생성하는 것 
var map = new naver.maps.Map('searchedmap', {
    center: new naver.maps.LatLng(latitude || 37.5666805, longitude || 126.9784147),
    zoom: 11,
    mapTypeId: naver.maps.MapTypeId.NORMAL
});
// --------- 맵을 클릭했을때 인포창이 떠있으면 닫게 하는 함수 
naver.maps.Event.addListener( map , 'click', function(){
	connectedInfo.map(function(item){item.close()})
	infoWindows.map(function(item){item.close()})
} );
// ----------- 지오로케이션이 작동할때 되는 함수
function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;
    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(12); // 지도의 줌 레벨을 변경합니다.
    console.log('Coordinates: ' + location.toString());
    setConnectedMarker(latitude, longitude);
}
// ------------- 문서가 로드 되고 나서 실행될 함수
$(window).on("load", function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation);
    } else {
        var center = map.getCenter();
        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
        infowindow.open(map, center);
    }
});


// ------------- 처음 검색한 위치를 맵에 고정시키고 마커 및 인포창을 set하는 함수
function setConnectedMarker(latitude, longitude , dutyName){
	connectedMarker.map(function(item){item.setMap(null)});
	connectedInfo.map(function(item){item.close()});
	
	let latlng = new naver.maps.LatLng(latitude, longitude); 
	map.setCenter(latlng);
	console.log("latlng",latlng)
	let imageMarker = new naver.maps.Marker({
	    position: latlng,
	    map: map,
	    title: 'imageMarker',
	    icon: "http://localhost/seeadoctor/images/map/searchedPin.png",
	    animation: naver.maps.Animation.BOUNCE
	});
	console.log("병원이름",dutyName);
	if(dutyName){
		$.ajax({
			url : getContextPath() + "/map/seachHospital.do",
			data : "dutyName="+dutyName,
			dataType : "json"
		}).done(function(result){
			if(!result) return; 
			connectedMarker.map(function(item){item.setMap(null)});
			connectedInfo.map(function(item){item.close()});
			let contentString = [
				'<div class="hospiDetailBox">',
				'<ul>',
				'<li><span><a href="',
				getContextPath(),
				'/hospital/about.do?hospitalSeq='+ result.hospitalSeq + '">',
				result.dutyName,
				 '</a><span class="hospikind">',
				 result.dutyDivNam,
				 '</span></span></li>',
				 '<li>월요일 : ' + nullCheck(result.dutyTime1s) + '~' + nullCheck(result.dutyTime1c) + '</li>',
				 '<li>화요일 : ' + nullCheck(result.dutyTime2s) + '~' + nullCheck(result.dutyTime2c) + '</li>',
				 '<li>수요일 : ' + nullCheck(result.dutyTime3s) + '~' + nullCheck(result.dutyTime3c) + '</li>',
				 '<li>목요일 : ' + nullCheck(result.dutyTime4s) + '~' + nullCheck(result.dutyTime4c) + '</li>',
				 '<li>금요일 : ' + nullCheck(result.dutyTime5s) + '~' + nullCheck(result.dutyTime5c) + '</li>',
				 '<li>토요일 : ' + nullCheck(result.dutyTime6s) + '~' + nullCheck(result.dutyTime6c) + '</li>',
				 '<li>일요일 : ' + nullCheck(result.dutyTime7s) + '~' + nullCheck(result.dutyTime7c) + '</li>',
				 '<li>공휴일 : ' + nullCheck(result.dutyTime8s) + '~' + nullCheck(result.dutyTime8c) + '</li>',
				 '<li>전화번호: ' + nullCheck(result.dutyTel1) + '</li>',
				 '<ul>',
				 '</div>'
			].join('');
			let infoWindow = new naver.maps.InfoWindow({
		        content: contentString
		    });
			naver.maps.Event.addListener(imageMarker, 'click', function(){
				if (infoWindow.getMap()) {
		            infoWindow.close();
		        } else {
		            infoWindow.open(map, imageMarker);
		        }
			});
			connectedMarker.push(imageMarker);
			connectedInfo.push(infoWindow);
			getAllHospital(latitude , longitude);
		})
		.fail(function(){
			let infoWindow = new naver.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:10px;">검색한 위치</div>'
		    });
			naver.maps.Event.addListener(imageMarker, 'click', function(){
				if (infoWindow.getMap()) {
		            infoWindow.close();
		        } else {
		            infoWindow.open(map, imageMarker);
		        }
			});
			connectedMarker.push(imageMarker);
			connectedInfo.push(infoWindow);
			getAllHospital(latitude , longitude);
		})
	}else {
		let infoWindow = new naver.maps.InfoWindow({
	        content: '<div style="width:150px;text-align:center;padding:10px;">접속한 위치</div>'
	    });
		naver.maps.Event.addListener(imageMarker, 'click', function(){
			if (infoWindow.getMap()) {
	            infoWindow.close();
	        } else {
	            infoWindow.open(map, imageMarker);
	        }
		});
		connectedMarker.push(imageMarker);
		connectedInfo.push(infoWindow);
		getAllHospital(latitude , longitude);
	}
}



// --------------------------------------- 조장이 만든 함수   ---------------------------------------------------
// ------------ contextPath를 대신 하는 함수
function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};
// -------------- 페이지를 클릭했을때 주소 검색창의 결과를 닫는 함수
$(document).click(function(){
	$("#resultaddress").hide();
	$("#searchaddress input").val("");
})

// ------ 상세주소 결과를 눌렀을때 담을 주소이름 변수 
var dutyName = "";        
// -------- 주소창에서 키업했을때 값으로 상세주소를 찾는 함수
$("#searchaddress").keyup(function(){
	var address = $(this).children("input").val();
	if(address){
		$.ajax({
			url: getContextPath() + "/map/address.do",
			data : "q=" + address,
			dataType : "json"
		})
		.done(function(result){
			$("#resultaddress ul").empty();
			$("#resultaddress").show();
			if(!result.items) return;
			result.items.map(function(item){
				$("#resultaddress ul").append("<li><a href='#1'><span>"+ item.title +"</span>&nbsp<span>"+ item.roadAddress + "</span></a></li>")
			})
		})
	}
})
// ------------- 검색한 후 나온 주소를 클릭 할때 작동하는 함수
$("#resultaddress ul").on("click","li",function(){
	$("#searchaddress input").val("");
	var searching = $(this).find("span:eq(1)").text();
	dutyName = $(this).find("span:eq(0)").text();
	naver.maps.Service.geocode({address: searching}, function(status, response) {
		if (status !== naver.maps.Service.Status.OK) {
			return alert('Something wrong!');
		}
		var result = response.result, // 검색 결과의 컨테이너
		items = result.items; // 검색 결과의 배열
		if(items){
			setConnectedMarker(items[0].point.y,  items[0].point.x , dutyName);
		}
	});
})
// -------- 들어온 텍스트가 null 인지 아닌지 판별하는 함수
function nullCheck(text){
	return text? text : '운영안함';
}
function getAllHospital( x , y ){
	$.ajax({
		url: getContextPath() + "/map/AllHospital.json",
		data: {wgs84Lat : x , wgs84Lon: y},
		dataType:'json'
	}).done(function(result){
		console.log(result);
		latitude = x;
		longitude = y;
		for(var key in hospitalMarker){
			let hospitalInfo = hospitalMarker[key];
			for(var info in hospitalInfo){
				hospitalInfo[info][0].setMap(null)
				hospitalInfo[info][0].setAnimation(null);
				hospitalInfo[info][0].setIcon('http://localhost/seeadoctor/images/map/pin.png');
			}
		}
		hospitalMarker = [];
		result.map(function(item){
			let position = new naver.maps.LatLng(item.wgs84Lat, item.wgs84Lon);

		    let marker = new naver.maps.Marker({
		        map: map,
		        position: position,
		        icon: 'http://localhost/seeadoctor/images/map/pin.png'
		    });
		    let contentString = [
				'<div class="hospiDetailBox">',
				'<ul>',
				'<li><span><a href="',
				getContextPath(),
				'/hospital/about.do?hospitalSeq='+ item.hospitalSeq + '">',
				item.dutyName,
				 '</a><span class="hospikind">',
				 item.dutyDivNam,
				 '</span></span></li>',
				 '<li>월요일 : ' + nullCheck(item.dutyTime1s) + '~' + nullCheck(item.dutyTime1c) + '</li>',
				 '<li>화요일 : ' + nullCheck(item.dutyTime2s) + '~' + nullCheck(item.dutyTime2c) + '</li>',
				 '<li>수요일 : ' + nullCheck(item.dutyTime3s) + '~' + nullCheck(item.dutyTime3c) + '</li>',
				 '<li>목요일 : ' + nullCheck(item.dutyTime4s) + '~' + nullCheck(item.dutyTime4c) + '</li>',
				 '<li>금요일 : ' + nullCheck(item.dutyTime5s) + '~' + nullCheck(item.dutyTime5c) + '</li>',
				 '<li>토요일 : ' + nullCheck(item.dutyTime6s) + '~' + nullCheck(item.dutyTime6c) + '</li>',
				 '<li>일요일 : ' + nullCheck(item.dutyTime7s) + '~' + nullCheck(item.dutyTime7c) + '</li>',
				 '<li>공휴일 : ' + nullCheck(item.dutyTime8s) + '~' + nullCheck(item.dutyTime8c) + '</li>',
				 '<li>전화번호: ' + nullCheck(item.dutyTel1) + '</li>',
				 '<ul>',
				 '</div>'
			].join('');
			let infoWindow = new naver.maps.InfoWindow({
		        content: contentString
		    });
			let hospital = { [item.dutyName] : [marker , infoWindow ] };
			hospitalMarker.push(hospital);
		    markers.push(marker);
		    infoWindows.push(infoWindow);
		});
		for (let i=0, k=markers.length; i<k; i++) {
	        naver.maps.Event.addListener(markers[i], 'click', function(){
	        	let marker = markers[i];
	            let infoWindow = infoWindows[i];
		        if (infoWindow.getMap()) {
		            infoWindow.close();
		        } else {
		            infoWindow.open(map, marker);
		        }
	        });
	    }
		hospitalList(x , y , 1 );
	})
}

function hospitalList( x , y , pageNo , qd){
	$.ajax({
		url: getContextPath() + "/map/hospitalList.json",
		data: {qd : qd , wgs84Lat : x , wgs84Lon: y , pageNo : pageNo },
		dataType:'json'
	})
	.done(function(result){
		$("#resultlist").empty();
		if(!result) return;
		$('#count').text(result.page.count);
		console.log("list", result.list.length);
		if(!result.list.length){
			setPageNo(result.page, pageNo);
			setHospitalList( "검색결과가 존재하지 않습니다." , "다시 검색해주세요");
			for(var key in hospitalMarker){
				let hospitalInfo = hospitalMarker[key];
				for(var info in hospitalInfo){
					hospitalInfo[info][0].setAnimation(null);
					hospitalInfo[info][0].setIcon('http://localhost/seeadoctor/images/map/pin.png');
				}
			}
			return;
		}
		setPageNo(result.page, pageNo);
		for(var key in hospitalMarker){
			let hospitalInfo = hospitalMarker[key];
			for(var info in hospitalInfo){
				hospitalInfo[info][0].setAnimation(null);
				hospitalInfo[info][0].setIcon('http://localhost/seeadoctor/images/map/pin.png');
			}
		}
		result.list.map( function(item,index){
			for(var key in hospitalMarker){
				let hospitalInfo = hospitalMarker[key];
				for(var info in hospitalInfo){
					if(info == item.dutyName){
						hospitalInfo[info][0].setAnimation(null);
						hospitalInfo[info][0].setIcon('http://localhost/seeadoctor/images/map/placeholder.png');
					}
				}
			}
			setHospitalList(item.dutyName, item.dutyAddr, item.dutyName);
		})
		
	})
}
// ---------------- 병원 목록 을 생성하는 함수 
function setHospitalList(name ,address, index){
	let content = '<div><h3 data-flag="' + index +'">'+ name +'</h3><p>' + address + '</p></div>';
	$("#resultlist").append(content);
}
// ---------------- 페이지 수를 생성하는 함수
function setPageNo(page, currentPage){
	$("#resultpage > ul").empty();
	let text = '<li><a href="#1" class="prev ' + ( !page.prev ? 'disabled' : '') + '"></a></li>';
	for(var i = page.beginTab ; i <= page.endTab  ; i++ ){
		text += '<li><a href="#1" data-flag=' + i + ' class='+ ( page.currentTab === i ? 'circleActive' : '') + '>'+i+'</a></li>';
	}
	text += '<li><a href="#1" class="next ' + ( !page.next ? 'disabled' : '') + '"></a></li>';
	$("#resultpage > ul").append(text);
}

$("#search").click(function(){
	$("#categorybox").toggle();
	$("#resultlist").toggle();
})
$("#category > li >  a").click(function(){
	$("#hospiDept").text($(this).text());
	hospitalList( latitude , longitude , 1 , $(this).text());
	$("#categorybox").toggle();
	$("#resultlist").toggle();
})
$("#resultlist").on("click","div",function(){
	let that = $(this);
	let hospName = $(this).find('h3').text();
	let hospIndex = $(this).find('h3').data("flag");
	for(var key in hospitalMarker){
		let hospitalInfo = hospitalMarker[key];
		for(var info in hospitalInfo){
			if(info == hospName){
				hospitalInfo[info][1].open(map, hospitalInfo[info][0]);
			}
		}
	}
})

$('#resultpage > ul').on('click', 'li', function(){
	if($(this).find('a').hasClass('prev')){
		if(!$(this).find('a').hasClass('disabled')){
			hospitalList(latitude , longitude , parseInt($(this).parent().find('li:nth-of-type(2) > a').text()) -10, $("#hospiDept").text() )
		}
		return;
	}
	if($(this).find('a').hasClass('next')){
		if(!$(this).find('a').hasClass('disabled')){
			hospitalList(latitude , longitude , parseInt($(this).parent().find('li:nth-of-type(11) > a').text()) + 1 , $("#hospiDept").text() )
		}
		return;
	}
	$(this).find('a').addClass("circleActive");
	let pageNo = $(this).find('a').text();
	infoWindows.map(function(item){item.close()});
	console.log("위 경도", latitude, longitude ,"페이지 번호", pageNo , '과 ' ,$("#hospiDept").text() )
	hospitalList(latitude, longitude , pageNo , $("#hospiDept").text())
})
</script>
</body>
</html>