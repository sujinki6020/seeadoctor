package kr.co.seeadoctor.hospital.service;

import java.util.Map;

import kr.co.seeadoctor.repository.vo.HospLike;

public interface HospitalService {


	
	//병원정보가져오기
	public Map<String, Object> selectHospInfo(HospLike hospLike);
	
	public void insertStar(HospLike hospLike);
	public void deleteStar(HospLike hospLike);
	
}
