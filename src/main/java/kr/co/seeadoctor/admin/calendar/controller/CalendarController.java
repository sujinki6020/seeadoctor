package kr.co.seeadoctor.admin.calendar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.admin.calendar.service.CalendarService;
import kr.co.seeadoctor.repository.vo.CalendarInfo;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/admin/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
    
    
	@RequestMapping("/calendar.do")
	public void setCalendar(CalendarInfo calParam, Model model) {
		
		CalendarInfo calInfo = service.setCalendarDate(calParam);
		model.addAttribute("calInfo", calInfo);
		
	}
	
	
	@RequestMapping("/calendarPop.do")
	public void calendarPop(HttpSession session, String year, String month, String day, Model model) throws ParseException {
		User user = (User) session.getAttribute("user");
		
		Reservation reservation = new Reservation();
		reservation.setHospitalSeq(user.getHospitalSeq());

		if(month.length()==1) month = "0"+month;
		if(day.length()==1) day = "0"+day;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = sdf.parse(year + month + day);
		reservation.setReserveDate(date);
		
		List<Reservation> reserveList = service.selectReservationPop(reservation);
		model.addAttribute("reserveList",reserveList);
		model.addAttribute("dateStr", year+"-"+month+"-"+day);
		
	}
	
	@RequestMapping("/timeManagement.do")
	public void timePop(HttpSession session, String dateStr, Model model) throws ParseException {
		User user = (User) session.getAttribute("user");
		int hospitalSeq = user.getHospitalSeq();
		Reservation reservation = new Reservation();
		reservation.setHospitalSeq(hospitalSeq);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		reservation.setReserveDate(date);
		
		List<Doctor> docList = service.getDoctorByHospSeq(hospitalSeq);
		model.addAttribute("docList", docList);
		model.addAttribute("reservation", reservation);
		model.addAttribute("dateStr", dateStr);
		
		//병원seq로 얻은 의사정보를 add해준다.
		
	}
	
	@RequestMapping("/timeList.json")
	@ResponseBody
	public List<ReservationTime> timeList(ReservationTime reserveTime , String dateStr) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		reserveTime.setDate(date);
		
		return service.selectTimeList(reserveTime);
		
	}
	
	
	
	@RequestMapping("/closeTime.json")
	@ResponseBody
	public void closeTime(ReservationTime reserveTime, String dateStr, String[] closeArr) throws ParseException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		reserveTime.setDate(date);
		
		Map<String,Object> closeMap = new HashMap<String, Object>();
		closeMap.put("reserveTime", reserveTime);
		closeMap.put("closeArr", closeArr);
		
		service.updateCloseTime(closeMap);
		
	}
	
	
	
	
	@RequestMapping("/updateReserveStatus.json")
	public void updateReserveStatus(int reserveSeq) {
		service.updateReserveStatus(reserveSeq);
	}
	
	@RequestMapping("/makeTime.json")
	@ResponseBody
	public List<ReservationTime> makeTime(ReservationTime reservationTime, String dateStr) throws ParseException {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(dateStr);
		reservationTime.setDate(date);
		
		return service.makeTimeList(reservationTime);
	}

}
