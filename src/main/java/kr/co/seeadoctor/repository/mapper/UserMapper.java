package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Hospital;
import kr.co.seeadoctor.repository.vo.User;

public interface UserMapper {
	
	public List<User> selectByUser(String id);
	
	public void insertUser(User user);

	public List<User> selectUserByName(User user);
	
	public void updateUser(User user);

	public User selectUserBySeq(int userSeq);
	
	public int idDuplChk(String id);
	
	public List<Hospital> searchHospName(String dutyName);
	
	public void insertAdmin(User user);

	public String selectAdminId(int hospitalSeq);
}
