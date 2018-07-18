let map;
let latitude;
let longitude;
let markers = [];

let ws = null;
function startAlarm(){
	ws = new WebSocket('ws://localhost/seeadoctor/map/mapMain.do');
	ws.onopen = function() {
   	    console.log('웹소켓 서버 접속 성공');
    };
    // 메세지 받기
    ws.onmessage = function(evt) {
        //$("#result").prepend(evt.data + "<br>");
    };
    ws.onerror = function(evt) {
    	console.log('웹소켓 에러')
    	console.dir(evt);
   	    //$("#result").prepend('웹소켓 에러 발생 : ' + evt.data)
    };
    ws.onclose = function(evt) {
    	console.log('웹소켓 종료')
    	console.dir(evt);
   	    //$("#result").prepend("웹소켓 연결이 종료됨.");
    };
}

startAlarm();
/*(function () {
	
    var ws = new WebSocket('ws://localhost:80/seeadoctor/map/mapMain.do');
	ws.onopen = function() {
   	    console.log('웹소켓 서버 접속 성공');
    };
    // 메세지 받기
    ws.onmessage = function(evt) {
        //$("#result").prepend(evt.data + "<br>");
    };
    ws.onerror = function(evt) {
    	console.log('웹소켓 에러')
    	console.dir(evt);
   	    //$("#result").prepend('웹소켓 에러 발생 : ' + evt.data)
    };
    ws.onclose = function(evt) {
    	console.log('웹소켓 종료')
    	console.dir(evt);
   	    //$("#result").prepend("웹소켓 연결이 종료됨.");
    };
    
})();*/

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
};


$('#resultpage > ul').on('click', 'li', function(){
	if($(this).find('a').hasClass('prev')){
		if(!$(this).find('a').hasClass('disabled')){
			hospitalList(latitude , longitude , parseInt($(this).parent().find('li:nth-of-type(2) > a').text()) -10)
		}
		return;
	}
	if($(this).find('a').hasClass('next')){
		if(!$(this).find('a').hasClass('disabled')){
			hospitalList(latitude , longitude , parseInt($(this).parent().find('li:nth-of-type(11) > a').text()) + 1)
		}
		return;
	}
	$(this).find('a').addClass("circleActive");
	let pageNo = $(this).find('a').text();
	hospitalList(latitude, longitude , pageNo)
})

function setPageNo(page, currentPage){
	$("#resultpage > ul").empty();
	let text = '<li><a href="#1" class="prev ' + ( !page.prev ? 'disabled' : '') + '"></a></li>';
	for(var i = page.beginTab ; i <= page.endTab  ; i++ ){
		text += '<li><a href="#1" data-flag=' + i + ' class='+ ( page.currentTab === i ? 'circleActive' : '') + '>'+i+'</a></li>';
	}
	text += '<li><a href="#1" class="next ' + ( !page.next ? 'disabled' : '') + '"></a></li>';
	$("#resultpage > ul").append(text);
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
	hospitalList(latitude , longitude,1);
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
		hospitalList( latitude , longitude , 1 );
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
			url: getContextPath() + "/map/address.do",
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
	$.ajax({
		url: getContextPath() + "/map/hospitalList.json",
		data: {qd : qd , wgs84Lat : x , wgs84Lon: y , pageNo : pageNo },
		dataType:'json'
	})
	.done( result => {
		$("#resultlist").empty();
		if(!result) return;
		$('#count').text(result.page.count);
		setPageNo(result.page, pageNo);
		markers.filter((item,index) => index !== 0).map( item => item.setMap(null) );
		result.list.map( item => {
			let latlng = new naver.maps.LatLng(item.wgs84Lat, item.wgs84Lon); 
			let marker = new naver.maps.Marker({
			    position: latlng,
			    map: map
			});
			markers.push(marker);
			setHospitalList( item.dutyName , item.dutyAddr);
			var contentString = [
		        '<div class="iw_inner">',
		        '   <h3><a href="',
		        getContextPath(),
		        '/hospital/about.do?hospitalSeq='+ item.hospitalSeq + '">',
		        item.dutyName,
		        '</a></h3>',
		        '   <p>'+item.dutyAddr+'</p>',
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