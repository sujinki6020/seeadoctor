package kr.co.seeadoctor.admin.info.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/info")
public class InfoController {

	@RequestMapping("/infoUpdateForm.do")
	public void info() {}
	
}
