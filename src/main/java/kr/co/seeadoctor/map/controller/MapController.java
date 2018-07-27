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
	public String mapMain() {	
		return "map/mapV2";
	}
	
	@RequestMapping("/hospitalList.json")
	@ResponseBody
	public Map<String , Object> hospitalList(Hospital hospital) {
		if(hospital.getQd() != null &&hospital.getQd().equals("전체선택")) {
			System.out.println("전체선택 널값으로 변경");
			hospital.setQd(null);
		}
		if(hospital.getQd() != null) {
			if(hospital.getQd().equalsIgnoreCase("")) {
				System.out.println("전체선택 널값으로 변경");
				hospital.setQd(null);
			}
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
	@RequestMapping("/seachHospital.do")
	@ResponseBody
	public Hospital searchHospital(String dutyName) {
		System.out.println("병원 검색중");
		Hospital hospital = mapService.selectHospitalByName(dutyName);
		System.out.println(hospital);
		return hospital;
	}
	
	@RequestMapping("/AllHospital.json")
	@ResponseBody
	public List<Hospital> allHospital(Hospital hospital){
		List<Hospital> list = mapService.selectAllHospital(hospital);
		if(list.size() > 0) {
			System.out.println(list.get(0).toString());
		}
		return list;
	}
}
