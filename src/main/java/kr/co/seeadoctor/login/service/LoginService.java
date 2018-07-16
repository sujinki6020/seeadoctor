package kr.co.seeadoctor.login.service;

import kr.co.seeadoctor.repository.vo.User;

public interface LoginService {
	public User login(User user) throws Exception;
	
	public String findId(String name, String birth) throws Exception;
	
	public String findPw(String id, String email) throws Exception;
}
