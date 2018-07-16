package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;

public interface ReservationMapper {
	
	void insertReservation(Reservation reservation);
	
	Integer selectTimeSeq(Reservation reservation);

	void checkedBookedStatus(Integer timeSeq);
	
	void insertTimeManagement(ReservationTime reservationTime);
	
	List<Reservation> selectReservationByUser(ScrollPaging scrollPaging);

	List<Reservation> selectReservationPop(Reservation reservation);

	List<ReservationTime> selectTimeList(ReservationTime reserveTime);

	List<Reservation> selectRervationByUserSeq(int userSeq);

	void updateReserveStatusFinish(int reserveSeq);

}
