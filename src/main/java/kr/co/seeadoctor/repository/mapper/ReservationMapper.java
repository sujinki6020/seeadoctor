package kr.co.seeadoctor.repository.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;
import kr.co.seeadoctor.repository.vo.Statistics;
import kr.co.seeadoctor.repository.vo.VisitCnt;

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
	void updateCloseTime(Map<String, Object> closeMap);
	void updateOpenTime(ReservationTime reserveTime);
	void updateReservationCancle(int reserveSeq);
	void updateReserveStatusNoShow(Date today);

	/*통계*/
	Integer selectReservationCntByMonth(Map<String, Object> paramMap);
	Integer selectReservationCntBySex(Map<String, Object> paramMap);
	Integer selectReservationCntByAge(Map<String, Object> paramMap);
	List<Statistics> selectReservationCntAll(Map<String, Object> paramMap);
	List<VisitCnt> selectVisitCnt(int hospitalSeq);


	

}
