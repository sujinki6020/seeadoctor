package kr.co.seeadoctor.hospitalAbout.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

public interface HospitalAboutService {

	//병원정보가져오기
	public Map<String, Object> loadHospAbout(HospitalAbout hospAbout, Hospital hospital);
	
	
	//즐겨찾기
	public void insertStar(HospitalAbout hospAbout);
	public void deleteStar(HospitalAbout hospAbout);
	
	//내가좋아요한 리스트
	public List<HospitalAbout> selectAllHospLike(String id);


}
