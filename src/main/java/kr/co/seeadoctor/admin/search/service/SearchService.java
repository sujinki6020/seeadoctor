package kr.co.seeadoctor.admin.search.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.User;

public interface SearchService {

	List<User> retrieveCustomerByName(User user);

	Map<String, Object> retriveReservationByUserSeq(int userSeq);

}
