package kr.co.seeadoctor.mypage.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.mypage.service.MyPageService;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired 
	private MyPageService myPageService;

	@RequestMapping("/myPage.do")
	public List<User> retrieveUser(String id) {
		System.out.println(id);
		List<User> userList = myPageService.retrieveUser(id);
		return userList;
	}
}
