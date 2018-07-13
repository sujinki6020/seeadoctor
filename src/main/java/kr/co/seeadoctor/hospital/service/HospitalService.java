package kr.co.seeadoctor.hospital.service;

import java.util.Map;

import kr.co.seeadoctor.repository.vo.HospLike;

public interface HospitalService {

	//좋아요
	public int insertHospLike(HospLike hospLike); //즐찾하기
	
	//병원정보가져오기
	public Map<String, Object> selectHospInfo(HospLike hospLike);
	
	public void insertStar(HospLike hospLike);
	public void deleteStar(HospLike hospLike);
	
}
