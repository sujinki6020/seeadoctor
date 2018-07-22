package kr.co.seeadoctor.repository.vo;

import java.util.Date;

public class Chat {
	private int chatSeq;
	private String senderId;
	private String receiverId;
	private Date time;
	private String msg;
	public int getChatSeq() {
		return chatSeq;
	}
	public void setChatSeq(int chatSeq) {
		this.chatSeq = chatSeq;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "Chat [chatSeq=" + chatSeq + ", senderId=" + senderId + ", receiverId=" + receiverId + ", time=" + time
				+ ", msg=" + msg + "]";
	}
}
