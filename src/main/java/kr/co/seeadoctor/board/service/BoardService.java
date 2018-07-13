package kr.co.seeadoctor.board.service;

import java.util.List;
import java.util.Map;

import kr.co.seeadoctor.repository.vo.BoardFileVo;
import kr.co.seeadoctor.repository.vo.BoardVo;

public interface BoardService {
	public Map<String, Object> selectBoard() throws Exception;
	public BoardVo selectBoardUpdate(int no)throws Exception;
	public void insertBoard(BoardVo board)throws Exception;
	public Map<String, Object> detailBoard(int no) throws Exception;
	public void deleteBoard(int no);
	public void insertBoardFiles(BoardVo board) throws Exception;
	public List<BoardFileVo> selectBoardFileByNo(int no);
}
