package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;

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
	
	
	//댓글
	List<Comment> selectCommentByNo(int no); //
	void insertComment(Comment comment);
	void deleteComment(int no);
	
	
	
}





















