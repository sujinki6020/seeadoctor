package kr.co.seeadoctor.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.LoginMapper;
import kr.co.seeadoctor.repository.vo.User;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper lmapper;

	@Override
	public User login(User user) throws Exception {
		return lmapper.login(user);
	}

	@Override
	public String findId(String name, String birth) throws Exception {
		return lmapper.findId(name, birth);
	}

	@Override
	public String findPw(String id, String email) throws Exception {
		return lmapper.findPw(id, email);
	}
}
