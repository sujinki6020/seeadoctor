package kr.co.seeadoctor.repository.vo;

import java.util.Date;

public class VisitCnt {
	
	int hospitalSeq;
	Date visitDate;
	int visitCnt;
	
	
	public int getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(int hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
	}
	public Date getVisitDate() {
		return visitDate;
	}
	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}
	public int getVisitCnt() {
		return visitCnt;
	}
	public void setVisitCnt(int visitCnt) {
		this.visitCnt = visitCnt;
	}
	
	

}
