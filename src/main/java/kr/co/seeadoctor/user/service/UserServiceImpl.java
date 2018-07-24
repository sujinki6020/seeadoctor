package kr.co.seeadoctor.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper umapper;

	@Override
	public void registUser(User user) {
		umapper.insertUser(user);
	}

	@Override
	public List<User> retrieveUser(String id) {
		return (List<User>) umapper.selectByUser(id);
	}
}
