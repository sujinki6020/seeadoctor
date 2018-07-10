package kr.co.seeadoctor.board.service;

import java.util.Map;

import kr.co.seeadoctor.repository.vo.BoardVo;

public interface BoardService {
	public Map<String, Object> selectBoard();
	public BoardVo selectBoardUpdate(int no);
	public void insertBoard(BoardVo board);
	public Map<String, Object> detailBoard(int no);
	public void deleteBoard(int no);
}
