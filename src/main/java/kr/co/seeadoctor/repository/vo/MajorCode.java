package kr.co.seeadoctor.repository.vo;

public class MajorCode {

	    // 전공 시퀀스 
	    private Integer majorSeq;

	    // 전공이름 (ex.신경외과) 
	    private String majorName;

	    public Integer getMajorSeq() {
	        return majorSeq;
	    }

	    public void setMajorSeq(Integer majorSeq) {
	        this.majorSeq = majorSeq;
	    }

	    public String getMajorName() {
	        return majorName;
	    }

	    public void setMajorName(String majorName) {
	        this.majorName = majorName;
	    }
	}
