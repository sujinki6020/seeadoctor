package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;

public interface HospitalMapper {
	void insertHospital(Hospital hospital);
	List<Hospital> selectHospitalAll();
	List<Hospital> selectHospitalByLatLon();
}
