package kr.co.seeadoctor.map.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;

public interface MapService {
	public List<Hospital> selectHospital(Hospital hospital);
	public int selectCount(Hospital hospital);
	public List<Hospital> selectAllHospital(Hospital hospital);
	
	public Hospital selectHospitalByName(String dutyName);
}
