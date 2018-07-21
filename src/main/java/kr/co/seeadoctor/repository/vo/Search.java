package kr.co.seeadoctor.repository.vo;

public class Search {
	
	private int hospitalSeq;
	private String selectCategory;
	private String searchKeyWord;
	public int getHospitalSeq() {
		return hospitalSeq;
	}
	public void setHospitalSeq(int hospitalSeq) {
		this.hospitalSeq = hospitalSeq;
	}
	public String getSelectCategory() {
		return selectCategory;
	}
	public void setSelectCategory(String selectCategory) {
		this.selectCategory = selectCategory;
	}
	public String getSearchKeyWord() {
		return searchKeyWord;
	}
	public void setSearchKeyWord(String searchKeyWord) {
		this.searchKeyWord = searchKeyWord;
	}
	
	
}
