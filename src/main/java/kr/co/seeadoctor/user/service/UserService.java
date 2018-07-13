package kr.co.seeadoctor.user.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.User;

public interface UserService {

	public List<User> retrieveUser(String id);
	
	public void registUser(User user);
}
