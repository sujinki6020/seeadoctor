package kr.co.seeadoctor.admin.search.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Reservation;
import kr.co.seeadoctor.repository.vo.User;

public interface SearchService {

	List<User> retrieveCustomerByName(String name);

	Map<String, Object> retriveReservationByUserSeq(int userSeq);

}
