package kr.co.seeadoctor.repository.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;
@Alias("comment")
public class CommentVo {
	private int no;
	private int userSeq;
	private String content;
	private int commentNo;
	private Date regDate;
	private int groPno;  // ㄱㄹ댓글번호
	private int groProd; //ㄱㄹ댓글순서
	private int depth;
	private String name;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getGroPno() {
		return groPno;
	}
	public void setGroPno(int groPno) {
		this.groPno = groPno;
	}
	public int getGroProd() {
		return groProd;
	}
	public void setGroProd(int groProd) {
		this.groProd = groProd;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	
	
	
}
