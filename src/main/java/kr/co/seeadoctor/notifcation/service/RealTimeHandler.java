package kr.co.seeadoctor.notifcation.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.seeadoctor.repository.mapper.NotificationMapper;
import kr.co.seeadoctor.repository.vo.Notification;

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
		System.out.println(session.getId()+ "님이 접속하셨습니다.");
		connectedUser.put(session.getId(), session);
		
	}
	// 데이터가 왔을때 호출된다.
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		super.handleTextMessage(session, message);
	}

	// 종료 되었을때 할 것 
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println(session.getId() + "님이 접속 종료 하셨습니다.");
		connectedUser.remove(session.getId());
	}


	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "익셥션 발생" + exception.getMessage());
	}
	
}
