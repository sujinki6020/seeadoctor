package kr.co.seeadoctor.repository.vo;

public class Page {

	private int pageNo = 1; //시작(누르는) 탭 번호
//	private int begin = 1;
	
	public int getBegin() {
		return (pageNo -1) * 10; //글 개수 조정, 시작이 0부터인 mysql은 10개씩 출력하려면 0~9, 10~19, 20~29 이렇게 끊긴다
	}
	public int getEnd() {
		return pageNo * 10; //1탭에 해당하는 게시글 수
	}
	public Page() {} //생성자
	
	public Page(int pageNo) { //오버로딩
		super();
		this.pageNo=pageNo;
//		this.begin = getBegin();
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
}
