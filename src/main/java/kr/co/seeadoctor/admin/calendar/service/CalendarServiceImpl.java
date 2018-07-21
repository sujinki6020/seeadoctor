package kr.co.seeadoctor.admin.calendar.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.DoctorMapper;
import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.vo.CalendarInfo;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private ReservationMapper mapper;
	@Autowired
	private HospitalMapper hospMapper;
	@Autowired
	private DoctorMapper docMapper;

	@Override
	public CalendarInfo setCalendarDate(CalendarInfo calParam) {


		String strYear = calParam.getStrYear();
		String strMonth = calParam.getStrMonth();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);
		
		if(strYear != null) {
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		}
		
		calParam.setYear(year);
		calParam.setMonth(month);
		cal.set(year, month, 1);
		
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		calParam.setStartDay(startDay);
		calParam.setEndDay(endDay);
		calParam.setStart(start);
		
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
		calParam.setIntToday(intToday);
		
		return calParam;
		
	}

	@Override
	public List<ReservationTime> selectTimeList(ReservationTime reservationTime) {
		
		List<ReservationTime> timeList = mapper.selectTimeList(reservationTime);
		
		if(timeList.size()==0) {
			
			Hospital hosp = hospMapper.selectDutyTime(reservationTime.getHospitalSeq());
			
			String startTime = null;
			String closeTime = null;
			switch(reservationTime.getDate().getDay()) {
			case 1 : 
				startTime = hosp.getDutyTime1s();
				closeTime = hosp.getDutyTime1c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 2 : 
				startTime = hosp.getDutyTime2s();
				closeTime = hosp.getDutyTime2c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 3 : 
				startTime = hosp.getDutyTime3s();
				closeTime = hosp.getDutyTime3c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 4 : 
				startTime = hosp.getDutyTime4s();
				closeTime = hosp.getDutyTime4c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 5 : 
				startTime = hosp.getDutyTime5s();
				closeTime = hosp.getDutyTime5c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 6 : 
				startTime = hosp.getDutyTime6s();
				closeTime = hosp.getDutyTime6c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			case 7 : 
				startTime = hosp.getDutyTime7s();
				closeTime = hosp.getDutyTime7c();
				if(startTime==null) startTime = "0000";
				if(closeTime==null) closeTime = "0000";
				break;
			
			}
			

			//만약 시간이 00,30단위가 아니라면
			if(Integer.parseInt(startTime.substring(2)) < 30) {
				startTime = startTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(startTime.substring(2)) > 30) {
				startTime = startTime.substring(0, 2) + "30";
			}
			if(Integer.parseInt(closeTime.substring(2)) < 30) {
				closeTime = closeTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(closeTime.substring(2)) > 30) {
				closeTime = closeTime.substring(0, 2) + "30";
			}

			int start = Integer.parseInt(startTime);
			int close = Integer.parseInt(closeTime);
			for(int i = start; i < close; ) {
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
				reservationTime.setTime(time);
				mapper.insertTimeManagement(reservationTime);
			}
			
			timeList = mapper.selectTimeList(reservationTime);

		}
		
		
		return timeList;
	
	}

	@Override
	public List<Reservation> selectReservationPop(Reservation reservation) {
		return mapper.selectReservationPop(reservation);
	}

	@Override
	public void updateReserveStatus(int reserveSeq) {
		mapper.updateReserveStatusFinish(reserveSeq);
	}

	@Override
	public void updateCloseTime(Map<String, Object> closeMap) {
		
		mapper.updateOpenTime((ReservationTime)closeMap.get("reserveTime"));
		if(closeMap.get("closeArr") != null) mapper.updateCloseTime(closeMap);
		
	}



	@Override
	public List<Doctor> getDoctorByHospSeq(int hospitalSeq) {
		return docMapper.selectDoctorByHospSeq(hospitalSeq);
		
	}

}
