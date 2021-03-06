let map;
let latitude;
let longitude;
let markers = [];
let currentPosition = [];
let infowindowArr = [];

//function getContextPath() {
//	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
//	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
//};


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
	infowindowArr.map(item => item.close());
	hospitalList(latitude, longitude , pageNo , $("#hospiDept").text())
})

//function setPageNo(page, currentPage){
//	$("#resultpage > ul").empty();
//	let text = '<li><a href="#1" class="prev ' + ( !page.prev ? 'disabled' : '') + '"></a></li>';
//	for(var i = page.beginTab ; i <= page.endTab  ; i++ ){
//		text += '<li><a href="#1" data-flag=' + i + ' class='+ ( page.currentTab === i ? 'circleActive' : '') + '>'+i+'</a></li>';
//	}
//	text += '<li><a href="#1" class="next ' + ( !page.next ? 'disabled' : '') + '"></a></li>';
//	$("#resultpage > ul").append(text);
//}

//function setLocationOnMap(){
//	if(navigator.geolocation){
//		console.log('위치정보 지원');
//		navigator.geolocation.getCurrentPosition(getLocation);
//	}else{
//		console.log('위치정보 지원하지 않음');
//	}
//}
function getLocation(position){
//	latitude = position.coords.latitude || 33.3590628;
//	longitude = position.coords.longitude || 126.534361;
//	let mapOptions = {center : new naver.maps.LatLng( latitude , longitude )};
//	map = new naver.maps.Map('searchedmap',mapOptions);
//	var nowPosition = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(37.3595704, 127.105399),
//	    map: map
//	});
//	currentPosition.push(nowPosition);
	hospitalList(latitude , longitude,1);
}

//window.onload = () => {
//	document.querySelector('#resultaddress').style.display = 'none';
//	setLocationOnMap();
//}

//document.addEventListener("click", function(){
//	document.querySelector('#resultaddress').style.display = 'none';
//	document.querySelector('#searchaddress input').value = "";
//})

//document.querySelector('#resultaddress ul').addEventListener('click',(e) => {
//	document.querySelector('#searchaddress input').value = '';
//	let address = null;
//	switch(e.target.tagName){
//		case 'A': address = e.target.lastChild.innerText; break;
//		case 'B': address = e.target.nextElementSibling.innerText; break;
//		default : address = e.target.innerText;
//	}
//	markers.map( item => item.setMap(null) );
//	naver.maps.Service.geocode({
//		address : address
//	}, (status, response) => {
//		if(status !== naver.maps.Service.Status.OK) return;
//		let result = response.result;
//		let items = result.items;
//		latitude = items[0].point.y;
//		longitude = items[0].point.x;
//		hospitalList( latitude , longitude , 1 );
//		if(items){
//			latlng = new naver.maps.LatLng(items[0].point.y, items[0].point.x); 
//			map.setCenter(latlng);
//			let marker = new naver.maps.Marker({
//			    position: latlng,
//			    map: map
//			});
//			markers.push(marker);
//			let contentString = [
//		        '<div class="iw_inner">',
//		        '   <h3>검색한 위치</h3>',
//		        '</div>'
//		    ].join('');
//
//			let infowindow = new naver.maps.InfoWindow({
//			    content: contentString
//			});
//	
//			naver.maps.Event.addListener(marker, "click", function(e) {
//			    if (infowindow.getMap()) {
//			        infowindow.close();
//			    } else {
//			        infowindow.open(map, marker);
//			    }
//			});
//		}
//	})
//})

//document.querySelector('#searchaddress').addEventListener('keyup', () => {
//	let address = document.querySelector('#searchaddress input').value;
//	if(address){
//		$.ajax({
//			url: getContextPath() + "/map/address.do",
//			data : "q=" + address,
//			dataType : "json"
//		})
//		.done(function(result){
//			$("#resultaddress ul").empty();
//			$("#resultaddress").show();
//			result.items.map(function(item){
//				$("#resultaddress ul").append("<li><a href='#1'>"+ item.title +"&nbsp<span>"+ item.roadAddress + "</span></a></li>")
//			})
//		})
//	}
//})

function hospitalList( x , y , pageNo , qd){
	$.ajax({
		url: getContextPath() + "/map/hospitalList.json",
		data: {qd : qd , wgs84Lat : x , wgs84Lon: y , pageNo : pageNo },
		dataType:'json'
	})
	.done( result => {
		$("#resultlist").empty();
		if(!result) return;
		$('#count').text(result.page.count);
		markers.map( item => item.setMap(null) );
		console.log("list", result.list.length);
		if(!result.list.length){
			setPageNo(result.page, pageNo);
			setHospitalList( "검색결과가 존재하지 않습니다." , "다시 검색해주세요");
			return;
		}
		infowindowArr = [];
		markers = [];
		setPageNo(result.page, pageNo);
		result.list.map( (item,index) => {
			let latlng = new naver.maps.LatLng(item.wgs84Lat, item.wgs84Lon); 
			let marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markers.push(marker);
			setHospitalList( item.dutyName , item.dutyAddr, index );
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
		        content: ''
		    });
			
			infowindow = new naver.maps.InfoWindow({
			    content: contentString
			});
			infowindowArr.push(infowindow);
			naver.maps.Event.addListener(marker, "click", function(e) {
			    if (infowindow.getMap()) {
			        infowindow.close();
			    } else {
			        infowindowArr[index].open(map, marker);
			    }
			});
		})
	})
}
//function nullCheck(text){
//	return text? text : '운영안함';
//}


function setHospitalList(name ,address, index){
	let content = '<div><h3 data-flag="' + index +'">'+ name +'</h3><p>' + address + '</p></div>';
	$("#resultlist").append(content);
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
	let hospMarker = markers[hospIndex];
	infowindowArr[hospIndex].open(map, hospMarker);
})