package kr.co.seeadoctor.hospital.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.HospLike;
@Service
public class HospitalServiceExec implements HospitalService{
	
	@Autowired
	private HospitalMapper hospMapper;

	// 아래의 정보를 가져오기 위한 서비스 필요한
	// 병원 정보 가져오기
	// 전체 좋아요 개수
	// 해당 병원에 좋아요 여부
	@Override
	public Map<String, Object> selectHospInfo(HospLike hospLike) {
		Map<String, Object> result = new HashMap<>();
		// 병원 자체 정보 추가해야 함...
		int myCnt = hospMapper.selectMyLikeCnt(hospLike);
		int cnt = hospMapper.selectHospLikeCnt(hospLike);
		result.put("cnt", cnt);
		result.put("myCnt", myCnt);
		return result;
	}
	
	//즐겨찾기
	@Override
	public int insertHospLike(HospLike hospLike) { //좋아요 등록하기
		int cnt = hospMapper.selectMyLikeCnt(hospLike); //자신의좋아요 개수 가져오기
		
		if(cnt == 0 && cnt < 6) {
			hospMapper.insertHospLike(hospLike);
		} else {
			hospMapper.deleteHospLike(hospLike);
		}
		return cnt;
	}
	
	
	
	
}
