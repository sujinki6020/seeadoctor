package kr.co.seeadoctor.join.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.join.service.JoinService;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/join")
public class JoinController {
	@Autowired
	private JoinService joinService;
	
	@RequestMapping("/joinUser.do")
	public String callJoinUserForm() throws Exception {
		return "join/joinUser";
	}
	@RequestMapping("/jusoPopup.do")
	public void jusoPopup() throws Exception {
	}
	
	@RequestMapping("/insertUser.do")
	public String registUser(User user) {
		joinService.registUser(user);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/joinAdmin.do")
	public String callJoinAdminForm() throws Exception {
		return "join/joinAdmin";
	}
	
	@ResponseBody 
	@RequestMapping(value = "/idDuplChk.do" , method = RequestMethod.POST)
	public String idDuplChk(@ModelAttribute("vo") User vo , Model model) throws Exception{
	    int result = joinService.idDuplChk(vo.getId());
	    System.out.println("result : "+result);
	    return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/searchHospName.do", method = RequestMethod.POST)
	public List<Hospital> searchHospName(String dutyName) {
		System.out.println("java console dutyName : " + dutyName);
		return joinService.searchHospName(dutyName);
	}
	
}
