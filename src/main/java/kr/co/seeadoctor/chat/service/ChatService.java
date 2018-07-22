package kr.co.seeadoctor.chat.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Chat;

public interface ChatService {
	
	public List<Chat> retrieveChat(Chat chat);
	
	public void insertChat(Chat chat); 
}
	