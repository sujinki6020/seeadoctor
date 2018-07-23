package kr.co.seeadoctor.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.login.service.LoginService;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	private LoginService loginService;
	
	@RequestMapping("/loginForm.do")
	public void callLoginForm() {
//		System.out.println("in");
	}
	
	@RequestMapping("/login.do")
	public String login(HttpSession session, User user, Model model) throws Exception {
		System.out.println("로그인 처리");
//		request.getSession().setAttribute("user", true);
		
		 String returnURL = "";
		 		// 기존에 login이란 세션 값이 존재한다면
	        if ( session.getAttribute("user") != null ){
	        	// 기존값 제거
	            session.removeAttribute("user"); 
	        }
	         
	        // 로그인이 성공하면 UserVO 객체를 반환
	        User vo = loginService.login(user);
	         
	        String msg ="";
	        if ( vo != null ){ // 로그인 성공
	            if(user.getPw().equals(vo.getPw())) {
	            	System.out.println("usergetpw : "+user.getPw()+" // vogetpw : " + vo.getPw());
	            	session.setAttribute("user", vo); // 세션에 login인이란 이름으로 User 객체 저장
	            	returnURL = "redirect:/index.jsp"; // 로그인 성공 시 main(index)로 바로 이동
	            } else {
	            	System.out.println("22222usergetpw : "+user.getPw()+" // vogetpw : " + vo.getPw());
	            	msg = "비밀번호가 틀렸습니다.";
	            	returnURL = "login/loginForm"; // 로그인 폼으로 다시 
	            }
	        } else { 
	        	msg = "아이디가 틀렸습니다.";
	        	returnURL = "login/loginForm"; // 로그인 폼으로 다시 
	        }
	        model.addAttribute("msg", msg);
	        return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}
	
	  @RequestMapping("/logout.do")
	    public String logout(HttpSession session) {
	        session.invalidate(); // 세션 전체를 날려버림
//	      session.removeAttribute("login"); // 하나씩 하려면 이렇게 해도 됨.
	        return "redirect:/index.jsp"; // 로그아웃 후 게시글 목록으로 이동하도록...함
	  }
	  
	  @RequestMapping("/find.do")
	  public void find() {
		  
	  };
	  
	  @ResponseBody
	  @RequestMapping("/findId.do")
	  public String findId(String name, String birth) throws Exception {
		  String foundId = loginService.findId(name, birth); 
		return foundId;
	  }
	  
	  @ResponseBody
	  @RequestMapping("/findPw.do")
	  public String findPw(String id, String email) throws Exception {
		  String foundPw = loginService.findPw(id, email); 
		  return foundPw;
	  }
}
