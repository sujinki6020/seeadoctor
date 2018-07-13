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
}
