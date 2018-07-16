package kr.co.seeadoctor.hospitalAbout.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.hospitalAbout.service.HospitalAboutService;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/hospital")
public class HospitalAboutController {

	@Autowired
	private HospitalAboutService hospService;
	
	//병원정보 가져오기
	@RequestMapping("/about.do")
	public void hospAbout(HospitalAbout hospAbout, Model model, HttpSession session, Hospital hospital) {
		
		// 아래의 정보를 가져오기 위한 서비스 필요한
		// 병원 정보 가져오기
		
		
		// 전체 좋아요 개수
		// 해당 병원에 좋아요 여부
		User user = (User)session.getAttribute("user");
		hospAbout.setMainTreat("내과");
		hospAbout.setName("매디스캔의원");
		hospAbout.setHospCode(111);
		hospAbout.setId(user.getId());
		
		//병원코드 중복으로 들어가지 않게 막기
		Map<String, Object> result = hospService.loadHospAbout(hospAbout, hospital);//해당병원 좋아요했는지
		result.put("hospLike", hospAbout);
		model.addAttribute("result", result);
	}
	
	//추천하기
	@RequestMapping("/plusStar.json")
	@ResponseBody
	public void plusStar(HospitalAbout hospLike) {
		hospService.insertStar(hospLike);
	}
	//추천취소
	@RequestMapping("/minusStar.json")
	@ResponseBody
	public void minusStar(HospitalAbout hospLike) {
		hospService.deleteStar(hospLike);
	}
	
	//병원잘못된정보수정
	@RequestMapping("wrongInfoForm.do")
	public void wrongInfoForm() {
	}
	
//	//내가 좋아요한 리스트
//	@RequestMapping("")
//	public List<HospitalAbout> hospLikeList(HttpSession session) {
//		User user = (User)session.getAttribute("user");
//		return hospService.selectAllHospLike(user.getId());
//	}
	
}
