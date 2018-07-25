package kr.co.seeadoctor.admin.info.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.admin.info.service.InfoService;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.DoctorPic;
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
		// 추가 된 부분
		model.addAttribute("files", infoService.selectHospitalPic(user.getHospitalSeq()));
		model.addAttribute("doctors", infoService.selectDoctorPic(user.getHospitalSeq()));
		return "/admin/info/hospInfo";
	}
	
	@RequestMapping("/infoUpdate.do")
	public String info(Hospital hospital) {
		System.out.println("되니?: " + hospital.getDutyName());
		infoService.updateHospital(hospital);
		return "redirect:/";
	}
	@RequestMapping("/uploadDoctor.do")
	@ResponseBody
	public Integer uploadDoctor(MultipartFile attach ,String hospitalSeq , String doctorName , String doctorDept , String doctorSeq ,String fileSeq ) {
		System.out.println("의사 이미지 업로드");
		System.out.println("병원 시쿼스"+hospitalSeq);
		System.out.println("의사 이름" +doctorName);
		System.out.println("의사 부서"+doctorDept);
		System.out.println("의사 시퀀스"+doctorSeq);
		System.out.println("파일 시퀀스"+fileSeq);
		if(!attach.getOriginalFilename().equals("")) {
			String ext="";
		 	int index = attach.getOriginalFilename().lastIndexOf(".");
			if(index != -1) {
				ext = attach.getOriginalFilename().substring(index);
			}
			
			String sysName = "final-"+UUID.randomUUID().toString()+ext;
			try {
				attach.transferTo(new File("c:/java-lec/upload/"+sysName));
			} catch (Exception e) {
				
			}
			if(fileSeq != null && !fileSeq.equalsIgnoreCase("") && !fileSeq.equalsIgnoreCase("undefined")) {
				DoctorPic doctorPic = new DoctorPic();
				doctorPic.setFilePath("c:/java-lec/upload/");
				doctorPic.setSysName(sysName);
				doctorPic.setHospitalSeq(1012);
				doctorPic.setOriName(attach.getOriginalFilename());
				doctorPic.setDoctorName(doctorName);
				doctorPic.setDoctorDept(doctorDept);
				doctorPic.setDoctorSeq(Integer.parseInt("1"));
				doctorPic.setFileSeq(Integer.parseInt(fileSeq));
				infoService.updateDoctorPic(doctorPic);
				return 0;
			}
			DoctorPic doctorPic = new DoctorPic();
			doctorPic.setFilePath("c:/java-lec/upload/");
			doctorPic.setSysName(sysName);
			doctorPic.setHospitalSeq(1012);
			doctorPic.setOriName(attach.getOriginalFilename());
			doctorPic.setDoctorName(doctorName);
			doctorPic.setDoctorDept(doctorDept);
			doctorPic.setDoctorSeq(Integer.parseInt("1"));
			return infoService.insertDoctorPic(doctorPic);
		}
		return -1;
	}
	
	
	@RequestMapping("/uploadHospPic.do")
	@ResponseBody
	public Integer uploadHospPic(MultipartFile attach, String hospitalSeq, String fileSeq) {
		System.out.println("병원 이미지 업로드");
		if(!attach.getOriginalFilename().equals("")) {
			String ext="";
		 	int index = attach.getOriginalFilename().lastIndexOf(".");
			if(index != -1) {
				ext = attach.getOriginalFilename().substring(index);
			}
			
			String sysName = "final-"+UUID.randomUUID().toString()+ext;
			try {
				attach.transferTo(new File("c:/java-lec/upload/"+sysName));
			} catch (Exception e) {
				
			}
			if(fileSeq != null && !fileSeq.equalsIgnoreCase("")) {
				BoardFile fileVO = new BoardFile(); 
				fileVO.setFilePath("c:/java-lec/upload/");
				fileVO.setSysName(sysName);
				fileVO.setOriName(attach.getOriginalFilename());
				fileVO.setHospitalSeq(Integer.parseInt(hospitalSeq));
				fileVO.setFileSeq(Integer.parseInt(fileSeq));
				fileVO.setType("2");
				infoService.updateHospitalPic(fileVO);
				return 0;
			}
			BoardFile fileVO = new BoardFile(); 
			fileVO.setFilePath("c:/java-lec/upload/");
			fileVO.setSysName(sysName);
			fileVO.setOriName(attach.getOriginalFilename());
			fileVO.setHospitalSeq(Integer.parseInt(hospitalSeq));
			fileVO.setType("2");
			return infoService.insertHospitalPic(fileVO);
		}
		return -1;
	}
	
	@RequestMapping("/removeHospPic.do")
	@ResponseBody
	public String removeHospPic(String fileSeq) {
		System.out.println("파일 시퀀스 :"+ fileSeq);
		if(fileSeq == null) return "false";
		infoService.deleteHospitalPic(Integer.parseInt(fileSeq));
		return "success";
	}
	
	@RequestMapping("/removeDoctor.do")
	@ResponseBody
	public String removeDoctor(String fileSeq) {
		System.out.println("파일 시퀀스 :"+ fileSeq);
		if(fileSeq == null) return "false";
		if(fileSeq.equals("") || fileSeq.equalsIgnoreCase("undefined")) return "false";
		infoService.deleteDoctorPic(Integer.parseInt(fileSeq));
		return "success";
	}
}
