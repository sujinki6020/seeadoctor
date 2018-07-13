package kr.co.seeadoctor.calendar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;

@Service
public class CalendarServiceExec {
	
	@Autowired
	private ReservationMapper mapper;

}
