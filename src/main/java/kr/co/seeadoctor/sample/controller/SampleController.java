package kr.co.seeadoctor.sample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.repository.mapper.SampleMapper;
import kr.co.seeadoctor.repository.vo.Sample2;

@Controller
@RequestMapping("/board")
public class SampleController {
	
	@Autowired
	private SampleMapper mapper;
	
	@RequestMapping("/test")
	public void sampleTest() {
		Sample2 sample2 = new Sample2();
		sample2.setNo(1);
		sample2.setContent("한한");
		mapper.insertSample(sample2);
	}
	
	
}