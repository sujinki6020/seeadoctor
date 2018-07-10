package kr.co.seeadoctor.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.BoardMapper;
import kr.co.seeadoctor.repository.vo.BoardVo;

@Service
public class BoardServiceExec implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public Map<String, Object> selectBoard() {
		Map<String, Object> result = new HashMap<>();
		List<BoardVo> list = boardMapper.selectBoard();
		System.out.println("list" + list.get(0).getTitle());
		result.put("list", list);
		return result;
	}

	@Override
	public void insertBoard(BoardVo board) {
		boardMapper.insertBoard(board);
	}
	
	@Override
	public Map<String, Object> detailBoard(int no){
		Map<String, Object> result = new HashMap<>();
		boardMapper.updateBoardViewCnt(no);
		
		BoardVo board = boardMapper.detailBoard(no);
		result.put("board", board);
		
		return result;
	}
	
	@Override
	public void deleteBoard(int no) {
		boardMapper.deleteBoard(no);
	}
	
	public BoardVo selectBoardUpdate(int no) {
		return boardMapper.selectBoardUpdate(no);
		 
	}
	
}
