package kr.co.seeadoctor.admin.search.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.vo.User;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ReservationMapper reserveMapper;
	
	
	@Override
	public List<User> retrieveByName(String name) {
		return userMapper.selectUserByName(name);
	}
	
}
