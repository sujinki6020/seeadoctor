package kr.co.seeadoctor.admin.info.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.admin.info.service.InfoService;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/admin/info")
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	//병원정보 수정폼
	@RequestMapping("/infoUpdateForm.do")
	public void infoForm(HttpSession session, Model model) {
		//해당 병원의 시퀀스로 기본정보를 끌어오고 수정 가능하게함
		User user =(User)session.getAttribute("user"); 
		model.addAttribute("hospInfo", infoService.selectHospInfo(user.getHospitalSeq()));
	}
	
	@RequestMapping("/infoUpdate.do")
	public String info(HospitalAbout hospitalAbout) {
		System.out.println("되니?: " + hospitalAbout.getDutyName());
		infoService.updateHospInfo(hospitalAbout);
		return "redirect:/";
	}
	
}
