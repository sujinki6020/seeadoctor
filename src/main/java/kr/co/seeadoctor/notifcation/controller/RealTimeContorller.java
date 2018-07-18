package kr.co.seeadoctor.notifcation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RealTimeContorller {
	
	@RequestMapping("/header.do")
	public void notification() {
		System.out.println("헤더 실행중");
	}
}
