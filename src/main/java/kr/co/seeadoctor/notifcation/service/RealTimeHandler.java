package kr.co.seeadoctor.notifcation.service;


import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.seeadoctor.repository.mapper.NotificationMapper;
import kr.co.seeadoctor.repository.vo.User;

@Component("realTime")
public class RealTimeHandler extends TextWebSocketHandler  {
	
	@Autowired 
	private NotificationMapper mapper;
	
	private Map<String , WebSocketSession> connectedUser = new HashMap<>();
	
	public RealTimeHandler() {
		System.out.println(this.getClass().getSimpleName() + "실행중");
	}

	// 사용자와 통신이 이루에 졌을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		if(session.getAttributes().get("user")!=null) {
			User user = (User)session.getAttributes().get("user");
			System.out.println(user.getId() + "님이 접속하셨습니다.");
			connectedUser.put(user.getId(), session);
		}
	}
	// 데이터가 왔을때 호출된다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		User user = (User)session.getAttributes().get("user");
		System.out.println("보낸 아이디 : " + user.getId());
		System.out.println("보낸 메서지 : " + message.getPayload());
		
		String rcvMsg = message.getPayload();
		String sendMsg = "";
//		if (rcvMsg.startsWith("login:")) {
//			String id = rcvMsg.substring("login:".length());
//			connectedUser.put(id, session);
//			sendMsg = id + "님이 로그인하였습니다.";
//		}
//		else if (rcvMsg.startsWith("logout:")) {
//			String id = rcvMsg.substring("logout:".length());
//			connectedUser.remove(id);
//			sendMsg = id + "님이 로그아웃하였습니다.";
//		}
//		else {
//			String[] arr = rcvMsg.split(":");
//			sendMsg = arr[0] + " : " + arr[1];
//		}
		
		System.out.println("sendMsg : " + sendMsg);
		System.out.println("users : " + connectedUser);

//		Set<String> keys = connectedUser.keySet();
//		for (String key : keys) {
//			WebSocketSession wSession = connectedUser.get(key);
//			wSession.sendMessage(new TextMessage(sendMsg));
//		}
		session.sendMessage(new TextMessage(rcvMsg));
	}

	// 종료 되었을때 할 것 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if(session.getAttributes().get("user") != null) {
			User user = (User)session.getAttributes().get("user");
			System.out.println(user.getId() + "님이 접속 종료 하셨습니다.");
			connectedUser.remove(user.getId());
		}
	}


	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "익셥션 발생" + exception.getMessage());
	}
	
}
