package kr.co.seeadoctor.mypage.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

public interface MyPageService {
	public User retrieveUser(String id);
	
	public List<HospitalAbout> retrieveLike(String id);
	
	public void updateUser(User user);
}
