package kr.co.seeadoctor.repository.vo;

public class BoardFile {

	private int fileSeq;//파일고유번호
	private int no;
	private String filePath;
	private String sysName;
	private String oriName;
	private int hospitalSeq;
	
	
	
	
	public int getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(int hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
