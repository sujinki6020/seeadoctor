package kr.co.seeadoctor.admin.chatboard.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.ChatBoard;

public interface ChatBoardService {
	public List<ChatBoard> retrieveChatBoard(String adminId);
	
	public void insertChatBoard(ChatBoard ChatBoard);

	public void addMemo(ChatBoard ChatBoard);
	
	public void deleteChatBoard(int chatBoardSeq);
}
