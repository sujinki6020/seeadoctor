package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.BoardFileVo;
import kr.co.seeadoctor.repository.vo.BoardVo;
import kr.co.seeadoctor.repository.vo.CommentVo;
import kr.co.seeadoctor.repository.vo.hospLikeVo;

public interface BoardMapper {
	
	List<BoardVo> selectBoard();
	void insertBoard(BoardVo board);
	void updateBoardViewCnt(int no);
	BoardVo detailBoard(int no);
	void deleteBoard(int no);
	BoardVo selectBoardUpdate(int no);
	//파일첨부
	void insertBoardFiles(BoardFileVo fileVO);
	List<BoardFileVo> selectBoardFileByNo(int no);
//	void insertBoardFiles(MultipartFile f);
	
	//총 게시글수
	int selectBoardCount(BoardVo board);
	
	//즐겨찾기
	//해당병원이 좋아요가 되었는지의 cnt
	int selectMyLikeCnt(hospLikeVo hospLike); //나의 좋아요 개수세기 0~5까지
	int selectHospLikeCnt(hospLikeVo hospLike); //해당병원이 좋아요 되어있는지 여부 0 or 1
	void insertHospLike(hospLikeVo hospLike); //좋아요시 병원코드와 id등록
	void deleteHospLike(hospLikeVo hospLike); //좋아요 취소시 병원코드와 id삭제
	
	//댓글
	List<CommentVo> selectCommentByNo(int no); //
	void insertComment(CommentVo comment);
	void deleteComment(int no);
	
	
	
}





















