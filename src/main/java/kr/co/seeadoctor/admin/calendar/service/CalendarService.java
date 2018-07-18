package kr.co.seeadoctor.admin.calendar.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.CalendarInfo;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;

public interface CalendarService {

	CalendarInfo setCalendarDate(CalendarInfo calParam);

	List<ReservationTime> selectTimeList(ReservationTime reserveTime);

	List<Reservation> selectReservationPop(Reservation reservation);

	void updateReserveStatus(int reserveSeq);

	void updateCloseTime(Map<String, Object> closeMap);

	List<ReservationTime> makeTimeList(ReservationTime reservationTime);

	List<Doctor> getDoctorByHospSeq(int hospitalSeq);
}
