let ws = null;
function startAlarm(){
	ws = new WebSocket('ws://localhost/seeadoctor/notification.do');
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
    		for(let i = 0 ; i < alarm.length ; i++){
    			text += '<div class="notif"><p><span>' + alarm[i].sendId + '</span>님이 채팅을 보냈습니다.</p></div>';
    		}
    		$("#notifList").append(text);
    		$("#notification, #notifCount").animate({"left":"-=5"},100).animate({"left":"+=10"},100).animate({"left":"-=5"},100);
    	}catch(e){
    		alarm = evt.data;
    		$("#notifCount").text(parseInt($("#notifCount").text()) + 1);
    		let text = "<div class='notif'><p><span>" + alarm + '</span>님이 채팅을 보냈습니다</p></div>';
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
	console.log("알림 실행중")
	if($("#notifCount").text() != 0){
		$("#notifList").toggle();
	}
});

$(document).on("click",".xIcon",function(){
	$(this).parent().animate({"opacity":0, "height": 0 }, "slow" ,function(){
		$(this).remove();
	});
})
$(document).on('click','#userOut',function(){
	console.log("로그아웃중...");
	ws.send("logout");
})