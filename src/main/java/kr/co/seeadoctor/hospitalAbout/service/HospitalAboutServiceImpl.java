package kr.co.seeadoctor.hospitalAbout.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
@Service
public class HospitalAboutServiceImpl implements HospitalAboutService{
	
	@Autowired
	private HospitalAboutMapper hospMapper;

	// 아래의 정보를 가져오기 위한 서비스 필요한
	// 병원 정보 가져오기
	// 전체 좋아요 개수
	// 해당 병원에 좋아요 여부
	
	
	@Override
	public Map<String, Object> loadHospAbout(HospitalAbout hospAbout, Hospital hospital) {
		Map<String, Object> result = new HashMap<>();
		
		hospMapper.loadHospital(hospAbout, hospital);
		
		
		// 병원 자체 정보 추가해야 함...
		int myCnt = hospMapper.selectMyLikeCnt(hospAbout);//내 총 즐찾개수
		int cnt = hospMapper.selectHospLikeCnt(hospAbout); //중복
		result.put("myCnt", myCnt);
		result.put("cnt", cnt);
		return result;
	}
	
	
	@Override
	public void insertStar(HospitalAbout hospAbout) {
		System.out.println("좋아요");
		hospMapper.insertHospLike(hospAbout);
	}
	@Override
	public void deleteStar(HospitalAbout hospAbout) {
		System.out.println("싫어요");
		hospMapper.deleteHospLike(hospAbout);
	}
	
	@Override
	public List<HospitalAbout> selectAllHospLike(String id) {
		return hospMapper.selectAllHospLike(id);
	}


	



	
	
	
}
