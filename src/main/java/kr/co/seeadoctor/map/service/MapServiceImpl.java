package kr.co.seeadoctor.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.Hospital;

public class MapServiceImpl implements MapService {

	@Autowired
	private HospitalMapper mapper;
	
	@Override
	public List<Hospital> selectHospitalAll() {
		return mapper.selectHospitalAll();
	}

	@Override
	public List<Hospital> selectHospitalBylatlon() {
		return mapper.selectHospitalByLatLon();
	}
	
}
