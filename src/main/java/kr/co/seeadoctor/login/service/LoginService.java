package kr.co.seeadoctor.login.service;

import kr.co.seeadoctor.repository.vo.User;

public interface LoginService {
	public User login(User user) throws Exception;
}
