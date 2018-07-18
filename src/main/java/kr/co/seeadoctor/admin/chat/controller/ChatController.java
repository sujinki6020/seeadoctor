package kr.co.seeadoctor.admin.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class ChatController {
//	@Autowired
//	private ChatService chatService;
	
	@RequestMapping("admin/chat/chatBoard.do")
	public String callChatBoard() throws Exception {
		return "admin/chat/chatBoard";
	}
	
	@RequestMapping("chat/chatWindow.do")
	public String callChatWindow() throws Exception {
		return "chat/chatWindow";
	}
	
	
}
