package kr.co.seeadoctor.admin.chat.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component("chat")
public class ChatHandler extends TextWebSocketHandler {
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
//		sessionList.add(session);
		users.put(session.getId(), session);
		
		System.out.println("session.getId() : " + session.getId());
		System.out.println("채팅방 in");
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("session.getId() : " + session.getId());
		System.out.println("message.getPayload() : " + message.getPayload());
		
		System.out.println("채팅방 text ing");
		
		TextMessage msg = new TextMessage(message.getPayload());
		System.out.println("handler msg : " + msg);
		
//		TextMessage msg = new TextMessage(message.getPayload());
//		for(WebSocketSession ses : sessionList) {
//			ses.sendMessage(msg);
//		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//		sessionList.remove(session);
		users.remove(session.getId());
		System.out.println("퇴장");
	}
	
	
}
