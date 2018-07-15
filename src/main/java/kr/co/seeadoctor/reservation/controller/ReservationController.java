package kr.co.seeadoctor.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ScrollPaging;
import kr.co.seeadoctor.repository.vo.User;
import kr.co.seeadoctor.reservation.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	@RequestMapping("/reservationForm.do")
	public void form(Model model) {
		//의사 정보-시간 정보(의사checked되면 checked된 시간정보를 ajax로 뿌려줌)
//		model.addAttribute("", attributeValue)
	}
	
	@RequestMapping("/reservationList.do")
	public void list() {

	}
	
	@RequestMapping("/listAjax.json")
	@ResponseBody
	public List<Reservation> listAjax(HttpSession session, ScrollPaging scrollPaging) {

		//		session.getAttribute("user");
		int userSeq = 1;
		scrollPaging.setUserSeq(userSeq);
		
		return service.selectReservationByUser(scrollPaging);
	}
	
	
	@RequestMapping("/reserve.do")
	public String reserve(HttpSession session, Reservation reservation, String date) throws ParseException {

		User user = (User) session.getAttribute("user");
		System.out.println("이름"+user.getName());
		System.out.println("시퀀스"+user.getUserSeq());
		
//		System.out.println(reservation.getHospCode());
		reservation.setUserSeq(user.getUserSeq());
		reservation.setHospCode(1);
		
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date reserveDate = sdf.parse(date); 
		reservation.setReserveDate(reserveDate);
		
		service.reserveHospital(reservation);

		return "reservation/reservationList";
	}

}
