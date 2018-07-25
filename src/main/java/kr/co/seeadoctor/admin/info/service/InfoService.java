package kr.co.seeadoctor.admin.info.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

public interface InfoService {
	
	//병원정보 가져오기
	public HospitalAbout selectHospInfo(int hospitalSeq);
	
	//병원정보 수정하기
	public void updateHospital(Hospital hospital , MultipartFile[] files , Doctor[] doctor);
}
