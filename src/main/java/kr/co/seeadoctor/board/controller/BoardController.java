package kr.co.seeadoctor.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seeadoctor.board.service.BoardService;
import kr.co.seeadoctor.repository.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/boardInfo.do")
	public void boardInfo() {
	}
	
	
	//리뷰리스트
//	@RequestMapping("/review.do")
//	public ModelAndView review() {
//		ModelAndView mav = new ModelAndView();
//		
//		Map<String, Object> result = boardService.selectBoard();
//		mav.setViewName("board/review");
//		mav.addObject("result", result);
//		return mav;

	@RequestMapping("/review.do")
	public void review(Model model) {
		model.addAttribute("result", boardService.selectBoard());
	}
	
	@RequestMapping("/writeForm.do")
	public void writeForm(BoardVo board) {
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(BoardVo board, Model model) {
		model.addAttribute("board", boardService.selectBoardUpdate(board.getNo())); 
		System.out.println("들어옴?");
		return "board/writeForm";
	}
	
	@RequestMapping("/write.do")
	public String write(BoardVo board) {//들어온다
		board.setUserSeq(3); //세션에있는 유저객체를 받아와서 셋해줌
		board.setName("체리혜리");
		System.out.println("널체크"+(board.getTitle()==null)+"title의 길이"+ board.getTitle().length());
		//아무값도 없는데 무언가가 넘어가는것같다.
		
		boardService.insertBoard(board); //가져간다
		return"redirect:/board/review.do";
	}
	
	@RequestMapping("/detail.do")
	public void detail(Model model, BoardVo board) {
		Map<String, Object> result = boardService.detailBoard(board.getNo());
		System.out.println(result.get(board.getNo()));
		model.addAttribute("result", result);
	}
	
	@RequestMapping("delete.do")
	public String delete(int no) {
		boardService.deleteBoard(no);
		return "redirect:/board/review.do";
	}
	
	
}
