package kr.co.seeadoctor.hospital.service;

import java.util.Map;

import kr.co.seeadoctor.repository.vo.HospLike;

public interface HospitalService {

	//좋아요
	public int insertHospLike(HospLike hospLike); //즐찾하기
	// 추후  hosp 쪽으로 옮겨야 한다.
	public Map<String, Object> selectHospInfo(HospLike hospLike);
	
}
