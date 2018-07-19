package kr.co.seeadoctor.admin.info.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private HospitalAboutMapper hospMapper;
	
	//병원정보 가져오기
	
	@Override
	public HospitalAbout selectHospInfo(int hospitalSeq) {
		return hospMapper.loadHospital(hospitalSeq);
	}

	@Override
	public void updateHospInfo(HospitalAbout hospitalAbout) {
		hospMapper.updateHospInfo(hospitalAbout);
	}
	
}
