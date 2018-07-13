package kr.co.seeadoctor.hospital.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.HospLike;

public interface HospitalService {

	//병원정보가져오기
	public Map<String, Object> selectHospInfo(HospLike hospLike);
	//즐겨찾기
	public void insertStar(HospLike hospLike);
	public void deleteStar(HospLike hospLike);
	
	//내가좋아요한 리스트
	public List<HospLike> selectAllHospLike(String id);
}
