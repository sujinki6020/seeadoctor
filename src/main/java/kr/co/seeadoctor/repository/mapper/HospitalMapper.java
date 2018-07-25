package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;

public interface HospitalMapper {
	void insertHospital(Hospital hospital);
	List<Hospital> selectHospital(Hospital hospital);
	int selectCount(Hospital hospital);
	void updateHospital(Hospital hospital);
	
	/*예약파트*/
	Hospital selectDutyTime(int hospitalSeq);
	
	
}
