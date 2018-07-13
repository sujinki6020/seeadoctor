package kr.co.seeadoctor.hospital.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalLikeMapper;
import kr.co.seeadoctor.repository.vo.HospLike;
@Service
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalLikeMapper hospMapper;

	// 아래의 정보를 가져오기 위한 서비스 필요한
	// 병원 정보 가져오기
	// 전체 좋아요 개수
	// 해당 병원에 좋아요 여부
	@Override
	public Map<String, Object> selectHospInfo(HospLike hospLike) {
		Map<String, Object> result = new HashMap<>();
		
		// 병원 자체 정보 추가해야 함...
		int myCnt = hospMapper.selectMyLikeCnt(hospLike);//내 총 즐찾개수
		int cnt = hospMapper.selectHospLikeCnt(hospLike); //중복
		result.put("myCnt", myCnt);
		result.put("cnt", cnt);
		return result;
	}
	
	
	@Override
	public void insertStar(HospLike hospLike) {
		System.out.println("좋아요");
		hospMapper.insertHospLike(hospLike);
	}
	@Override
	public void deleteStar(HospLike hospLike) {
		System.out.println("싫어요");
		hospMapper.deleteHospLike(hospLike);
	}
	
	@Override
	public List<HospLike> selectAllHospLike(String id) {
		return hospMapper.selectAllHospLike(id);
	}
	
	
	
	
}
