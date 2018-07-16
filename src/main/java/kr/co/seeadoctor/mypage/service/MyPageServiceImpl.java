package kr.co.seeadoctor.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

@Service("myPageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private UserMapper umapper;
	
	@Override
	public List<User> retrieveUser(String id) {
		return umapper.selectByUser(id);
	}

	@Override
	public List<HospitalAbout> retrieveLike(String id) {
		return null;
	}

	@Override
	public void updateUser(User user) {
		System.out.println(user +"아이디");
		umapper.updateUser(user);
	}
	
}
