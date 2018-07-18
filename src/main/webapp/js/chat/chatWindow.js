	
	var ws = null;
	// page loading되는 순간
	$(function () {
		// Server WebSocket 객체 연결
		ws = new WebSocket("ws://localhost:8001/seeadoctor/chat.do");
		
		// Server로부터 통신이 제대로 이루어졌는지 확인
		ws.onopen = function() {
			$("#chatArea").append("채팅 시작<br>")
			// 나의 sessionid
		};
		
		// Server로부터 message가 왔을 때
		// session.sendMessage(new)
		ws.onmessage = function(evt) {
			alert(evt.data);
			// evt의 data(=property)라는 객체에 message 값이 들어옴
			console.dir(evt);
			$("#chatArea").append(evt.data + "<br>");
		};
		
		ws.onclose = function() {
//			alert("close!!");
			$("#chatArea").append("채팅방 퇴장.<br>")
		};

		ws.error = function(evt) {
			alert("error!!");
			$("#chatArea").append(evt.data + "<br>");
		};
	});
	
	// Send a message to Server
//	$("#sendBtn").click(function () {
//		var $msg = $("#message");
//		// WebSocket Server로 user message 전송
//		ws.send($msg.val());
//		// messgae 초기화
//		$msg.val("");
//	});
function enter() {
	if (event.keyCode == 13) {
//		alert("entered!!");
		var $inputMsg = $("#inputMsg");
		ws.send($inputMsg.val());
	}
}










//var me = {};
////me.avatar = "https://lh6.googleusercontent.com/-lr2nyjhhjXw/AAAAAAAAAAI/AAAAAAAARmE/MdtfUmC0M4s/photo.jpg?sz=48";
//me.avatar = "http://localhost:8001/seeadoctor/images/admin/chat/me.png";
//
//var you = {};
////you.avatar = "https://a11.t26.net/taringa/avatares/9/1/2/F/7/8/Demon_King1/48x48_5C5.jpg";
//you.avatar = "http://localhost:8001/seeadoctor/images/admin/chat/you.jpg";
//
//function formatAMPM(date) {
//    var hours = date.getHours();
//    var minutes = date.getMinutes();
//    var ampm = hours >= 12 ? 'PM' : 'AM';
//    hours = hours % 12;
//    hours = hours ? hours : 12; // the hour '0' should be '12'
//    minutes = minutes < 10 ? '0'+minutes : minutes;
//    var strTime = hours + ':' + minutes + ' ' + ampm;
//    return strTime;
//}            
//
////-- No use time. It is a javaScript effect.
//function insertChat(who, text, time){
//    if (time === undefined){
//        time = 0;
//    }
//    var control = "";
//    var date = formatAMPM(new Date());
//    
//    if (who == "me"){
//        control = '<li style="width:100%">' +
//                        '<div class="msj macro">' +
////                        '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ me.avatar +'" /></div>' +
//                        '<div class="avatar"><img class="img-circle" style="width:100%;" src="../../images/admin/chat/me.png" /></div>' +
//                            '<div class="text text-l">' +
//                                '<p>'+ text +'</p>' +
//                                '<p><small>'+date+'</small></p>' +
//                            '</div>' +
//                        '</div>' +
//                    '</li>';                    
//    }else{
//        control = '<li style="width:100%;">' +
//                        '<div class="msj-rta macro">' +
//                            '<div class="text text-r">' +
//                                '<p>'+text+'</p>' +
//                                '<p><small>'+date+'</small></p>' +
//                            '</div>' +
////                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+you.avatar+'" /></div>' +                                
//                        '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="../../images/admin/chat/you.jpg" /></div>' +                                
//                  '</li>';
//    }
//    setTimeout(
//        function(){                        
//            $("ul").append(control).scrollTop($("ul").prop('scrollHeight'));
//        }, time);
//    
//}
//
//function resetChat(){
//    $("ul").empty();
//}
//
//$(".mytext").on("keydown", function(e){
//    if (e.which == 13){
//        var text = $(this).val();
//        if (text !== ""){
//            insertChat("me", text);              
//            $(this).val('');
//        }
//    }
//});
//
//$('body > div > div > div:nth-child(2) > span').click(function(){
//    $(".mytext").trigger({type: 'keydown', which: 13, keyCode: 13});
//})
//
////-- Clear Chat
//resetChat();
//
////-- Print Messages
//insertChat("me", "Hello Tom...");  
//insertChat("you", "Hi, Pablo");
//insertChat("me", "What would you like to talk about today?");
//insertChat("you", "Tell me a joke");
//insertChat("me", "Spaceman: Computer! Computer! Do we bring battery?!");
//insertChat("you", "LOL");
////insertChat("me", "Hello Tom...", 0);  
////insertChat("you", "Hi, Pablo", 1500);
////insertChat("me", "What would you like to talk about today?", 3500);
////insertChat("you", "Tell me a joke",7000);
////insertChat("me", "Spaceman: Computer! Computer! Do we bring battery?!", 9500);
////insertChat("you", "LOL", 12000);
//
//
////-- NOTE: No use time on insertChat.