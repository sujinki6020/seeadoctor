package kr.co.seeadoctor.admin.calendar.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.vo.CalendarInfo;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	private ReservationMapper mapper;

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
	public List<ReservationTime> selectTimeList(ReservationTime reserveTime) {
		return mapper.selectTimeList(reserveTime);
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
		mapper.updateCloseTime(closeMap);
		
	}

}
