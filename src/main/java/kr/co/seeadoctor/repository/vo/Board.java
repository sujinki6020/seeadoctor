package kr.co.seeadoctor.repository.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("board")
public class Board extends Page {

	private int userSeq; //id
	private int no;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt;
	private int grPno;
	private int grProd;
	private int depth;
	private String name;
	private MultipartFile[] files;
	private int hospCode;
	
	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
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
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getGrPno() {
		return grPno;
	}
	public void setGrPno(int grPno) {
		this.grPno = grPno;
	}
	public int getGrProd() {
		return grProd;
	}
	public void setGrProd(int grProd) {
		this.grProd = grProd;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	
	
}
