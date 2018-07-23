package kr.co.seeadoctor.repository.vo;

public class PageResult {

	//한 페이지에 몇개의 게시물을 나타낼 것인지
	//하나의 블럭에 몇개의 페이지를 나타낼 것인지
	private int listSize = 10; // 한 페이지당 게시글 수, xml에 limit로 설정해놓은 값과 동일해야함
	private int tabSize =10; // 총 탭의 수
	private int pageNo; //현재 페이지번호
	private int count; //총 페이지 수
	private int lastPage;//마지막페이지
	private int beginPage; //시작페이지
	private int endPage; //시작페이지-그탭의마지막페이지
	
	private boolean prev; //이전페이지
	private boolean next; //다음페이지
	
	
	public PageResult(int pageNo, int count) { //생성자
//		System.out.println("페이지No"+pageNo);
//		System.out.println("카운트"+count);
		
		this.count = count;
		this.pageNo = pageNo;
		init();
		
	}
	
	private void init() {
		lastPage = (int)Math.ceil(count /(double)listSize);
		
		//현재 페이지에 해당하는 탭 위치, 탭 시작 페이지, 탭 끝 페이지, 이전, 다음페이지 존재 여부
		int currTab = (pageNo -1) / tabSize +1;
		beginPage = (currTab - 1) * tabSize +1;
		endPage = (currTab * tabSize < lastPage) ? currTab * tabSize : lastPage;
		prev = beginPage != 1; //시작페이지가 1이 아닐 때 이전페이지가 있다
		System.out.println("beginPage" + beginPage);
		System.out.println("next:" +next);
		System.out.println("endPage:" +endPage);
		System.out.println("lastPage:" +lastPage);
		next = endPage != lastPage; //해당탭의마지막페이지가 마지막페이지가 아닐 때 다음페이지가 있다
	}
	
	public int getTabSize() {
		return tabSize;
	}
	
	public int getPageNo() {
		return pageNo;
	}
	
	public int getCount() {
		return count;
	}
	
	public int getBeginPage() {
		return beginPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public boolean getPrev() {
		return prev;
	}
	
	public boolean getNext() {
		return next;
	}
	
}
