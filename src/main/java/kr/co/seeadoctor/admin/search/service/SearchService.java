package kr.co.seeadoctor.admin.search.service;

import java.util.List;

import kr.co.seeadoctor.repository.vo.User;

public interface SearchService {

	List<User> retrieveByName(String name);

}
