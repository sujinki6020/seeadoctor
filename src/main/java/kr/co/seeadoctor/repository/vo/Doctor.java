package kr.co.seeadoctor.repository.vo;

public class Doctor {

	    // 의사 시퀀스 
	    private Integer doctorSeq;

	    // 병원 시퀀스 
	    private Integer hospitalSeq;

	    // 의사 이름 
	    private String doctorName;

	    // 소속 전공코드 
	    private String majorSeq;
	    
	    private MajorCode majorCode;
	    private Hospital hospital;
	    
	    

	    public Hospital getHospital() {
			return hospital;
		}

		public void setHospital(Hospital hospital) {
			this.hospital = hospital;
		}

		public MajorCode getMajorCode() {
			return majorCode;
		}

		public void setMajorCode(MajorCode majorCode) {
			this.majorCode = majorCode;
		}

		public Integer getDoctorSeq() {
	        return doctorSeq;
	    }

	    public void setDoctorSeq(Integer doctorSeq) {
	        this.doctorSeq = doctorSeq;
	    }

	    public Integer getHospitalSeq() {
	        return hospitalSeq;
	    }

	    public void setHospitalSeq(Integer hospitalSeq) {
	        this.hospitalSeq = hospitalSeq;
	    }

	    public String getDoctorName() {
	        return doctorName;
	    }

	    public void setDoctorName(String doctorName) {
	        this.doctorName = doctorName;
	    }

	    public String getMajorSeq() {
	        return majorSeq;
	    }

	    public void setMajorSeq(String majorSeq) {
	        this.majorSeq = majorSeq;
	    }

	}
	

