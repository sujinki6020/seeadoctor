package kr.co.seeadoctor.reservation.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.ReservationTime;
import kr.co.seeadoctor.repository.vo.ScrollPaging;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	private ReservationMapper mapper;
	@Autowired
	private HospitalMapper hospMapper;

	@Override
	public List<Reservation> selectReservationByUser(ScrollPaging scrollPaging) {
		return mapper.selectReservationByUser(scrollPaging);
	}

	@Override
	public void reserveHospital(Reservation reservation) {
		
	
		//시간관리테이블
		Integer timeSeq = mapper.selectTimeSeq(reservation); //hospCode, docCode, date, time에 해당하는 timeSeq 반환

		mapper.checkedBookedStatus(timeSeq);	

		mapper.insertReservation(reservation);
		
		
	}

	@Override
	public List<ReservationTime> makeTimeList(ReservationTime reservationTime, int day) {
		
		List<ReservationTime> timeList = mapper.selectTimeList(reservationTime);
		
		if(timeList.size()==0) {
			
			Hospital hosp = hospMapper.selectDutyTime(reservationTime.getHospitalSeq());
			
			String startTime = null;
			String closeTime = null;
			switch(day) {
			case 1 : 
				startTime = hosp.getDutyTime1s();
				closeTime = hosp.getDutyTime1c();
				break;
			case 2 : 
				startTime = hosp.getDutyTime2s();
				closeTime = hosp.getDutyTime2c();
				break;
			case 3 : 
				startTime = hosp.getDutyTime3s();
				closeTime = hosp.getDutyTime3c();
				break;
			case 4 : 
				startTime = hosp.getDutyTime4s();
				closeTime = hosp.getDutyTime4c();
				break;
			case 5 : 
				startTime = hosp.getDutyTime5s();
				closeTime = hosp.getDutyTime5c();
				break;
			case 6 : 
				startTime = hosp.getDutyTime6s();
				closeTime = hosp.getDutyTime6c();
				break;
			case 7 : 
				startTime = hosp.getDutyTime7s();
				closeTime = hosp.getDutyTime7c();
				break;
			
			}

			//만약 시간이 00,30단위가 아니라면
			if(Integer.parseInt(startTime.substring(2)) < 30) {
				startTime = startTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(startTime.substring(2)) > 30) {
				startTime = startTime.substring(0, 2) + "30";
			}
			if(Integer.parseInt(closeTime.substring(2)) < 30) {
				closeTime = closeTime.substring(0, 2) + "00";
			} else if(Integer.parseInt(closeTime.substring(2)) > 30) {
				closeTime = closeTime.substring(0, 2) + "30";
			}

			int start = Integer.parseInt(startTime);
			int close = Integer.parseInt(closeTime);
			for(int i = start; i < close; ) {
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
				reservationTime.setTime(time);
				mapper.insertTimeManagement(reservationTime);
			}
			
			timeList = mapper.selectTimeList(reservationTime);

		}
		
		
		return timeList;
		

		
	}

	@Override
	public void cancleReservation(int reserveSeq) {
		mapper.updateReservationCancle(reserveSeq);
		
	}

	@Override
	public void ReservationNoShow(Date today) {
		mapper.updateReserveStatusNoShow(today);
	}



}
