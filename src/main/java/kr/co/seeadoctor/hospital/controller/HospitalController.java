package kr.co.seeadoctor.hospital.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.hospital.service.HospitalService;
import kr.co.seeadoctor.repository.vo.HospLike;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@Autowired
	private HospitalService hospService;
	
	
	@RequestMapping("/info.do")
	public void hospInfo(HospLike hospLike, Model model) {
		
		// 아래의 정보를 가져오기 위한 서비스 필요한
		// 병원 정보 가져오기
		// 전체 좋아요 개수
		// 해당 병원에 좋아요 여부
		hospLike.setId("");
		hospLike.setHospCode(1);
		//병원코드 중복으로 들어가지 않게 막기
		Map<String, Object> result = hospService.selectHospInfo(hospLike);//해당병원 좋아요했는지
		model.addAttribute("result", result);
	}
	
	//추천
	@RequestMapping("/hospLike.json")
	@ResponseBody
	public void hospLike(HospLike hospLike) { //return 어떻게 해야할 지 몰라서 우선 void로 함
		hospService.insertHospLike(hospLike);
	}
	
	
	
}
