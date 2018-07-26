package kr.co.seeadoctor.notifcation.handler;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.seeadoctor.repository.mapper.NotificationMapper;
import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.Notification;
import kr.co.seeadoctor.repository.vo.User;

@Component("realTime")
public class RealTimeHandler extends TextWebSocketHandler  {
	
	@Autowired 
	private NotificationMapper mapper;
	
	@Autowired
	private UserMapper userMapper;
	
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
		if(user == null) return;
		System.out.println("보낸 아이디 : " + user.getId());
		System.out.println("보낸 메서지 : " + message.getPayload());
		
		String rcvMsg = message.getPayload();
		// receiveId:message;
		if(rcvMsg.startsWith("login")) {
			List<Notification> notifs = mapper.selectNotification(user.getId());
			ObjectMapper toJson = new ObjectMapper();
			String result = toJson.writeValueAsString(notifs);
			session.sendMessage(new TextMessage(result));
			return;
		}else if(rcvMsg.startsWith("logout")) {
			mapper.updateNotification(user.getId());
			return;
		}
		
		if(rcvMsg.startsWith("delete")) {
			String notifSeq = rcvMsg.split(":")[1];
			mapper.updateNotificationBySeq(Integer.parseInt(notifSeq));
			return;
		}
		
		if(rcvMsg.startsWith("check") || rcvMsg.startsWith("cancel")) {
			String[] pureData = rcvMsg.split(":");
			String kind = pureData[0];
			String hospitalSeq = pureData[1];
			String rcvId = pureData[2];
			String css = pureData[3];
			String adminId = userMapper.selectAdminId(Integer.parseInt(hospitalSeq));
			System.out.println("병원 어드민 아이디 : " + adminId);
			WebSocketSession adminUser = findUser(adminId);
			Notification notif = new Notification();
			notif.setSendId(user.getId());
			notif.setReceiveId(adminId);
			notif.setEventType(css);
			mapper.insertNotification(notif);
			if(adminUser == null) {
				return;
			}
			int notifSeq = notif.getNotifSeq();
			adminUser.sendMessage(new TextMessage(user.getId() + ":"+ css + ":" + notifSeq));
			return;
		}
		String[] datas = rcvMsg.split(":");
		String rcvId = datas[0];
		String css = datas[1];
		System.out.println(rcvId);
		Notification notif = new Notification();
		notif.setSendId(user.getId());
		notif.setReceiveId(rcvId);
		notif.setEventType(css);
		mapper.insertNotification(notif);
		int notifSeq = notif.getNotifSeq();
		if(findUser(rcvId) == null) {
			System.out.println("해당 유저가 접속중이 아닙니다.");
			return;
		} 
		findUser(rcvId).sendMessage(new TextMessage(user.getId() + ":"+ css + ":" + notifSeq));
		System.out.println("sendId :" +  rcvId);
		System.out.println("users : " + connectedUser);
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
	
	public WebSocketSession findUser(String id) {
		return connectedUser.get(id);
	}
}
