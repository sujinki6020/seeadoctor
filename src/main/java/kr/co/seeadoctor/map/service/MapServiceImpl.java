package kr.co.seeadoctor.map.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.Hospital;
@Service
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
