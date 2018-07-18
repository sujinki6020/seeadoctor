package kr.co.seeadoctor.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;
import kr.co.seeadoctor.repository.vo.User;
import kr.co.seeadoctor.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping("/reservationForm.do")
	public void reservationForm(Model model, int hospitalSeq, HttpSession session) {
		
		//세션에 있는 사용자 개인정보
		model.addAttribute("user", session.getAttribute("user"));
		
		
		
		//<a>url파라미터로 넘어오는 hospital_seq
		//이걸로 tb_doctor에서 의사정보 찾아오기
		List<Doctor> docList = service.retrieveDoctor(hospitalSeq);
//		model.addAttribute("hospitalSeq", hospitalSeq);
		model.addAttribute("docList", docList);
		
		
		
	}
	
	//의사 + 날짜 선택되는 것에 따라 AJAX로 timeList만들어 줌
	@RequestMapping("/timeList.json")
	@ResponseBody
	public List<ReservationTime> timeList(ReservationTime reservationTime,int day,String date) throws ParseException {
		if(day==0) day=7;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		reservationTime.setDate(sdf.parse(date));
		
		return service.makeTimeList(reservationTime, day);

	}
	
	@RequestMapping("/reservationList.do")
	public void list() {
		//지난 날짜 미방문화
		service.ReservationNoShow(new Date());
	}
	
	
	@RequestMapping("/listAjax.json")
	@ResponseBody
	public List<Reservation> listAjax(HttpSession session, ScrollPaging scrollPaging) {
		User user = (User) session.getAttribute("user");
		scrollPaging.setUserSeq(user.getUserSeq());
		
		return service.selectReservationByUser(scrollPaging);
	}
	
	@RequestMapping("/reserve.do")
	public String reserve(HttpSession session, Reservation reservation, String date) throws ParseException {

		User user = (User) session.getAttribute("user");
		reservation.setUserSeq(user.getUserSeq());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date reserveDate = sdf.parse(date); 
		reservation.setReserveDate(reserveDate);
		
		service.reserveHospital(reservation);
		
		return "redirect:/reservation/reservationList.do";
	}
	
	@RequestMapping("/cancle.json")
	@ResponseBody
	public void cancle(int reserveSeq) {
		
		service.cancleReservation(reserveSeq);
		
	}

}
