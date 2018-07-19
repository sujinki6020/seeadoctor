package kr.co.seeadoctor.repository.vo;

public class Notification {
	private Integer notifSeq;
	private String sendId;
	private String receiveId;
	private String message;
	private char past;
	public Integer getNotifSeq() {
		return notifSeq;
	}
	public void setNotifSeq(Integer notifSeq) {
		this.notifSeq = notifSeq;
	}
	public String getSendId() {
		return sendId;
	}
	public void setSendId(String sendId) {
		this.sendId = sendId;
	}
	public String getReceiveId() {
		return receiveId;
	}
	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public char getPast() {
		return past;
	}
	public void setPast(char past) {
		this.past = past;
	}
	@Override
	public String toString() {
		return "Notification [notifSeq=" + notifSeq + ", sendId=" + sendId + ", receiveId=" + receiveId + ", message="
				+ message + ", past=" + past + "]";
	}
	
	
	
	
}
