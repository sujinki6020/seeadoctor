package kr.co.seeadoctor.repository.vo;

import org.apache.ibatis.type.Alias;

@Alias("sample")
public class Sample2 {
	private int no;
	private String content;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
