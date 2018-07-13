package kr.co.seeadoctor.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.User;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	@Autowired
	private UserMapper umapper;

	@Override
	public void registUser(User user) {
		umapper.insertUser(user);
	}
}
