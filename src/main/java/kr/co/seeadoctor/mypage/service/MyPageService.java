package kr.co.seeadoctor.mypage.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.User;

public interface MyPageService {
	public List<User> retrieveUser(String id);
}
