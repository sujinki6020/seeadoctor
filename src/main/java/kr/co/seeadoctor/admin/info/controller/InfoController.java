package kr.co.seeadoctor.admin.info.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.admin.info.service.InfoService;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/admin/info")
public class InfoController {

	@Autowired
	private InfoService infoService;
	
	
	//병원정보 수정폼
	@RequestMapping("/infoUpdateForm.do")
	public String infoForm(HttpSession session, Model model) {
		//해당 병원의 시퀀스로 기본정보를 끌어오고 수정 가능하게함
		User user =(User)session.getAttribute("user"); 
		model.addAttribute("hospInfo", infoService.selectHospInfo(user.getHospitalSeq()));
		return "/admin/info/hospiUpdateForm";
	}
	
	@RequestMapping("/infoUpdate.do")
	public String info(Hospital hospital, MultipartFile[] files, String[] doctorName, String[] majorSeq) {
		List<Doctor> list = new ArrayList<>();
		System.out.println("되니?: " + hospital.getDutyName());
		for(MultipartFile m : files) {
			System.out.println("파일 : " + m.getOriginalFilename());
		}
		System.out.println(Arrays.toString(doctorName));
		System.out.println(Arrays.toString(majorSeq));
		Doctor[] doctors = new Doctor[doctorName.length];
		for (int i = 0; i < doctors.length; i++) {
			Doctor doctor = new Doctor();
			doctor.setDoctorName(doctorName[i]);
			doctor.setMajorSeq(majorSeq[i]);
			doctor.setHospitalSeq(hospital.getHospitalSeq());
			doctors[i] = doctor;
		}
		infoService.updateHospital(hospital, files, doctors);
		return "redirect:/";
	}
	
}
