package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.BoardFileVo;
import kr.co.seeadoctor.repository.vo.BoardVo;

public interface BoardMapper {
	
	List<BoardVo> selectBoard();
	void insertBoard(BoardVo board);
	void updateBoardViewCnt(int no);
	BoardVo detailBoard(int no);
	void deleteBoard(int no);
	BoardVo selectBoardUpdate(int no);
	void insertBoardFiles(BoardFileVo fileVO);
	List<BoardFileVo> selectBoardFileByNo(int no);
//	void insertBoardFiles(MultipartFile f);
}
