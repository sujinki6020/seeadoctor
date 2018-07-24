package kr.co.seeadoctor.repository.vo;

public class DoctorPic {
	private Integer hospitalSeq;
	private Integer picSeq;
	private Integer DoctorSeq;
	private String filePath;
	private String sysName;
	public Integer getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(Integer hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
	}
	public Integer getPicSeq() {
		return picSeq;
	}
	public void setPicSeq(Integer picSeq) {
		this.picSeq = picSeq;
	}
	public Integer getDoctorSeq() {
		return DoctorSeq;
	}
	public void setDoctorSeq(Integer doctorSeq) {
		DoctorSeq = doctorSeq;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	
}
