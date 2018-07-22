package kr.co.seeadoctor.admin.chat.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.seeadoctor.repository.mapper.ChatMapper;
import kr.co.seeadoctor.repository.vo.Chat;
import kr.co.seeadoctor.repository.vo.User;

@Component("chat")
public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	private ChatMapper cmapper;
	
	private Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		if(session.getAttributes().get("user") != null) {
			User user = (User)session.getAttributes().get("user");
			System.out.println(user.getId() + " : 채팅 접속");
			users.put(user.getId(), session);
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		User user = (User) session.getAttributes().get("user"); 
		if(user == null) return; // 로그인을 했는지 여부
//		System.out.println("맵 " +  users);
		String rcvMsg = message.getPayload(); // chatWindow.js의 rcvId + ":" + msg가 넘어옴
//		System.out.println("handler rcvMsg : " + rcvMsg);
		
		String rcvId = rcvMsg.split(":")[0];
		String msg = rcvMsg.split(":")[1];
		if(rcvMsg.endsWith("connect")) {
			System.out.println("채팅방 연결됨");
			// 매퍼에서 꺼내온다 내 아이디는 세션에서 그리고 상대방 아이디는 rcvId로 
			// 기간 제한은 query에서 하기 
//			findUser(rcvId).sendMessage(new TextMessage("db에 담긴 메세지를 넣으면 된다"));
			return;
		}
		// message에서 온 정보
		if(findUser(rcvId) == null) return; // findUser() : 채팅 상대방이 들어왔는지 확인 (상대방의 websocket session이 생성되었는지 확인)
		findUser(rcvId).sendMessage(new TextMessage(user.getId() + ":" +msg)); // 받는 상대방에게 내 아이디 + msg 보내기
		
		// 이전내용 불러오기 작업을 위한 insert
		Chat chat = new Chat();
		chat.setSenderId(user.getId());
		chat.setReceiverId(rcvId);
		chat.setMsg(msg);
		cmapper.insertChat(chat);
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		if(session.getAttributes().get("user") != null) {
			User user = (User)session.getAttributes().get("user");
			System.out.println(user.getId() + " : 채팅 종료");
			users.remove(user.getId());
			System.out.println("퇴장");
		}
	}
	
	public WebSocketSession findUser(String id) {
		return users.get(id);
	}
	
}
