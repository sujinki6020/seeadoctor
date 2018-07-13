package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;

public interface MapMapper {
	List<Hospital> selectHospitalAll();
	List<Hospital> selectHospitalBylatlon();
}
