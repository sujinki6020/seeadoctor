package kr.co.seeadoctor.admin.info.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.vo.Doctor;
import kr.co.seeadoctor.repository.vo.DoctorPic;
import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

public interface InfoService {
	
	//병원정보 가져오기
	public HospitalAbout selectHospInfo(int hospitalSeq);
	
	//병원정보 수정하기
	public void updateHospital(Hospital hospital , MultipartFile[] files , Doctor[] doctor);
	
	//의사 정보 가지고 오기 
	public List<Doctor> selectDoctors(int hospitalSeq);
	
	public void updateDoctors(Doctor doctor);
	
	// 의사 정보
	public void insertDoctor(Doctor doctor);
	public void updateDoctor(Doctor doctor);
	public List<Doctor> selectDoctor(int hospitalSeq);
	public void deleteDoctor(int doctorSeq);
	
	// 의사 사진 
	public void insertDoctorPic(DoctorPic doctorPic);
	public void updateDoctorPic(DoctorPic doctorPic);
	public DoctorPic selectDoctorPic(int doctorSeq);
	public void deleteDoctorPic(int doctorSeq);
}
