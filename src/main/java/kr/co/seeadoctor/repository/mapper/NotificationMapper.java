package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Notification;


public interface NotificationMapper {
	public List<Notification> selectNotification();
	public void updateNotification(String id);
}
