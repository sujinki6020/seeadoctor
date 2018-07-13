package kr.co.seeadoctor.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;

@Service
public class ReservationServiceExec implements ReservationService {
	
	@Autowired
	private ReservationMapper mapper;

	@Override
	public void insertReservation(Reservation reservation) {
		mapper.insertReservation(reservation);
	}

	@Override
	public Integer selectTimeSeq(Reservation reservation, String date) {
		return mapper.selectTimeSeq(reservation, date);
	}

	@Override
	public void insertTimeManagement(Reservation reservation, String time) {
		mapper.insertTimeManagement(reservation, time);
	}

	@Override
	public void updateBookedStatus(Integer timeSeq) {
		mapper.checkedBookedStatus(timeSeq);
	}

	@Override
	public List<Reservation> selectReservationByUser(Map<String, Object> reserveMap) {
		return mapper.selectReservationByUser(reserveMap);
	}

	@Override
	public List<Reservation> selectReservationPop(Reservation reservation) {
		return mapper.selectReservationPop(reservation);
	}

	@Override
	public List<ReservationTime> selectTimeList(ReservationTime reserveTime) {
		return mapper.selectTimeList(reserveTime);
	}

}
