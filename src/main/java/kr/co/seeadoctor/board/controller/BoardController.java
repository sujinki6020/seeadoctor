package kr.co.seeadoctor.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.seeadoctor.board.service.BoardService;
import kr.co.seeadoctor.repository.vo.BoardFileVo;
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
//	}
	
	@RequestMapping("/review.do") 
	public void review(Model model) throws Exception {
		model.addAttribute("result", boardService.selectBoard());
	}
	
	@RequestMapping("/writeForm.do")
	public void writeForm(BoardVo board) {
	}
	
	@RequestMapping("/updateForm.do")
	public String updateForm(BoardVo board, Model model)throws Exception {
		model.addAttribute("board", boardService.selectBoardUpdate(board.getNo())); 
		return "board/writeForm";
	}
	
	@RequestMapping("/write.do")
	public String write(BoardVo board)throws Exception {//들어온다4
		System.out.println("들어오니");
		board.setUserSeq(3); //세션에있는 유저객체를 받아와서 셋해줌
		board.setName("체리혜리");
		System.out.println("널체크"+(board.getTitle()==null)+"title의 길이"+ board.getTitle().length());
		//아무값도 없는데 무언가가 넘어가는것같다.
		
		//mysql셀렉트키를 이용하면 매개변수board에 입력된 글 번호가 설정된다(설정함)
		boardService.insertBoard(board); //가져간다
		//매개변수로 글번호와 멀티파트파일정보를 가지고 있는 보드vo객체를 넘긴다
		boardService.insertBoardFiles(board); //(보드no가 설정된board객체)가져간다
		return "redirect:/board/review.do";
	}

	@RequestMapping("/detail.do")
	public void detail(Model model, BoardVo board) throws Exception {
		Map<String, Object> result = boardService.detailBoard(board.getNo());
		
		System.out.println(result.get(board.getNo()));
		
		List<BoardFileVo> files = boardService.selectBoardFileByNo(board.getNo());
		
		model.addAttribute("result", result);
		model.addAttribute("files", files);
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
		
		/*기영
		//String filePath = "c:/java-lec/upload/";
		// 파일이 저장되는 베이스 경로
		//String serverUpload = "C:\\java-lec\\upload\\";
		//사용자 컴퓨터에 저장할 파일명
		String dName = request.getParameter("dName");
		if(dName ==null) {
			response.setHeader("Content-Type", "image/jpg");
		}
		//파일의 종류에 상관없이 무조건 다운로드
		else {
			response.setHeader("Content-Type", "application/octet-stream");
			//다운로드 시 받을 이름 설명, 다운로드 시 한글 파일명 처리하기
			dName = new String(sysName.getBytes("utf-8"),"8859_1");
			response.setHeader("Content-Disposition", "attachment;filename="+dName);
		}
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while(true) {
			int ch = bis.read();
			if(ch==-1)break;
			bos.write(ch);
		}
		bos.flush();//출력
		bis.close(); fis.close(); bos.close(); out.close();
*/
	}
		
	//포토요약
	@RequestMapping("/photo.do")
	public void photo() {
	}
	
}
