package kr.co.seeadoctor.join.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.User;

public interface JoinService {

	public void registUser(User user);

	public int idDuplChk(String id);
	
	public List<Hospital> searchHospName(String dutyName);
	
	public void registAdmin(User user);
}
