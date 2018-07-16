package kr.co.seeadoctor.repository.vo;

import java.util.Date;

public class Reservation {


	    // 예약시퀀스 
	    private Integer reserveSeq;

	    // 유저시퀀스 
	    private Integer userSeq;

	    // 병원코드 
	    private Integer hospitalSeq;

	    // 의사코드 
	    private Integer docCode;

	    // 날짜 
	    private Date reserveDate;

	    // 시간 
	    private String reserveTime;

	    // 증상 
	    private String symptom;

	    // 방문상태 
	    private String reserveStatus;

	    // 리뷰작성 
	    private String reviewStatus;

	    public Integer getReserveSeq() {
	        return reserveSeq;
	    }

	    public void setReserveSeq(Integer reserveSeq) {
	        this.reserveSeq = reserveSeq;
	    }

	    public Integer getUserSeq() {
	        return userSeq;
	    }

	    public void setUserSeq(Integer userSeq) {
	        this.userSeq = userSeq;
	    }

	    public Integer getHospitalSeq() {
	        return hospitalSeq;
	    }

	    public void setHospitalSeq(Integer hospitalSeq) {
	        this.hospitalSeq = hospitalSeq;
	    }

	    public Integer getDocCode() {
	        return docCode;
	    }

	    public void setDocCode(Integer docCode) {
	        this.docCode = docCode;
	    }

	    public Date getReserveDate() {
	        return reserveDate;
	    }

	    public void setReserveDate(Date reserveDate) {
	        this.reserveDate = reserveDate;
	    }

	    public String getReserveTime() {
	        return reserveTime;
	    }

	    public void setReserveTime(String reserveTime) {
	        this.reserveTime = reserveTime;
	    }

	    public String getSymptom() {
	        return symptom;
	    }

	    public void setSymptom(String symptom) {
	        this.symptom = symptom;
	    }

	    public String getReserveStatus() {
	        return reserveStatus;
	    }

	    public void setReserveStatus(String reserveStatus) {
	        this.reserveStatus = reserveStatus;
	    }

	    public String getReviewStatus() {
	        return reviewStatus;
	    }

	    public void setReviewStatus(String reviewStatus) {
	        this.reviewStatus = reviewStatus;
	    }

	}

