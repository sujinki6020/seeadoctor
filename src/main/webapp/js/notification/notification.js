let ws = null;
function startAlarm(){
	ws = new WebSocket('ws://192.168.10.66/seeadoctor/notification.do');
	ws.onopen = function() {
   	    console.log('웹소켓 서버 접속 성공');
   	    ws.send("login");
    };
    // 메세지 받기
    ws.onmessage = function(evt) {
        //$("#result").prepend(evt.data + "<br>");
    	console.log("메세지 데이터", evt.data);
    	var alarm = "";
    	try{
    		alarm = JSON.parse(evt.data);
    		$("#notifCount").text(alarm.length);
    		let text = "";
    		// 1: 예약 , 2: 예약 취소  , 3:채팅
    		for(let i = 0 ; i < alarm.length ; i++){
    			text += setCss(alarm[i].eventType, alarm[i].sendId);
    		}
    		console.log('텍스트1',text);
    		$("#notifList").append(text);
    		$("#notification, #notifCount").animate({"left":"-=5"},100).animate({"left":"+=10"},100).animate({"left":"-=5"},100);
    	} catch(e){
    		alarm = evt.data;
    		var pureData = alarm.split(":");
    		var id = pureData[0];
    		var css = pureData[1];
    		$("#notifCount").text(parseInt($("#notifCount").text()) + 1);
    		let text = setCss(css, id);
    		console.log('텍스트2',text);
    		$("#notifList").append(text);
    		$("#notification, #notifCount").animate({"left":"-=5"},100).animate({"left":"+=10"},100).animate({"left":"-=5"},100);
    	}
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

$(document).on("click","#notification",function(){
	console.log("알림 실행중");
	console.log("카운트",$("#notifCount").text());
	if($("#notifCount").text()){
		$("#notifList").toggle();
		console.log('알림 리스트',$("#notifList"));
	}
});

$(document).on("click",".xIcon",function(){
	$(this).parent().animate({"opacity":0, "height": 0 }, "slow" ,function(){
		$("#notifCount").text(parseInt($("#notifCount").text()) - 1);
		$(this).remove();
	});
})
$(document).on('click','#userOut',function(){
	console.log("로그아웃중...");
	ws.send("logout");
})

function setCss(css ,id){
	var cssText ="";
	switch(css){
	case "1":
		cssText += '<div class="notif success"><div class="successIcon"></div><div class="xIcon"></div>'+
		'<p><span>'+ id + '</span>님이 예약을 했습니다.</p></div>';
		break;
	case "2":
		cssText += '<div class="notif danger"><div class="cancelIcon"></div>'+
		'<div class="xIcon"></div><p><span>'+ id + '</span>님이 예약을 취소했습니다.</p></div>';
		break;
	case "3":
		cssText += '<div class="notif info"><div class="infoIcon"></div><div class="xIcon"></div>'+
		'<p><span>'+ id + '</span>님이 채팅을 보냈습니다.</p></div>';
		break;
	case "4":
		cssText += '<div class="notif warning"><div class="questionIcon"></div><div class="xIcon"></div>'+
		'<p><span>'+ id + '</span>님이 리뷰를 등록했습니다.</p></div>';
		break;		
	}
	return cssText;
}