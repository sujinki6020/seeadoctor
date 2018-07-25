package kr.co.seeadoctor.admin.info.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.mapper.DoctorMapper;
import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

@Service
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	private HospitalAboutMapper hospMapper;
	
	@Autowired
	private DoctorMapper docMapper;
	//병원정보 가져오기
	
	@Autowired
	private HospitalMapper mapper;
	
	@Override
	public HospitalAbout selectHospInfo(int hospitalSeq) {
		return hospMapper.loadHospital(hospitalSeq);
	}

	@Override
	public void updateHospital(Hospital hospital, MultipartFile[] files, Doctor[] doctors) {
		for(MultipartFile m : files) {
			if(!m.getOriginalFilename().equals("")) {
				String ext="";
			 	int index = m.getOriginalFilename().lastIndexOf(".");
				if(index != -1) {
					ext = m.getOriginalFilename().substring(index);
				}
				
				String sysName = "final-"+UUID.randomUUID().toString()+ext;
				try {
					m.transferTo(new File("c:/java-lec/upload/"+sysName));
				} catch (Exception e) {
					
				}
				BoardFile fileVO = new BoardFile(); 
				fileVO.setFilePath("c:/java-lec/upload/");
				fileVO.setSysName(sysName);
				fileVO.setHospitalSeq(hospital.getHospitalSeq());
				fileVO.setType("2");
				hospMapper.insertReviewFiles(fileVO);
			}
		}
		for(Doctor s : doctors) {
			docMapper.insertDoctorByHospSeq(s);
		}
		mapper.updateHospital(hospital);
	}
	
}
