package kr.co.seeadoctor.reservation.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;

public interface ReservationService {

	List<Reservation> selectReservationByUser(ScrollPaging scrollPaging);

	void reserveHospital(Reservation reservation);




}
