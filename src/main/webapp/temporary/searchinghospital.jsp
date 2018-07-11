<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/searchinghospital/searchinghospital.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IutEeaTAqvux8P5IXvhG&submodules=geocoder"></script>
<style>
	#searchaddress {
		position: relative;
	}
	#resultaddress {
		z-index : 1;
		position: absolute;
		background-color: white;
		width: 100%;
		height: auto;
		box-sizing: border-box;
	}
	#resultaddress ul li {
		font-size: 1.5em;
		height:40px;
		line-height : 40px;
		padding-left: 20px;
    	padding-right: 20px;
    	border-bottom: 1px solid #d7d7d7;
    	box-sizing: border-box;
	}
	#resultaddress ul li:nth-of-type(1) {
		border-top :  1px solid #d7d7d7;
	}
</style>
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
            <div id="resultcount"><span>현 지도 내에 71077건 검색되었습니다.</span></div>
            <div id="resultlist">
                
            </div>
            <div id="resultpage">
                <ul>
                    <li><a href="#1">prev</a></li>
                    <li><a href="#1">1</a></li>
                    <li><a href="#1">2</a></li>
                    <li><a href="#1">3</a></li>
                    <li><a href="#1">4</a></li>
                    <li><a href="#1">5</a></li>
                    <li><a href="#1">6</a></li>
                    <li><a href="#1">next</a></li>
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
<script>
var map;
var marker;
var latlng;
var markerArr = [];
$(getMyLocation); 
$("#resultaddress").hide();
$(document).click(function(){
	$("#resultaddress").hide();
	$("#searchaddress input").val("");
})


function getMyLocation() {
	// 위치정보 지원 여부 확인
	if (navigator.geolocation) {
		console.log("위치정보 지원함");
		navigator.geolocation.getCurrentPosition(displayLocation);
		
	}
	else {
		console.log("위치정보 지원하지 않음")
	}
}

// 위치정보 조회 성공시 호출 콜백함수
function displayLocation(position) {
	// 위도 
	var latitude = position.coords.latitude;
	// 경도
	var longitude = position.coords.longitude;
	
	var mapOptions = {
		    center: new naver.maps.LatLng(latitude || 33.3590628 , longitude || 126.534361),
		    zoom: 10
		};

	map = new naver.maps.Map('searchedmap', mapOptions);
	latlng = new naver.maps.LatLng(latitude || 33.3590628 , longitude || 126.534361); 
	marker = new naver.maps.Marker({
	    position: latlng,
	    map: map
	});
	markerArr.push(marker);
	initGeocoder();
}


$("#resultaddress ul").on("click","li",function(){
	$("#searchaddress input").val("");
	var that = $(this);
	markerArr.map(function(item){
		item.setMap(null);
	})
	naver.maps.Service.geocode({
        address: that.find("span").text()
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            console.log('잘못된 입력');
            return;
        }
        var result = response.result, // 검색 결과의 컨테이너
            items = result.items; // 검색 결과의 배열
        // do Something
        if(items){
	        latlng = new naver.maps.LatLng(items[0].point.y, items[0].point.x); 
	        console.log('지도',latlng)
			map.setCenter(latlng);
			marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markerArr.push(marker);
        }
    });
})


	
$("#searchaddress").keyup(function(){
	if($("#searchaddress input").val()){
		$.ajax({
			url: "${pageContext.request.contextPath}/map/address.do",
			data : "q=" + $("#searchaddress input").val(),
			dataType : "json"
		})
		.done(function(result){
			$("#resultaddress ul").empty();
			$("#resultaddress").show();
			result.items.map(function(item){
				$("#resultaddress ul").append("<li><a href='#1'>"+ item.title +"&nbsp<span>"+ item.roadAddress + "</span></a></li>")
			})
		})
	}		
})

function initGeocoder() {
    var latlng = map.getCenter();
    infoWindow = new naver.maps.InfoWindow({
        content: ''
    });
    getHospital(latlng.x , latlng.y);
	
    map.addListener('click', function(e) {
        latlng = e.coord;
        console.log('위경도',latlng);
        getHospital(latlng.x, latlng.y);
        infoWindow.setContent([
            '<div style="padding:10px;width:300px;font-size:14px;line-height:20px;">',
            '<strong>LatLng</strong> : '+ latlng +'<br />',
            '</div>'
        ].join(''));
        infoWindow.open(map, latlng);
    });
}

function getHospital(x,y){
	$.ajax({
		url : "${pageContext.request.contextPath}/map/position.do",
		data : "latitude="+ y +"&longitude="+ x,
		dataType: 'text'
	})
	.done(function(result){
		var xmlDoc = $.parseXML(result);
		var $xml = $(xmlDoc);
		var $items = $xml.find( "item" );
		removeMarker();
		$("#resultlist").empty();
		$items.map(function(item ,index){
			console.log('아이템',item ,'인덱스', index);
			console.log($(index).find("dutyName").text())
			console.log($(index).find("dutyAddr").text())
			console.log($(index).find("dutyDiv").text())
			console.log($(index).find("dutyDivName").text())
			console.log($(index).find("latitude").text())
			console.log($(index).find("longitude").text())
			
			latlng = new naver.maps.LatLng($(index).find("latitude").text(), $(index).find("longitude").text()); 
			let marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markerArr.push(marker);
			setHospitalList( $(index).find("dutyName").text() , $(index).find("dutyAddr").text() , $(index).find("dutyDivName").text());
			var contentString = [
		        '<div class="iw_inner">',
		        '   <h3>'+$(index).find("dutyName").text()+'</h3>',
		        '   <p>'+$(index).find("dutyAddr").text()+'</p>',
		        '</div>'
		    ].join('');

			var infowindow = new naver.maps.InfoWindow({
			    content: contentString
			});
	
			naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindow.open(map, marker);
			    }
			});
		})
	});
}	
function removeMarker(){
	markerArr.map(function(item){
		item.setMap(null);
	})
}
function setHospitalList(name ,address, deptName){
	let content = '<div><h3>'+ name +'&nbsp<span>' + deptName +'</span></h3><p>' + address + '</p></div>';
	$("#resultlist").append(content);
}

</script>
</body>
</html>