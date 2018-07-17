package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Doctor;

public interface DoctorMapper {

	List<Doctor> selectDoctorByHospSeq(int hospitalSeq);
	

}
