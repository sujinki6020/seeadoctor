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
	public List<Hospital> selectHospital(Hospital hospital) {
		return mapper.selectHospital(hospital);
	}
	
	@Override
	public int selectCount(Hospital hospital) {
		return mapper.selectCount(hospital);
	}

	@Override
	public Hospital selectHospitalByName(String dutyName) {
		return mapper.searchHospital(dutyName);
	}

	@Override
	public List<Hospital> selectAllHospital(Hospital hospital) {
		return mapper.selectAllHospital(hospital);
	}
	
	
	
}
