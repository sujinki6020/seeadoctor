package kr.co.seeadoctor.repository.vo;

public class HospitalAbout {

	private String id;
	private int hospCode;
	private String name; //병원이름
	private String mainTreat;//메인진료
	private String addr;//병원주소
	private String time;//병원시간
	private String addTreat; // 기타진료항목
	private String addInfo; //부가정보
	
	
	
	
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddTreat() {
		return addTreat;
	}
	public void setAddTreat(String addTreat) {
		this.addTreat = addTreat;
	}
	public String getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(String addInfo) {
		this.addInfo = addInfo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getHospCode() {
		return hospCode;
	}
	public void setHospCode(int hospCode) {
		this.hospCode = hospCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMainTreat() {
		return mainTreat;
	}
	public void setMainTreat(String mainTreat) {
		this.mainTreat = mainTreat;
	}
	
	
}
