package kr.co.seeadoctor.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar/calendar.do")
	public String setCal(HttpServletRequest req, Model model) {
		
		Calendar cal = Calendar.getInstance();
		
		String strYear = req.getParameter("year");
		String strMonth = req.getParameter("month");
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);
		
		if(strYear != null) {
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		}
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		cal.set(year, month, 1);
		
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		model.addAttribute("startDay", startDay);
		model.addAttribute("endDay", endDay);
		model.addAttribute("start", start);
		
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
		model.addAttribute("intToday", intToday);
		
	
		return "/admin/calendar/calendar";
	}

}
