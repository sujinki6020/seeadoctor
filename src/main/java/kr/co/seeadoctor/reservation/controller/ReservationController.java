package kr.co.seeadoctor.reservation.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.repository.vo.Reservation;
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
	public List<Reservation> listAjax(HttpSession session, @RequestParam int start, int end, String name, String val) {

		//		session.getAttribute("user");
		int userSeq = 1;
		
		Map<String, Object> reserveMap = new HashMap<String, Object>();
		reserveMap.put("userSeq", userSeq);
		reserveMap.put("start", start);
		reserveMap.put("end", end);
		if(val!=null) { //val=""처리필요
			if(name.equals("reserveStatus")) reserveMap.put("reserveStatus", val);
			if(name.equals("reserveDate")) reserveMap.put("reserveDate", Integer.parseInt(val));
		}
		
		
		return service.selectReservationByUser(reserveMap);
	}
	
	
	@RequestMapping("/reserve.do")
	public String reserve(HttpSession session, Reservation reservation, String date) throws ParseException {

		
//		session.getAttribute("user");
//		System.out.println(reservation.getHospCode());
		reservation.setUserSeq(1);
		reservation.setHospCode(1);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
		Date reserveDate = sdf.parse(date); 
		reservation.setReserveDate(reserveDate);

		
		//시간관리테이블
		
		Integer timeSeq = service.selectTimeSeq(reservation, date); //hospCode, docCode, date, time에 해당하는 timeSeq 반환
		if(timeSeq==null) {
			
			//영업정보 받아오기
			String startTime = "0920";
			String endTime = "1720";
			
			//만약 시간이 00,30단위가 아니라면
			if(Integer.parseInt(startTime.substring(2)) < 30) {
				startTime = startTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(startTime.substring(2)) > 30) {
				startTime = startTime.substring(0, 2) + "30";
			}
			if(Integer.parseInt(endTime.substring(2)) < 30) {
				endTime = endTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(endTime.substring(2)) > 30) {
				endTime = endTime.substring(0, 2) + "30";
			}

			int start = Integer.parseInt(startTime);
			int end = Integer.parseInt(endTime);
			for(int i = start; i < end; ) {
				//30분단위
				if(i%100 == 0) {
					i = i+30;
				}else {
					i = i+70;
				}
				String time = Integer.toString(i);
				if(i<1000) {
					time = "0"+time;
				}
				service.insertTimeManagement(reservation, time);
			}
			timeSeq = service.selectTimeSeq(reservation, date);
		}
		
		service.updateBookedStatus(timeSeq);	

		service.insertReservation(reservation);
		
		
		return "reservation/reservationList";
	}

}
