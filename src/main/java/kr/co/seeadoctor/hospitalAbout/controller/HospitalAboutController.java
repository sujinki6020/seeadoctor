package kr.co.seeadoctor.hospitalAbout.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seeadoctor.hospitalAbout.service.HospitalAboutService;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.User;

@Controller
@RequestMapping("/hospital")
public class HospitalAboutController {

	@Autowired
	private HospitalAboutService hospService;
	
	//병원정보 가져오기
	@RequestMapping("/about.do")
	public void hospAbout(int hospitalSeq ,HttpSession session,  Model model) {
		
		// 아래의 정보를 가져오기 위한 서비스 필요한 병원정보 가져오기
		// 전체 좋아요 개수, 해당병원 좋아요 여부(cnt), 중복 좋아요 안되게 막기
		
		//페이지 방문수 카운트
		hospService.visitCnt(hospitalSeq);
	
		//Map<String, Object> result = hospService.loadHospAbout(hospAbout, hospital);//해당병원 좋아요했는지
		User user = (User)session.getAttribute("user");
//		result.put("hospLike", hospAbout);
		model.addAttribute("result", hospService.loadHospAbout(user.getId(), hospitalSeq));
	}
	
	@RequestMapping("/review.json") 
	@ResponseBody
	public Map<String, Object> review(Model model, Board board) throws Exception {
		return hospService.selectHospReview(board.getHospitalSeq());
	}

	@RequestMapping("/write.json") 
	@ResponseBody
	public String write(Board board)throws Exception {
		System.out.println("board:" + board);
		hospService.insertReview(board); //가져간다
		return "success";
	}
	
	@RequestMapping("/updateForm.json")
	@ResponseBody
	public Map<String, Object> updateForm(Board board)throws Exception {
		System.out.println("업데이트폼");
		return hospService.detailReview(board); 
	}
	
	
	@RequestMapping("/update.json")
	@ResponseBody
	public void update(Board board)throws Exception {
		hospService.updateReview(board);
	}
	
	@RequestMapping("/detail.json")
	@ResponseBody
	public Map<String, Object> detail(Board board) throws Exception {
		Map<String, Object> result = hospService.detailReview(board);
		Board b=(Board)result.get("board");
		System.out.println("글번호:"+ b.getNo());
		return result;
	}
	
	@RequestMapping("/delete.json")
	@ResponseBody
	public void delete(int no) {
		hospService.deleteReview(no);
		//원래 반환타입이 String으로 문자열을 리턴해주면 제이슨 형태로 자동 파싱하려고 하기때문에 에러를 찍어보니 파싱에러가 났다. 보이드로해서 반환을 해주지 않으니 오류 수정 됨
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
		System.out.println("no -> " + no);
		List<Comment> commentList = hospService.selectCommentByNo(no);
//		System.out.println("왔니");
		return commentList;
	}
	//댓글 등록: 등록 후 등록된 댓글 까지 리스트 불러오기
	@RequestMapping("/commentRegist.json")
	@ResponseBody
	public List<Comment> commentRegist(Comment comment){
		hospService.insertComment(comment);
		List<Comment> commentList = hospService.selectCommentByNo(comment.getNo());
		return commentList;
	}
	//댓글삭제
	@RequestMapping("/commentDelete.json")
	@ResponseBody
	public void commentDelete(int commentNo) {
		hospService.deleteComment(commentNo);
//		System.out.println("댓글넘버"+commentNo);
	}
	
	//댓글수정
	
	
	
	//추천하기
	@RequestMapping("/plusStar.json")
	@ResponseBody
	public void plusStar(HospitalAbout hospAbout) {
		hospService.insertStar(hospAbout);
	}
	//추천취소
	@RequestMapping("/minusStar.json")
	@ResponseBody
	public void minusStar(HospitalAbout hospAbout) {
		hospService.deleteStar(hospAbout);
	}
	
	//병원잘못된정보수정
	@RequestMapping("/wrongInfoForm.do")
	public void wrongInfoForm() {
	}
	
//	//내가 좋아요한 리스트
//	@RequestMapping("")
//	public List<HospitalAbout> hospLikeList(HttpSession session) {
//		User user = (User)session.getAttribute("user");
//		return hospService.selectAllHospLike(user.getId());
//	}
	
		
	//포토요약
	@RequestMapping("/photo.do")
	public void photo() {
		
	}
	
	
}
