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
@RequestMapping("/admin/chatboard")
public class ChatBoardController {
	@Autowired
	private ChatBoardService chatBoardService;
	
	@RequestMapping("/chatBoard.do")
	public String callChatBoard(ChatBoard chatBoard,HttpSession session, Model model) throws Exception {
		chatBoardService.insertChatBoard(chatBoard);
		String adminId = ((User)session.getAttribute("user")).getId();
		List<ChatBoard> cbList = chatBoardService.retrieveChatBoard(adminId);
		model.addAttribute("cbList", cbList);
		return "admin/chatboard/chatBoard";
	}

//	@RequestMapping("/insertChatBoard.do")
//	public void insertChatBoard(HttpSession session, ChatBoard chatBoard) {
//		chatBoardService.insertChatBoard(chatBoard);
//		return "admin/chatboard/chatBoard";
//	}
	
	@ResponseBody
	@RequestMapping("/addMemo.do") 
	public void addMemo(ChatBoard chatBoard) {
//		String adminId = ((User)session.getAttribute("user")).getId();
//		System.out.println("addmemo controller IN" + adminId);
		System.out.println("getmemo : " + chatBoard.getMemo());
		chatBoardService.addMemo(chatBoard);
//		List<ChatBoard> cbList = chatBoardService.retrieveChatBoard(adminId);
//		return cbList;
	}
	
	@RequestMapping("/deleteChatBoard.do") 
	public String deleteChatBoard(String adminId) {
		chatBoardService.deleteChatBoard(adminId);
		return "admin/chatboard/chatBoard";
	}
}
