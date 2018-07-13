package kr.co.seeadoctor.admin.calendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.reservation.service.ReservationService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping("/calendar.do")
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
	
	@RequestMapping("/calendarPop.do")
	public String calendarPop(HttpSession session, HttpServletRequest req, Model model) throws ParseException {
//		session.getAttribute("user");
		Reservation reservation = new Reservation();
		
		reservation.setHospCode(1);
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		String day = req.getParameter("day");
		if(month.length()==1) month = "0"+month;
		if(day.length()==1) day = "0"+day;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = sdf.parse(year + month + day);
		
		reservation.setReserveDate(date);
		
		List<Reservation> reserveList = service.selectReservationPop(reservation);
		model.addAttribute("reserveList",reserveList);
		model.addAttribute("dateStr", year+"-"+month+"-"+day);
		
		return "/admin/calendar/calendarPop";
	}
	
	@RequestMapping("/timePop.do")
	public String timePop(HttpSession session, HttpServletRequest req, Model model) throws ParseException {
//		session.getAttribute("user");
		Reservation reservation = new Reservation();
		reservation.setHospCode(1);
		
		String dateStr = req.getParameter("dateStr");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		reservation.setReserveDate(date);
		
		model.addAttribute("reservation", reservation);
		model.addAttribute("dateStr", dateStr);
		
		//병원seq로 얻은 의사정보를 add해준다.
		
		return "/admin/calendar/timeManagement";
	}
	
	@RequestMapping("/timeList.json")
	@ResponseBody
	public List<ReservationTime> timeList(@RequestParam int hospCode, String dateStr, int docCode) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		
		ReservationTime reserveTime = new ReservationTime();
		reserveTime.setHospCode(hospCode);
		reserveTime.setDate(date);
		reserveTime.setDocCode(docCode);
		
		return service.selectTimeList(reserveTime);
		
	}
	
	/*
	@RequestMapping("/closeTime.json")
	@ResponseBody
	public void closeTime(@RequestParam ArrayList<String> closeArr, int docCode, String dateStr) throws ParseException {

		
		
		int hospCode = 1;
		
		System.out.println(docCode);
		System.out.println(dateStr);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		
		for(int i=0; i<closeArr.size(); i++) {
			System.out.println(closeArr.get(i));
		}
		
		service.updateCloseTime();
		
		
	}
	*/

}
