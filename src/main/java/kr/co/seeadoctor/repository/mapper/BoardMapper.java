package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospLike;

public interface BoardMapper {
	
	List<Board> selectBoard();
	void insertBoard(Board board);
	void updateBoardViewCnt(int no);
	Board detailBoard(int no);
	void deleteBoard(int no);
	Board selectBoardUpdate(int no);
	//파일첨부
	void insertBoardFiles(BoardFile fileVO);
	List<BoardFile> selectBoardFileByNo(int no);
//	void insertBoardFiles(MultipartFile f);
	
	//총 게시글수
	int selectBoardCount(Board board);
	
	//즐겨찾기
	//해당병원이 좋아요가 되었는지의 cnt
	int selectMyLikeCnt(HospLike hospLike); //나의 좋아요 개수세기 0~5까지
	int selectHospLikeCnt(HospLike hospLike); //해당병원이 좋아요 되어있는지 여부 0 or 1
	void insertHospLike(HospLike hospLike); //좋아요시 병원코드와 id등록
	void deleteHospLike(HospLike hospLike); //좋아요 취소시 병원코드와 id삭제
	
	//댓글
	List<Comment> selectCommentByNo(int no); //
	void insertComment(Comment comment);
	void deleteComment(int no);
	
	
	
}





















