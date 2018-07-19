package kr.co.seeadoctor.admin.chatboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/admin/chatboard/insertChatBoard.do")
	public String insertChatBoard(ChatBoard ChatBoard) {
		chatBoardService.insertChatBoard(ChatBoard);
		return "admin/chatboard/chatBoard";
	}
	
	@ResponseBody
	@RequestMapping("/admin/chatboard/addMemo.do") 
	public void addMemo(ChatBoard chatBoard) {
//		String adminId = ((User)session.getAttribute("user")).getId();
//		System.out.println("addmemo controller IN" + adminId);
		System.out.println("getmemo : " + chatBoard.getMemo());
		chatBoardService.addMemo(chatBoard);
//		List<ChatBoard> cbList = chatBoardService.retrieveChatBoard(adminId);
//		return cbList;
	}
	
	@RequestMapping("/admin/chatboard/deleteChatBoard.do") 
	public String deleteChatBoard(String adminId) {
		chatBoardService.deleteChatBoard(adminId);
		return "admin/chatboard/chatBoard";
	}
}
