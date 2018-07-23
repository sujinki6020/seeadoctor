package kr.co.seeadoctor.hospitalAbout.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.mapper.DoctorMapper;
import kr.co.seeadoctor.repository.mapper.HospitalAboutMapper;
import kr.co.seeadoctor.repository.mapper.UserMapper;
import kr.co.seeadoctor.repository.mapper.VisitCntMapper;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.PageResult;
import kr.co.seeadoctor.repository.vo.Search;
@Service
public class HospitalAboutServiceImpl implements HospitalAboutService{
	
	@Autowired
	private HospitalAboutMapper hospMapper;
	@Autowired
	private VisitCntMapper visitMapper;
	@Autowired
	private DoctorMapper docMapper;
	@Autowired
	private UserMapper userMapper;

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
		int docCnt = docMapper.countDoctorByHospSeq(hospitalSeq); //예약가능여부 확인
		
		System.out.println("부가정보:" + hospResult.getDutyEtc());
		result.put("hospResult", hospResult);
		result.put("myCnt", myCnt);
		result.put("cnt", cnt);
		result.put("docCnt", docCnt); //예약가능여부 확인
		return result;
	}
	
	
	@Override
	public void insertStar(HospitalAbout hospAbout) {
		String adminId = userMapper.selectAdminId(hospAbout.getHospitalSeq());
		hospAbout.setAdminId(adminId);
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
	public Map<String, Object> selectHospReview(Search search) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		List<Board> list = hospMapper.selectReview(search); //전체 게시글 조회
		int count = hospMapper.selectReviewCount(search); //총 게시글수

		int sPageNo = search.getPageNo(); //탭시작번호
		search.setPageNo(sPageNo == 0 ? 1 : sPageNo); //시작번호가0이면 1로, 그게아니면 그걸로

		
		result.put("list", list);
		result.put("count", count);
		result.put("pageResult", new PageResult(search.getPageNo(), count)); // 매개변수가 두개
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
		System.out.println("임플의 넘버:" + no);
		System.out.println(hospMapper.selectCommentByNo(no));
		return hospMapper.selectCommentByNo(no);
	}
	
	//댓글 등록
	public void insertComment(Comment comment) {
		hospMapper.insertComment(comment);
	}
	
	//댓삭
	public void deleteComment(int commentNo) {
		hospMapper.deleteComment(commentNo);
	}
	
	//댓수정
	public void updateComment(Comment comment) {
		hospMapper.updateComment(comment);
	}
	
	//포토요약
	public List<BoardFile> outPutPhoto(int hospitalSeq) {
		List<BoardFile> files = hospMapper.outPutPhoto(hospitalSeq);
		return files;
	}

	//방문수 카운트
	@Override
	public void visitCnt(int hospitalSeq) {
		int result = visitMapper.updateVisitCnt(hospitalSeq);
		if(result==0) visitMapper.insertVisitCnt(hospitalSeq);
	}

	@Override
	public int selectMyCnt(String id) {
		return hospMapper.selectMyLikeCnt(id);
	}	

	/*
	@Override
	public List<Board> searchKeyWord(Search search){
		
Map<String, Object> result = new HashMap<>();
		
		List<Board> list = hospMapper.selectReview(search);

		int count = hospMapper.selectReviewCount(search.getHospitalSeq()); //총 게시글수
		
		result.put("list", list);
		result.put("count", count);
		return result;
	}
	*/

	
	
	
}
