package kr.co.seeadoctor.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.map.service.MapService;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalPage;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	

	@RequestMapping("/mapMain.do")
	public void mapMain() {	
	}
	
	@RequestMapping("/hospitalList.json")
	@ResponseBody
	public Map<String , Object> hospitalList(Hospital hospital) {
		System.out.println("자바 병원 들어옴");
		System.out.println("과 " +  hospital.getQd());
		if(hospital.getQd() != null &&hospital.getQd().equals("전체선택")) {
			System.out.println("전체선택 널값으로 변경");
			hospital.setQd(null);
		}
		int count = mapService.selectCount(hospital);
		HospitalPage page = new HospitalPage(hospital.getPageNo(), count);
		hospital.setPageNo(page.getPageStartNo() - 1);
		List<Hospital> list = mapService.selectHospital(hospital);
		Map<String , Object> map = new HashMap<>();
		if(!list.isEmpty()) {
			System.out.println(list.get(0).getDutyName());
		}
		map.put("list", list);
		map.put("page", page);
		return map;
	}
}
