package kr.co.seeadoctor.admin.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.admin.search.service.SearchService;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/admin/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	@RequestMapping("/nameList.do")
	public void searchResult(String name, Model model) {
		List<User> userList = service.retrieveCustomerByName(name);
		model.addAttribute("userList", userList);
	}
	
	@RequestMapping("/nameDetail.do")
	public void searchDetail(int userSeq, Model model) {
		Map<String, Object> reserveHistory = service.retriveReservationByUserSeq(userSeq);
		model.addAttribute("reserveHistory", reserveHistory);
	}

}
