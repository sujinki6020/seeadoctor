package kr.co.seeadoctor.repository.vo;

public class User {
	private int userSeq;
	private String id;
	private String pw;
	private String name;
	private char gender;
	private String birth;
	private String email;
	private String phone;
	private String tel;
	private String hospName;
	private String addr1;
	private String addr2;
	private char admin;
	private String zip;
	private int hospitalSeq;
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHospName() {
		return hospName;
	}
	public void setHospName(String hospName) {
		this.hospName = hospName;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public char getAdmin() {
		return admin;
	}
	public void setAdmin(char admin) {
		this.admin = admin;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public int getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(int hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
	}
	@Override
	public String toString() {
		return "User [userSeq=" + userSeq + ", id=" + id + ", pw=" + pw + ", name=" + name + ", gender=" + gender
				+ ", birth=" + birth + ", email=" + email + ", phone=" + phone + ", tel=" + tel + ", hospName="
				+ hospName + ", addr1=" + addr1 + ", addr2=" + addr2 + ", admin=" + admin + ", zip=" + zip
				+ ", hospitalSeq=" + hospitalSeq + "]";
	}
}
