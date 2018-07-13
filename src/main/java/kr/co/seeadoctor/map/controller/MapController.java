package kr.co.seeadoctor.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.seeadoctor.map.service.MapService;
import kr.co.seeadoctor.repository.vo.Hospital;

@RestController
@RequestMapping("/map")
public class MapController {
	
	@Autowired
	private MapService mapService;
	
	@RequestMapping("/totalHospitalList.json")
	public List<Hospital> totalHospitalList() {
		return mapService.selectHospitalAll();
	}
	@RequestMapping("/deptHospitalList.json")
	public List<Hospital> deptHospitalList() {
		return mapService.selectHospitalBylatlon();
	}
}
