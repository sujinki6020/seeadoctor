let ws = null;
function startAlarm(){
	ws = new WebSocket('ws://localhost/seeadoctor/notification.do');
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
$("#mainMenu > li").click(function(){
	ws.send("웹소켓 이벤트 발생중");
})