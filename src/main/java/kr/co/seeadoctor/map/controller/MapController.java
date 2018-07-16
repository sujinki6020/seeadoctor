package kr.co.seeadoctor.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.seeadoctor.map.service.MapService;
import kr.co.seeadoctor.repository.vo.Hospital;

@RestController
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/hospitalList.json")
	public List<Hospital> hospitalList(Hospital hospital) {
		int count = mapService.selectCount(hospital);
		List<Hospital> list = mapService.selectHospital(hospital);
		for(Hospital s : list) {
			s.setCount(count);
			break;
		}
		return list;
	}
}
