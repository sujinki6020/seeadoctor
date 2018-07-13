package kr.co.seeadoctor.join.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.join.service.JoinService;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	private JoinService joinService;
	
	@RequestMapping("/joinUser.do")
	public String sample() throws Exception {
		return "join/joinUser";
	}
	@RequestMapping("/jusoPopup.do")
	public void jusoPopup() throws Exception {
	}
	
	@RequestMapping("/insertUser.do")
	public String registUser(User user) {
		joinService.registUser(user);
//		System.out.println(user.getPw());
		return "redirect:/index.jsp";
	}
}
