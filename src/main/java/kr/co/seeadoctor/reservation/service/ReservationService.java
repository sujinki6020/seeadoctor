package kr.co.seeadoctor.reservation.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Reservation;

public interface ReservationService {

	void insertReservation(Reservation reservation);

	Integer selectTimeSeq(Reservation reservation, String date);

	void insertTimeManagement(Reservation reservation, String time);
	void updateBookedStatus(Integer timeSeq);

	List<Reservation> selectReservationByUser(Map<String, Object> reserveMap);

}
