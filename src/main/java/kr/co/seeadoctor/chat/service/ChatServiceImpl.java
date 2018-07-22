package kr.co.seeadoctor.chat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ChatMapper;
import kr.co.seeadoctor.repository.vo.Chat;

@Service("chatSercie")
public class ChatServiceImpl implements ChatService {
	@Autowired
	private ChatMapper cmapper;

	@Override
	public List<Chat> retrieveChat(Chat chat) {
		return cmapper.selectChat(chat);
	}
	@Override
	public void insertChat(Chat chat) {
		cmapper.insertChat(chat);
	}
	
}
