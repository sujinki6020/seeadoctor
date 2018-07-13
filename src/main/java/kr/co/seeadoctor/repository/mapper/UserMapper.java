package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.User;

public interface UserMapper {
	
	public List<User> selectByUser(String id);
	
	public void insertUser(User user);

	public List<User> selectUserByName(String name);
	
	public void updateUser(User user);
}
