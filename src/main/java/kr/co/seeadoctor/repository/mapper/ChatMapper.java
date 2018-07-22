package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Chat;

public interface ChatMapper {

	public List<Chat> selectChat(Chat chat);
	
	public void insertChat(Chat chat);
}
