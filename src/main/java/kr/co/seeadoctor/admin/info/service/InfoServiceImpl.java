package kr.co.seeadoctor.admin.info.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.DoctorMapper;
import kr.co.seeadoctor.repository.mapper.DoctorPicMapper;
import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.DoctorPic;
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
	
	@Autowired
	private DoctorPicMapper picMapper;
	
	@Override
	public HospitalAbout selectHospInfo(int hospitalSeq) {
		return hospMapper.loadHospital(hospitalSeq);
	}

	@Override
	public void updateHospital(Hospital hospital) {
		mapper.updateHospital(hospital);
	}

	@Override
	public List<Doctor> selectDoctors(int hospitalSeq) {
		return docMapper.selectDoctorByHospSeq(hospitalSeq);
	}

	
	//포토요약
	public List<BoardFile> outPutPhoto(int hospitalSeq) {
		return hospMapper.outPutPhoto(hospitalSeq);
	}
	
	// 내가 작성한 것
	@Override
	public void updateDoctors(Doctor doctor) {
		docMapper.updateDoctor(doctor);    
	}

	@Override
	public void insertDoctor(Doctor doctor) {
		docMapper.insertDoctorByHospSeq(doctor);
	}

	@Override
	public void updateDoctor(Doctor doctor) {
		docMapper.updateDoctor(doctor);
	}

	@Override
	public List<Doctor> selectDoctor(int hospitalSeq) {
		return docMapper.selectDoctorByHospSeq(hospitalSeq);
	}

	@Override
	public void deleteDoctor(int doctorSeq) {
		docMapper.deleteDoctor(doctorSeq);
	}

	@Override
	public Integer insertDoctorPic(DoctorPic doctorPic) {
		return picMapper.insertDocPic(doctorPic);
	}

	@Override
	public void updateDoctorPic(DoctorPic doctorPic) {
		picMapper.updateDocPic(doctorPic);
	}

	@Override
	public List<DoctorPic> selectDoctorPic(int doctorSeq) {
		return picMapper.selectDocPic(doctorSeq);
	}

	@Override
	public void deleteDoctorPic(int doctorSeq) {
		picMapper.deleteDocPic(doctorSeq);
	}

	@Override
	public Integer insertHospitalPic(BoardFile file) {
		hospMapper.insertHospitalPic(file);
		System.out.println("파일 시퀀스"+ file.getFileSeq());
		return file.getFileSeq();
	}

	@Override
	public void updateHospitalPic(BoardFile file) {
		hospMapper.updateHospitalPic(file);
	}

	@Override
	public List<BoardFile> selectHospitalPic(int hospitalSeq) {
		return hospMapper.selectHospitalPic(hospitalSeq);
	}

	@Override
	public void deleteHospitalPic(int fileSeq) {
		hospMapper.deleteHospitalPic(fileSeq);
	}
	
	
}
