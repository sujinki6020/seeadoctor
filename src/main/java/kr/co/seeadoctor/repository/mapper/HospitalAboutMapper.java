package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.HospitalAbout;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.Hospital;

public interface HospitalAboutMapper {
	
	//상세정보 불러오기
	HospitalAbout loadHospital(int hospitalSeq);
	
	
	//즐겨찾기
	//해당병원이 좋아요가 되었는지의 cnt
	int selectMyLikeCnt(String id); //나의 좋아요 개수세기( 0~6까지 )
	int selectHospLikeCnt(HospitalAbout hospAbout); //(중복막기)해당병원이 좋아요 되어있는지 여부 0 or 1
	void insertHospLike(HospitalAbout hospAbout); //좋아요시 병원코드와 id등록,이름, 대표진료항목
	void deleteHospLike(HospitalAbout hospAbout); //좋아요 취소시 병원코드와 id삭제
	
	List<HospitalAbout> selectAllHospLike(String id); //내가 좋아요 한 병원의 모든 정보

	//리뷰
	List<Board> selectReview(int hospitalSeq);
	//총게시글수
	int selectReviewCount(int hospitalSeq);
	void insertReview(Board board);
	void updateReviewViewCnt(int no);
	Board detailReview(Board board);
//	Board detailReview(int no);
	void deleteReview(int no);
	Board selectReviewUpdate(int no);
	//파일첨부
	void insertReviewFiles(BoardFile fileVO);
	List<BoardFile> selectReviewFileByNo(Board board);
	
	
	//댓글
	List<Comment> selectCommentByNo(int no); //
	void insertComment(Comment comment);
	void deleteComment(int commentNo);
	void updateComment(Comment comment);
	
	
	
}
