package kr.co.seeadoctor.hospitalAbout.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.mapper.VisitCntMapper;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
@Service
public class HospitalAboutServiceImpl implements HospitalAboutService{
	
	@Autowired
	private HospitalAboutMapper hospMapper;
	@Autowired
	private VisitCntMapper visitMapper;

	// 아래의 정보를 가져오기 위한 서비스 필요한
	// 병원 정보 가져오기
	// 전체 좋아요 개수
	// 해당 병원에 좋아요 여부
	
	
	@Override
	public Map<String, Object> loadHospAbout(String id , int hospitalSeq) {
		Map<String, Object> result = new HashMap<>();
		
		// 병원 자체 정보 추가해야 함...
		HospitalAbout hospResult = hospMapper.loadHospital(hospitalSeq);
		
		int myCnt = hospMapper.selectMyLikeCnt(id); //내 총 즐찾개수
		HospitalAbout hospAbout = new HospitalAbout();
		hospAbout.setId(id);
		hospAbout.setHospitalSeq(hospitalSeq);
		int cnt = hospMapper.selectHospLikeCnt(hospAbout); //중복
		
		System.out.println("부가정보:" + hospResult.getDutyEtc());
		result.put("hospResult", hospResult);
		result.put("myCnt", myCnt);
		result.put("cnt", cnt);
		return result;
	}
	
	
	@Override
	public void insertStar(HospitalAbout hospAbout) {
		hospMapper.insertHospLike(hospAbout);
	}
	@Override
	public void deleteStar(HospitalAbout hospAbout) {
		hospMapper.deleteHospLike(hospAbout);
		
	}
	
	@Override
	public List<HospitalAbout> selectAllHospLike(String id) {
		return hospMapper.selectAllHospLike(id);
	}


	@Override
	public Map<String, Object> selectHospReview(int hospitalSeq) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		List<Board> list = hospMapper.selectReview(hospitalSeq);

//		int sPageNo = board.getPageNo(); //탭시작번호
//		board.setPageNo(sPageNo == 0 ? 1 : sPageNo); //시작번호가0이면 1로, 그게아니면 그걸로

		int count = hospMapper.selectReviewCount(hospitalSeq); //총 게시글수
		
		result.put("list", list);
		result.put("count", count);
//		result.put("pageResult", new PageResult(board.getPageNo(), count));
		return result;
	}

	@Override
	public void insertReview(Board board)throws Exception {
		hospMapper.insertReview(board);
//		System.out.println("보드파일의 오리네임:" + board.getFiles()[0].getOriginalFilename());
		if(!board.getFiles()[0].getOriginalFilename().equals("")) { //오리지날네임이 공백이 아닐 때
			
			 for(MultipartFile file: board.getFiles()) {
				 
				 String ext="";
				 int index = file.getOriginalFilename().lastIndexOf(".");
					if(index != -1) {
						ext = file.getOriginalFilename().substring(index);
					}
					
					String sysName = "final-"+UUID.randomUUID().toString()+ext;
					file.transferTo(new File("c:/java-lec/upload/"+sysName));
					
					BoardFile fileVO = new BoardFile();
					fileVO.setNo(board.getNo());
					fileVO.setFilePath("c:/java-lec/upload/");
					fileVO.setSysName(sysName);
					fileVO.setHospitalSeq(board.getHospitalSeq());
					hospMapper.insertReviewFiles(fileVO);
			 }
		}
	}
	
	@Override
	public Map<String, Object> detailReview(Board b) throws Exception{
		int no = b.getNo();
		Map<String, Object> result = new HashMap<>();
		hospMapper.updateReviewViewCnt(no);
		Board board = hospMapper.detailReview(b);
//		System.out.println("board -> 2" + board.getContent());
		
		List<BoardFile> files = hospMapper.selectReviewFileByNo(b);
		System.out.println("files: " + files);
		List<Comment> commentList = hospMapper.selectCommentByNo(no);
		
		result.put("board", board);
		result.put("files", files);
		result.put("commentList", commentList);
		
		return result;
	}
	
	
	
	
	@Override
	public void deleteReview(int no) {
		hospMapper.deleteReview(no);
	}
	@Override
	public void updateReview(Board board) throws Exception{
		hospMapper.updateReview(board);
	}
		
	@Override
	public List<BoardFile> selectReviewFileByNo(Board board) {
		return hospMapper.selectReviewFileByNo(board);
	}
	
	//댓글리스트
	@Override
	public List<Comment> selectCommentByNo(int no){
		return hospMapper.selectCommentByNo(no);
	}
	
	//댓글 등록
	public void insertComment(Comment comment) {
		hospMapper.insertComment(comment);
	}
	
	//댓삭
	public void deleteComment(int commentNo) {
		hospMapper.deleteComment(commentNo);
//					System.out.println("댓삭되니");
	}
	
	//댓수정
	public void updateComment(Comment comment) {
		hospMapper.updateComment(comment);
	}


	@Override
	public void visitCnt(int hospitalSeq) {
		int result = visitMapper.updateVisitCnt(hospitalSeq);
		if(result==0) visitMapper.insertVisitCnt(hospitalSeq);
		
		
	}	



	
	
	
}
