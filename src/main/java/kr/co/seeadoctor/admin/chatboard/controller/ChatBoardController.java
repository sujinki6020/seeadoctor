package kr.co.seeadoctor.admin.chatboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.admin.chatboard.service.ChatBoardService;
import kr.co.seeadoctor.repository.vo.ChatBoard;
import kr.co.seeadoctor.repository.vo.User;

@Controller

public class ChatBoardController {
	@Autowired
	private ChatBoardService chatBoardService;
	
	@RequestMapping("/admin/chatboard/chatBoard.do")
	public String callChatBoard(HttpSession session, Model model) throws Exception {
		String adminId = ((User)session.getAttribute("user")).getId();
		List<ChatBoard> cbList = chatBoardService.retrieveChatBoard(adminId);
		model.addAttribute("cbList", cbList);
		return "admin/chatboard/chatBoard";
	}
	
	@RequestMapping("chat/chatWindow.do")
	public String callChatWindow() throws Exception {
		return "chat/chatWindow";
	}
	
	@RequestMapping("admin/chatboard/insertChatBoard.do")
	public String insertChatBoard(ChatBoard ChatBoard) {
		chatBoardService.insertChatBoard(ChatBoard);
		return "admin/chatboard/chatBoard";
	}
	
	// @Responsebody (ajax?로 업데이트)
	@RequestMapping("admin/chatboard/addMemo.do") 
	public String addMemo(ChatBoard chatBoard) {
		chatBoardService.addMemo(chatBoard);
		return "admin/chatboard/chatBoard";
	}
	
	@RequestMapping("admin/chatboard/deleteChatBoard.do") 
	public String deleteChatBoard(String adminId) {
		chatBoardService.deleteChatBoard(adminId);
		return "admin/chatboard/chatBoard";
	}
}
