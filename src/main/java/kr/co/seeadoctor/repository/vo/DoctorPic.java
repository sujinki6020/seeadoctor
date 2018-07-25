package kr.co.seeadoctor.repository.vo;

public class DoctorPic {
	private Integer fileSeq;
	private Integer doctorSeq;
	private String doctorName;
	private String doctorDept;
	private Integer hospitalSeq;
	private String filePath;
	private String sysName;
	private String oriName;
	public Integer getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(Integer fileSeq) {
		this.fileSeq = fileSeq;
	}
	public Integer getDoctorSeq() {
		return doctorSeq;
	}
	public void setDoctorSeq(Integer doctorSeq) {
		this.doctorSeq = doctorSeq;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getDoctorDept() {
		return doctorDept;
	}
	public void setDoctorDept(String doctorDept) {
		this.doctorDept = doctorDept;
	}
	public Integer getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(Integer hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
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
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	@Override
	public String toString() {
		return "DoctorPic [fileSeq=" + fileSeq + ", doctorSeq=" + doctorSeq + ", doctorName=" + doctorName
				+ ", doctorDept=" + doctorDept + ", hospitalSeq=" + hospitalSeq + ", filePath=" + filePath
				+ ", sysName=" + sysName + ", oriName=" + oriName + "]";
	}
	
	
	
	
}
