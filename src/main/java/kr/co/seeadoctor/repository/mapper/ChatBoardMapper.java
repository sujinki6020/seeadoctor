package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.ChatBoard;

public interface ChatBoardMapper {
	
	public List<ChatBoard> selectChatBoard(String adminId);
	
	public void insertChatBoard(ChatBoard ChatBoard);
	
	public void addMemo(ChatBoard ChatBoard);
	
	public void deleteChatBoard(int chatBoardSeq);

}
