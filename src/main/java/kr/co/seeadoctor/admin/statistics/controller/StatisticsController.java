package kr.co.seeadoctor.admin.statistics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.admin.statistics.service.StatisticsService;

@Controller
@RequestMapping("/admin/statistics")
public class StatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	@RequestMapping("/statistics.do")
	public void statistics() {
		
	}

}
