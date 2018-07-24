package kr.co.seeadoctor.mypage.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String callMyInfo(String id, Model model) {
	    List<HospitalAbout> hList = hospsService.selectAllHospLike(id);
//		List<User> userList = myPageService.retrieveUser(id);
	    model.addAttribute("hList", hList);

	    // adminId를 가져와서 model에 담아서 보내기
	    
		return "mypage/myInfo";
	}
	
	@RequestMapping("/updateUser.do")
	public String update(HttpSession session, User user) {
		session.setAttribute("user", user);
		String id = user.getId();
		myPageService.updateUser(user);
		hospsService.selectAllHospLike(id);
		return "mypage/myInfo";
	}
	
	@RequestMapping("/chatWindow.do")
	public String callChatWindow() throws Exception {
		return "chat/chatWindow";
	}
	
}
