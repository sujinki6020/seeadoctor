	
	var websocket = null;
	
	function connect() {
		websocket = new WebSocket("ws://localhost:8001/seeadoctor/chat.do");
		
		websocket.onopen = function() {
//			console.log("websocket onopen()!");
			$("#chatArea").append("채팅이 시작됩니다.<br>");
//			websocket.send("상대방아이디:connect" );
		};
		
		// 상대방이 보낸 메세지를 받음
		websocket.onmessage = function(evt) {
			var data = evt.data.split(":");
			var sendId = data[0];
			var msg = data[1];
			appendMessage(msg);
		};
		
		websocket.onclose = function() {
			$("#chatArea").append("채팅방 퇴장.<br>")
		};
	}
	
	connect();
	
	function send() {
		var msg = $("#message").val();
		var time = getTime();
		$("#chatArea").append("<p class='me'>" + msg + "<br>" + time + "</p><br>");
		var rcvId = $("#rcvId").val();
		msg = rcvId + ":" + msg;
		websocket.send(msg);
		$("#message").remove();
		$("#rcvId").before('<textarea rows="4" cols="40" id="message" placeholder="Type a message"></textarea>');
		
	};
	
	function getTime() {
		var d = new Date();
		var s = leadingZeros(d.getFullYear(), 4) + '-' + 	
				leadingZeros(d.getMonth()+1, 2) + '-' + 	
				leadingZeros(d.getDate(), 2) + '-' + 	

				leadingZeros(d.getHours(), 2) + ':' + 	
				leadingZeros(d.getMinutes(), 2) + ':' + 	
				leadingZeros(d.getSeconds(), 2);
		
		return s;
	}
	
	function leadingZeros(n, digits) {
		var zero = "";
		n = n.toString();
		
		if(n.length < digits) {
			for (i=0; i<digits-n.length; i++) {
				zero += "0";
			}
		}
		return zero + n;
	}
	
	function appendMessage(msg) {
		if(msg=="") {
			return false;
		} else {
			
			var time = getTime();
			$("#chatArea").append("<p class='them'>" + msg + "<br>" + time + "</p><br>");
		}
	};
	
	$(document).on("keydown", "#message", function (event) {
		if(event.keyCode == 13){
			send();
		}
	});
