package kr.co.seeadoctor.admin.search.controller;

import java.util.List;

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
		System.out.println(name);
		List<User> userList = service.retrieveByName(name);
		System.out.println(userList);
		System.out.println(userList.get(0).getName());
		model.addAttribute("userList", userList);
	}
	
	@RequestMapping("/nameDetail.do")
	public void searchDetail() {
		
	}

}
