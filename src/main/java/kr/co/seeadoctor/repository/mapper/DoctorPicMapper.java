package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.DoctorPic;

public interface DoctorPicMapper {
	public List<DoctorPic> selectDocPic(int doctorSeq);
	public Integer insertDocPic(DoctorPic doctorPic);
	public void updateDocPic(DoctorPic doctorPic);
	public void deleteDocPic(int doctorSeq);
}
