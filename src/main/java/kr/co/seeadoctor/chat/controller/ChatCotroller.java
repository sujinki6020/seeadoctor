package kr.co.seeadoctor.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.chat.service.ChatService;
import kr.co.seeadoctor.repository.vo.Chat;
import kr.co.seeadoctor.repository.vo.User;

@RequestMapping("/chat")
@Controller
public class ChatCotroller {
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chatWindow.do")
	public void callChatWindow(HttpSession session, Model model, Chat chat) throws Exception {
		chat.setSenderId(((User) session.getAttribute("user")).getId());
		System.out.println("컨트롤러 : getReceiverId~~ " + chat.getReceiverId());
		System.out.println("컨트롤러 : chat.getSenderId()~~ " + chat.getSenderId());
//		String receiverId = ((User) session.getAttribute("user")).getId();
//		System.out.println("컨트롤러 receiverId" + receiverId);
//		chat.setReceiverId(receiverId);
		List<Chat> cList = chatService.retrieveChat(chat);
		model.addAttribute("cList", cList);
	}
	
//	@RequestMapping("/chatList.do")
//	public String callChatList(HttpSession session, Model model) throws Exception {
//		String receiverId = ((User) session.getAttribute("user")).getId();
//		List<Chat> cList = chatService.retrieveChat(receiverId);
//		model.addAttribute("cList", cList);
//		return "chat/chatWindow";
//	}
}
