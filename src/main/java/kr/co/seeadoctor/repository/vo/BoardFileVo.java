package kr.co.seeadoctor.repository.vo;

import org.apache.ibatis.type.Alias;
@Alias("boardFile")
public class BoardFileVo {

	private int fileSeq;//파일고유번호
	private int no;
	private String filePath;
	private String sysName;
	private int hospCode;
	private String oriName;
	
	
	
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
	public int getHospCode() {
		return hospCode;
	}
	public void setHospCode(int hospCode) {
		this.hospCode = hospCode;
	}
	
	
	
}
