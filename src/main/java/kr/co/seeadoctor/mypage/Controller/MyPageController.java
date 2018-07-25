package kr.co.seeadoctor.mypage.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.hospitalAbout.service.HospitalAboutService;
import kr.co.seeadoctor.mypage.service.MyPageService;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	@Autowired 
	private MyPageService myPageService;
	
	@Autowired 
	private HospitalAboutService hospsService;

	@RequestMapping("/myInfo.do")
	public String callMyInfo(HttpSession session, String id, Model model) {
		
	    List<HospitalAbout> hList = hospsService.selectAllHospLike(id);
		User myUser = myPageService.retrieveUser(id);
	    model.addAttribute("myUser", myUser);
	    model.addAttribute("hList", hList);
	    session.setAttribute("user", myUser);

		return "mypage/myInfo";
	}
	
	@ResponseBody
	@RequestMapping("/updateUser.do")
	public void update(HttpSession session, User user) {
		System.out.println(user.getId());
		System.out.println(user.getAddr1());
		System.out.println(user.getAddr2());
		System.out.println(user.getEmail());
		System.out.println(user.getPhone());
		System.out.println(user.getPw());
//		String id = ((User)session.getAttribute("user")).getId();
		myPageService.updateUser(user);
//		myPageService.retrieveUser(user.getId());
	}
	
	@RequestMapping("/chatWindow.do")
	public String callChatWindow() throws Exception {
		return "chat/chatWindow";
	}
}
