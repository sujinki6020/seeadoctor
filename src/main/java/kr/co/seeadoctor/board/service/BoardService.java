package kr.co.seeadoctor.board.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
 
public interface BoardService {
	public Map<String, Object> selectBoard(Board board) throws Exception;
	public Map<String, Object> detailBoard(int no) throws Exception;
	public Board selectBoardUpdate(int no)throws Exception;
	public void insertBoard(Board board)throws Exception;
	public void deleteBoard(int no);
	//디테일 파일
	public List<BoardFile> selectBoardFileByNo(int no);
	
	
	
	//댓글리스트
	public List<Comment> selectCommentByNo(int no);
	//댓글등록
	public void insertComment(Comment comment);
	//댓삭
	public void deleteComment(int commentNo);
	//댓수정
	public void updateComment(Comment comment);
	
}










