package kr.co.seeadoctor.repository.mapper;

import kr.co.seeadoctor.repository.vo.User;

public interface LoginMapper {
	public User login(User user) throws Exception;
	
	public String findId(String name, String birth) throws Exception;
	
	public String findPw(String id, String email) throws Exception;
}
