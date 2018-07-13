package kr.co.seeadoctor.repository.vo;

public class PageVo {

	private int pageNo = 1; //탭 시작 번호
	
	public int getBegin() {
		return (pageNo -1) * 20 + 1; //글 개수 조정
	}
	public int getEnd() {
		return pageNo * 20; //1탭에 해당하는 게시글 수
	}
	public PageVo() {} //생성자
	
	public PageVo(int pageNo) { //오버로딩
		super();
		this.pageNo=pageNo;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
