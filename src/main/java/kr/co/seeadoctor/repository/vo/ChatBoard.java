package kr.co.seeadoctor.repository.vo;

import java.util.Date;

public class ChatBoard {
	private int chatBoardSeq;
	private String adminId;
	private String userId;
	private String userName;
	private Date date;
	private String memo;
	private char quit;
	private char check;
	public int getChatBoardSeq() {
		return chatBoardSeq;
	}
	public void setChatBoardSeq(int chatBoardSeq) {
		this.chatBoardSeq = chatBoardSeq;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public char getQuit() {
		return quit;
	}
	public void setQuit(char quit) {
		this.quit = quit;
	}
	public char getCheck() {
		return check;
	}
	public void setCheck(char check) {
		this.check = check;
	}
	@Override
	public String toString() {
		return "ChatBoard [chatBoardSeq=" + chatBoardSeq + ", adminId=" + adminId + ", userId=" + userId + ", userName="
				+ userName + ", date=" + date + ", memo=" + memo + ", quit=" + quit + ", check=" + check + "]";
	}

}
