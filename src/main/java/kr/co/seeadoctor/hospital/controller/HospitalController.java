package kr.co.seeadoctor.hospital.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.hospital.service.HospitalService;
import kr.co.seeadoctor.repository.vo.HospLike;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@Autowired
	private HospitalService hospService;
	
	//병원정보 가져오기
	@RequestMapping("/info.do")
	public void hospInfo(HospLike hospLike, Model model, HttpSession session) {
		
		// 아래의 정보를 가져오기 위한 서비스 필요한
		// 병원 정보 가져오기
		// 전체 좋아요 개수
		// 해당 병원에 좋아요 여부
		User user = (User)session.getAttribute("user");
		hospLike.setMainTreat("내과");
		hospLike.setName("매디스캔의원");
		hospLike.setHospCode(1);
		hospLike.setId(user.getId());
		//병원코드 중복으로 들어가지 않게 막기
		Map<String, Object> result = hospService.selectHospInfo(hospLike);//해당병원 좋아요했는지
		result.put("hospLike", hospLike);
		model.addAttribute("result", result);
	}
	
	//추천하기
	@RequestMapping("/plusStar.json")
	@ResponseBody
	public void plusStar(HospLike hospLike) {
		hospService.insertStar(hospLike);
	}
	//추천취소
	@RequestMapping("/minusStar.json")
	@ResponseBody
	public void minusStar(HospLike hospLike) {
		hospService.deleteStar(hospLike);
	}
	
	//병원잘못된정보수정
	@RequestMapping("wrongInfoForm.do")
	public void wrongInfoForm() {
	}
	
	//내가 좋아요한 리스트
	@RequestMapping("")
	public List<HospLike> hospLikeList(HttpSession session) {
		User user = (User)session.getAttribute("user");
		return hospService.selectAllHospLike(user.getId());
	}
	
}
