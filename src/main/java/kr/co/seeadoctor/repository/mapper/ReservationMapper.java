package kr.co.seeadoctor.repository.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.seeadoctor.repository.vo.Reservation;

public interface ReservationMapper {
	
	void insertReservation(Reservation reservation);
	
	Integer selectTimeSeq(@Param("reservation")Reservation reservation, @Param("date")String date);

	void checkedBookedStatus(Integer timeSeq);
	void insertTimeManagement(@Param("reservation")Reservation reservation, @Param("time")String time);
	
	List<Reservation> selectReservationByUser(Map<String, Object> reserveMap);

}
