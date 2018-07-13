package kr.co.seeadoctor.repository.mapper;

import kr.co.seeadoctor.repository.vo.User;

public interface LoginMapper {
	public User login(User user) throws Exception;
}
