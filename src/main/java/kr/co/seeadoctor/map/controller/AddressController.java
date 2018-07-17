package kr.co.seeadoctor.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.map.service.AddressService;

@Controller
@RequestMapping("/map")
public class AddressController {
	
	@Autowired
	private AddressService mapService;
	
	@RequestMapping("/main.do")
	public void main() {
		mapService.start();
	}
	
	@RequestMapping(value="/address.do" ,produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getAddress(String q) {
		return mapService.addressNaver(q);
	}
	
	@RequestMapping(value="/position.do" ,produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getPosition(String latitude ,String longitude) {
		return mapService.positionNaver(latitude, longitude);
	}
}
