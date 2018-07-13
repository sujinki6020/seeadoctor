package kr.co.seeadoctor.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper mapper;

	@Override
	public List<Reservation> selectReservationByUser(ScrollPaging scrollPaging) {
		return mapper.selectReservationByUser(scrollPaging);
	}

	@Override
	public void reserveHospital(Reservation reservation) {

		//시간관리테이블
		
		Integer timeSeq = mapper.selectTimeSeq(reservation); //hospCode, docCode, date, time에 해당하는 timeSeq 반환
		if(timeSeq==null) {
			
			//영업정보 받아오기
			String startTime = "0920";
			String endTime = "1720";
			
			//만약 시간이 00,30단위가 아니라면
			if(Integer.parseInt(startTime.substring(2)) < 30) {
				startTime = startTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(startTime.substring(2)) > 30) {
				startTime = startTime.substring(0, 2) + "30";
			}
			if(Integer.parseInt(endTime.substring(2)) < 30) {
				endTime = endTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(endTime.substring(2)) > 30) {
				endTime = endTime.substring(0, 2) + "30";
			}

			int start = Integer.parseInt(startTime);
			int end = Integer.parseInt(endTime);
			for(int i = start; i < end; ) {
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
				reservation.setReserveTime(time);
				mapper.insertTimeManagement(reservation);
			}
			timeSeq = mapper.selectTimeSeq(reservation);
		}
		
		mapper.checkedBookedStatus(timeSeq);	

		mapper.insertReservation(reservation);
		
		
	}



}
