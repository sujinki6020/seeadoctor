package kr.co.seeadoctor.repository.mapper;

import kr.co.seeadoctor.repository.vo.DoctorPic;

public interface DoctorPicMapper {
	public DoctorPic selectDocPic(int doctorSeq);
	public void insertDocPic(DoctorPic doctorPic);
	public void updateDocPic(DoctorPic doctorPic);
	public void deleteDocPic(int doctorSeq);
}
