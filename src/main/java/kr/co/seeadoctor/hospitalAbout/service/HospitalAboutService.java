package kr.co.seeadoctor.hospitalAbout.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospitalAbout;

public interface HospitalAboutService {

	//병원정보가져오기
	public Map<String, Object> loadHospAbout(String userId, int hospitalSeq);
	
	
	//즐겨찾기
	public void insertStar(HospitalAbout hospAbout);
	public void deleteStar(HospitalAbout hospAbout);
	
	//내가좋아요한 리스트
	public List<HospitalAbout> selectAllHospLike(String id);
	
	//글리뷰가져오기
	public Map<String, Object> selectHospReview(int hospitalSeq) throws Exception;
	public Map<String, Object> detailReview(Board b) throws Exception;
	public void updateReview(Board board)throws Exception;
	public void insertReview(Board board)throws Exception;
	public void deleteReview(int no);
	//디테일 파일
	public List<BoardFile> selectReviewFileByNo(Board board);
	
	//댓글리스트
	public List<Comment> selectCommentByNo(int no);
	//댓글등록
	public void insertComment(Comment comment);
	//댓삭
	public void deleteComment(int commentNo);
	//댓수정
	public void updateComment(Comment comment);


	public void visitCnt(int hospitalSeq);


	

}
