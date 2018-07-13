package kr.co.seeadoctor.board.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.BoardFileVo;
import kr.co.seeadoctor.repository.vo.BoardVo;
import kr.co.seeadoctor.repository.vo.CommentVo;
import kr.co.seeadoctor.repository.vo.hospLikeVo;

public interface BoardService {
	public Map<String, Object> selectBoard(BoardVo board) throws Exception;
	public Map<String, Object> detailBoard(int no) throws Exception;
	public BoardVo selectBoardUpdate(int no)throws Exception;
	public void insertBoard(BoardVo board)throws Exception;
	public void deleteBoard(int no);
	//파일등록
	public void insertBoardFiles(BoardVo board) throws Exception;
	//디테일 파일
	public List<BoardFileVo> selectBoardFileByNo(int no);
	
	//좋아요
	public int insertHospLike(hospLikeVo hospLike); //즐찾하기
	
	//댓글리스트
	public List<CommentVo> selectCommentByNo(int no);
	//댓글등록
	public void insertComment(CommentVo comment);
	
	// 추후  hosp 쪽으로 옮겨야 한다.
	public Map<String, Object> selectHospInfo(hospLikeVo hospLike);
}










