package kr.co.seeadoctor.reservation.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;

public interface ReservationService {

	List<Reservation> selectReservationByUser(ScrollPaging scrollPaging);

	void reserveHospital(Reservation reservation);

	List<ReservationTime> makeTimeList(ReservationTime reservationTime, int day);

	void cancleReservation(int reserveSeq);

	void ReservationNoShow(Date today);

	List<Doctor> retrieveDoctor(int hospitalSeq);




}
