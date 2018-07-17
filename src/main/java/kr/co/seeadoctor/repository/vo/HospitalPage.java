package kr.co.seeadoctor.repository.vo;

public class HospitalPage {
	private int pageStartNo = 1;
	private int currentTab;
	private int listSize = 10;
	private int tabSize = 10;
	private int count;
	private int beginTab;
	private int endTab;
	private int lastPage;
	
	private boolean prev;
	private boolean next;
	
	
	
	public HospitalPage(int currentTab, int count) {
		this.pageStartNo = (currentTab - 1) * 10 + 1 ;
		this.currentTab = currentTab;
		this.count = count;
		init();
	}
	
	public void init() {
		this.lastPage = (int)Math.ceil(count/(double)listSize);
		this.beginTab = ((currentTab - 1) / tabSize) * 10 + 1; // 글번호 가 10이면 페이지가 1페이지,  11이면 1페이지 시작 , 110번이면 
		this.endTab = (((currentTab - 1 ) / tabSize + 1 ) * 10 < lastPage)? ((currentTab - 1 ) / tabSize + 1 ) * 10 : lastPage ;
		this.prev = beginTab != 1;
		this.next = endTab != lastPage;
	}

	

	public int getPageStartNo() {
		return pageStartNo;
	}

	public void setPageStartNo(int pageStartNo) {
		this.pageStartNo = pageStartNo;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getTabSize() {
		return tabSize;
	}

	public void setTabSize(int tabSize) {
		this.tabSize = tabSize;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	

	public int getCurrentTab() {
		return currentTab;
	}

	public void setCurrentTab(int currentTab) {
		this.currentTab = currentTab;
	}

	public int getBeginTab() {
		return beginTab;
	}

	public void setBeginTab(int beginTab) {
		this.beginTab = beginTab;
	}

	public int getEndTab() {
		return endTab;
	}

	public void setEndTab(int endTab) {
		this.endTab = endTab;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	@Override
	public String toString() {
		return "HospitalPage [pageStartNo=" + pageStartNo + ", currentTab=" + currentTab + ", listSize=" + listSize
				+ ", tabSize=" + tabSize + ", count=" + count + ", beginTab=" + beginTab + ", endTab=" + endTab
				+ ", lastPage=" + lastPage + ", prev=" + prev + ", next=" + next + "]";
	}

	
}