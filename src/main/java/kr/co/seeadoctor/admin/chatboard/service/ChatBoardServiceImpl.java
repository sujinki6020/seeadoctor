package kr.co.seeadoctor.admin.chatboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ChatBoardMapper;
import kr.co.seeadoctor.repository.vo.ChatBoard;

@Service("chatBoardService")
public class ChatBoardServiceImpl implements ChatBoardService {
	@Autowired 
	private ChatBoardMapper cbmapper;

	@Override
	public List<ChatBoard> retrieveChatBoard(String adminId) {
		System.out.println("adminid : " + adminId);
		return cbmapper.selectChatBoard(adminId);
	}

	@Override
	public void insertChatBoard(ChatBoard ChatBoard) {
		cbmapper.insertChatBoard(ChatBoard);
	}

	@Override
	public void addMemo(ChatBoard ChatBoard) {
		cbmapper.addMemo(ChatBoard);
		
	}

	@Override
	public void deleteChatBoard(String adminId) {
		cbmapper.deleteChat(adminId);
	}
}
