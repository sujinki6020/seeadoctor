package kr.co.seeadoctor.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.seeadoctor.login.service.LoginService;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/temp")
public class LoginController {
	@Autowired
	private LoginService service;
	
	@RequestMapping("/loginForm.do")
	public void login() {
		System.out.println("in");
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, User user) throws Exception {
		System.out.println("로그인 처리");
//		request.getSession().setAttribute("user", true);
		
		 String returnURL = "";
	        if ( session.getAttribute("user") != null ){
	            // 기존에 login이란 세션 값이 존재한다면
	            session.removeAttribute("user"); // 기존값을 제거해 준다.
	        }
	         
	        // 로그인이 성공하면 UserVO 객체를 반환함.
	        User vo = service.login(user);
	         
	        if ( vo != null ){ // 로그인 성공
	            session.setAttribute("user", vo); // 세션에 login인이란 이름으로 UserVO 객체를 저장.
	            returnURL = "redirect:/index.jsp"; // 로그인 성공시 게시글 목록페이지로 바로 이동하도록 하고
	        }else { // 로그인에 실패한 경우
	            returnURL = "temp/loginForm"; // 로그인 폼으로 다시 가도록 함
	        }
	         
	        return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}
	
	  @RequestMapping("/logout.do")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 세션 전체를 날려버림
//	      session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
	        return "redirect:/index.jsp"; // 로그아웃 후 게시글 목록으로 이동하도록...함
	    }
}
