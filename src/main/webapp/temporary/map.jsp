<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/map/searchinghospital.css" />
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IutEeaTAqvux8P5IXvhG&submodules=geocoder"></script>
<style>
	a:hover {
		color:inherit;
		text-decoration: none;
	}
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
	.prev {
	    background-image: url(//cdn.ddocdoc.com/_wstatic/assets/sprite-5.8.1.png);
	    background-size: 605px 604px;
	    position: absolute;
	    top: 45%;
	    margin-left: -6px;
	    margin-top: -8px;
	    background-position: -594px -61px;
	    width: 10px;
	    height: 15px;
	}
	.next {
		background-image: url(//cdn.ddocdoc.com/_wstatic/assets/sprite-5.8.1.png);
	    background-size: 605px 604px;
	    position: absolute;
	    top: 45%;
	    margin-left: -6px;
	    margin-top: -8px;
	    background-position: -594px -77px;
	    width: 10px;
	    height: 15px;
	}
	#result ul li {
		position : relative;
	}
	.circleActive {
		background-color: #308deb;
	    color: #fff;
	    cursor: default;
	    border-radius: 100%;
	    display: block;
    	width: 100%;
	}
	#paging > li {
		float: left;
	}
	#resultpage > ul > li:nth-of-type(2) {
		width: 78%;
		overflow: hidden;
	}
	#paging > li {
		width: 25px;
	}
	#paging {
		width: 600px;
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
            <div id="resultcount"><span>전체 보기</span><span id="count">0</span>개</div>
            <div id="resultlist">
                
            </div>
            <div id="resultpage">
            	<ul>
            		<li><a href="#1" class="prev"></a></li>
            		<li>
            			<ul id="paging">
            			</ul>
            		</li>
            		<li><a href="#1" class="next"></a></li>
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
let map;
let latitude;
let longitude;
let markers = [];
let pageNo = 0;

$('#paging').on('click', 'li ', function(){
	$(this).find('a').addClass("circleActive");
	pageNo = $(this).find('a').data("flag");
	hospitalList(latitude, longitude , $(this).find('a').data("flag"))
})
$("#resultpage > ul >li:nth-of-type(1)").click(function(){
	console.log("prev들어옴");
	$("#resultpage > ul >li:nth-of-type(2)").css('width',"-100px")
})

function setPageNo(count, page){
	$("#paging").empty();
	let text = '';
	var length = Math.ceil(count/10);
	console.log('카운트',count)
	console.log('길이',length);
	for(var i = 1 ; i<= length  ; i++ ){
		text += '<li><a href="#1" data-flag=' + (i-1) + ' class='+ ( ( ( ( ( page )? page: 0 ) + 1 ) === i)? 'circleActive' : '') + '>'+i+'</a></li>';
	}
	$("#paging").append(text);
}

function setLocationOnMap(){
	if(navigator.geolocation){
		console.log('위치정보 지원');
		navigator.geolocation.getCurrentPosition(getLocation);
	}else{
		console.log('위치정보 지원하지 않음');
	}
}
function getLocation(position){
	latitude = position.coords.latitude || 33.3590628;
	longitude = position.coords.longitude || 126.534361;
	let mapOptions = {center : new naver.maps.LatLng( latitude , longitude )};
	map = new naver.maps.Map('searchedmap',mapOptions);
	hospitalList(latitude , longitude);
}

window.onload = () => {
	document.querySelector('#resultaddress').style.display = 'none';
	setLocationOnMap();
}

document.addEventListener("click", function(){
	document.querySelector('#resultaddress').style.display = 'none';
	document.querySelector('#searchaddress input').value = "";
})

document.querySelector('#resultaddress ul').addEventListener('click',(e) => {
	document.querySelector('#searchaddress input').value = '';
	let address = null;
	switch(e.target.tagName){
		case 'A': address = e.target.lastChild.innerText; break;
		case 'B': address = e.target.nextElementSibling.innerText; break;
		default : address = e.target.innerText;
	}
	markers.map( item => item.setMap(null) );
	naver.maps.Service.geocode({
		address : address
	}, (status, response) => {
		if(status !== naver.maps.Service.Status.OK) return;
		let result = response.result;
		let items = result.items;
		latitude = items[0].point.y;
		longitude = items[0].point.x;
		hospitalList( latitude , longitude );
		if(items){
			latlng = new naver.maps.LatLng(items[0].point.y, items[0].point.x); 
			map.setCenter(latlng);
			marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markers.push(marker);
			var contentString = [
		        '<div class="iw_inner">',
		        '   <h3>검색한 위치</h3>',
		        '</div>'
		    ].join('');
			infoWindow = new naver.maps.InfoWindow({
		        content: ''
		    });

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
		}
	})
})

document.querySelector('#searchaddress').addEventListener('keyup', () => {
	let address = document.querySelector('#searchaddress input').value;
	if(address){
		$.ajax({
			url: "${pageContext.request.contextPath}/map/address.do",
			data : "q=" + address,
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

function hospitalList( x , y , pageNo , qd){
	console.log('pageNo',pageNo)
	$.ajax({
		url: "${pageContext.request.contextPath}/map/hospitalList.json",
		data: {qd : qd , wgs84Lat : x , wgs84Lon: y , pageNo : ((pageNo)? pageNo * 10 : 0) },
		dataType:'json'
	})
	.done( result => {
		$("#resultlist").empty();
		console.log('result  ',result)
		if(!result[0]) return;
		$('#count').text(result[0].count);
		console.log('병원 리스트 ',pageNo);
		setPageNo(result[0].count, pageNo);
		markers.filter((item,index) => index !== 0).map( item => item.setMap(null) );
		result.map( item => {
			let latlng = new naver.maps.LatLng(item.wgs84Lat, item.wgs84Lon); 
			let marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markers.push(marker);
			setHospitalList( item.dutyName , item.dutyAddr);
			var contentString = [
		        '<div class="iw_inner">',
		        '   <h3>'+item.dutyName+'</h3>',
		        '   <p>'+item.dutyName+'</p>',
		        '</div>'
		    ].join('');
			infoWindow = new naver.maps.InfoWindow({
		        content: ''
		    });

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
	})
}



function setHospitalList(name ,address){
	let content = '<div><h3>'+ name +'</h3><p>' + address + '</p></div>';
	$("#resultlist").append(content);
}


</script>
</body>
</html>