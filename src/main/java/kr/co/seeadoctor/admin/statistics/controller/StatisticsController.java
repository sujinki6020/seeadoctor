package kr.co.seeadoctor.admin.statistics.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.admin.statistics.service.StatisticsService;

@Controller
@RequestMapping("/admin/statistics")
public class StatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	@RequestMapping("/statistics.do")
	public void statistics() {
		
	}
	
	@RequestMapping("/getPieData.json")
	@ResponseBody
	public Map<String, Object> getPieData(String thisYear, String thisMonth, int hospitalSeq) {
		
		if(Integer.parseInt(thisMonth) < 10) thisMonth = "0"+thisMonth;
		String dateStr = thisYear + "-" + thisMonth;
		
		return service.getPieData(dateStr, hospitalSeq);
	}
	
	@RequestMapping("/getLineData.json")
	@ResponseBody
	public Integer[] getLineData(String thisYear, String thisMonth, int hospitalSeq) {
		
		return service.getLineData(thisYear, thisMonth, hospitalSeq);
		
	}
	
	@RequestMapping("/getBarData.json")
	@ResponseBody
	public Integer[] getBarData(int hospitalSeq, String todayStr) throws ParseException {
		
		return service.getBarData(hospitalSeq);
		
	}


}
