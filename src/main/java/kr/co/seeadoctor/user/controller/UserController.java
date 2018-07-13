package kr.co.seeadoctor.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.repository.vo.User;
import kr.co.seeadoctor.user.service.UserService;

@Controller
@RequestMapping("/temp")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/joinUser.do")
	public String sample() throws Exception {
		return "temp/joinUser";
	}
	@RequestMapping("/jusoPopup.do")
	public void jusoPopup() throws Exception {
	}
	
	@RequestMapping("/insertUser.do")
	public String registUser(User user) {
		userService.registUser(user);
		System.out.println(user.getPw());
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/myPage.do")
	public List<User> retrieveUser(String id) {
		System.out.println(id);
		List<User> userList = userService.retrieveUser(id);
		return userList;
		
	}
	
}
