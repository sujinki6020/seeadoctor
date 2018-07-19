package kr.co.seeadoctor.admin.info.service;

import kr.co.seeadoctor.repository.vo.HospitalAbout;

public interface InfoService {
	
	//병원정보 가져오기
	public HospitalAbout selectHospInfo(int hospitalSeq);
	
	//병원정보 수정하기
	public void updateHospInfo(HospitalAbout hospitalAbout);
}
