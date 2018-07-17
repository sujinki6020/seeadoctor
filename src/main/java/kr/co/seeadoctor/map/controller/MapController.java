package kr.co.seeadoctor.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.seeadoctor.map.service.MapService;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalPage;

@RestController
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/hospitalList.json")
	public Map<String , Object> hospitalList(Hospital hospital) {
		int count = mapService.selectCount(hospital);
		HospitalPage page = new HospitalPage(hospital.getPageNo(), count);
		hospital.setPageNo(page.getPageStartNo() - 1);
		List<Hospital> list = mapService.selectHospital(hospital);
		Map<String , Object> map = new HashMap<>();
		map.put("list", list);
		map.put("page", page);
		return map;
	}
}
