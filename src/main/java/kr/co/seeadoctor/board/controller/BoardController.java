package kr.co.seeadoctor.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.board.service.BoardService;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospLike;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/info.do")
	public void hospInfo(HospLike hospLike, Model model) {
		
		// 아래의 정보를 가져오기 위한 서비스 필요한
		// 병원 정보 가져오기
		// 전체 좋아요 개수
		// 해당 병원에 좋아요 여부
		hospLike.setId("");
		hospLike.setHospCode(1);
		//병원코드 중복으로 들어가지 않게 막기
		Map<String, Object> result = boardService.selectHospInfo(hospLike);//해당병원 좋아요했는지
		model.addAttribute("result", result);
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
//	}
	
	@RequestMapping("/review.do") 
	public void review(Model model, Board board) throws Exception {
		model.addAttribute("result", boardService.selectBoard(board));
	}
	
	@RequestMapping("/writeForm.do")
	public void writeForm(Board board) {
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(Board board, Model model)throws Exception {
		model.addAttribute("board", boardService.selectBoardUpdate(board.getNo())); 
		return "board/writeForm";
	}
	
	@RequestMapping("/write.do")
	public String write(Board board)throws Exception {//들어온다4
		System.out.println("들어오니");
		board.setUserSeq(3); //세션에있는 유저객체를 받아와서 셋해줌
		board.setName("체리혜리");
		System.out.println("널체크"+(board.getTitle()==null)+"title의 길이"+ board.getTitle().length());
		//아무값도 없는데 무언가가 넘어가는것같다.
		
		//mysql셀렉트키를 이용하면 매개변수board에 입력된 글 번호가 설정된다(설정함)
		boardService.insertBoard(board); //가져간다
		//매개변수로 글번호와 멀티파트파일정보를 가지고 있는 보드vo객체를 넘긴다
//		boardService.insertBoardFiles(board); //(보드no가 설정된board객체)가져간다
		return "redirect:/board/review.do";
	}

	@RequestMapping("/detail.do")
	public void detail(Model model, Board board) throws Exception {
		Map<String, Object> result = boardService.detailBoard(board.getNo());
		List<BoardFile> files = boardService.selectBoardFileByNo(board.getNo());
		List<Comment> commentList = boardService.selectCommentByNo(board.getNo());
		
		model.addAttribute("result", result);
		model.addAttribute("files", files);
		model.addAttribute("commentList", commentList);
		
	}
	
	
	//추천
	@RequestMapping("/hospLike.json")
	@ResponseBody
	public void hospLike(HospLike hospLike) { //return 어떻게 해야할 지 몰라서 우선 void로 함
		boardService.insertHospLike(hospLike);
	}
	
	
	@RequestMapping("/delete.do")
	public String delete(int no) {
		boardService.deleteBoard(no);
		return "redirect:/board/review.do";
	}
	
	
	//파일다운로드
	@RequestMapping("/fileOutPut.do")
	public void fileOutPut(HttpServletRequest request, HttpServletResponse response) throws Exception{
		

		String filePath = request.getParameter("filePath");
		//System.out.println("파일패쓰"+filePath);
		String sysName = request.getParameter("sysName");
		//System.out.println("실제파일명"+sysName);
	
		File file = new File(filePath,sysName);
		//System.out.println("f:파일객체생성"+file);
		String fileName = file.getName();
	    
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode , 브라우저별 처리
	             
	            downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20"); //공백설정
	             
	        }else{
	             
	            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1"); //파일이름설정
	             
	        }
	         
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	             
	            servletOutputStream.write(b, 0, data);
	             
	        }
	 
	        servletOutputStream.flush();//출력
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
	}
	
	
	//댓글리스트
	@RequestMapping("/commentList.json")
	@ResponseBody
	public List<Comment> commentList(int no){
		List<Comment> commentList = boardService.selectCommentByNo(no);
		System.out.println("왔니");
		return commentList;
	}
	//댓글 등록: 등록 후 등록된 댓글 까지 리스트 불러오기
	@RequestMapping("/commentRegist.json")
	@ResponseBody
	public List<Comment> commentRegist(Comment comment){
		boardService.insertComment(comment);
		List<Comment> commentList = boardService.selectCommentByNo(comment.getNo());
		return commentList;
	}
	
	
		
	//포토요약
	@RequestMapping("/photo.do")
	public void photo() {
	}
	
}
