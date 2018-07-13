package kr.co.seeadoctor.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.mapper.BoardMapper;
import kr.co.seeadoctor.repository.vo.BoardFileVo;
import kr.co.seeadoctor.repository.vo.BoardVo;

@Service
public class BoardServiceExec implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public Map<String, Object> selectBoard()throws Exception {
		Map<String, Object> result = new HashMap<>();
		List<BoardVo> list = boardMapper.selectBoard();
		System.out.println("list" + list.get(0).getTitle());
		result.put("list", list);
		return result;
	}

	@Override
	public void insertBoard(BoardVo board)throws Exception {
		boardMapper.insertBoard(board);
	}
	
	@Override
	public Map<String, Object> detailBoard(int no) throws Exception{
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
	@Override
	public BoardVo selectBoardUpdate(int no) throws Exception{
		return boardMapper.selectBoardUpdate(no);
		 
	}
	//파일업로드
	@Override
	public void insertBoardFiles(BoardVo board) throws Exception{
		
		if(board.getFiles() !=null) {
			
			 for(MultipartFile file: board.getFiles()) {
				 
				 System.out.println(file.getName());
				 System.out.println("들어왔니?:"+file.getOriginalFilename());
				 String ext="";
				 int index = file.getOriginalFilename().lastIndexOf(".");
					if(index != -1) {
						ext = file.getOriginalFilename().substring(index);
					}
					
					int hospCode = 1; 
					
					String sysName = "final-"+UUID.randomUUID().toString()+ext;
					file.transferTo(new File("c:/java-lec/upload/"+sysName));
					
					BoardFileVo fileVO = new BoardFileVo();
					fileVO.setNo(board.getNo());
					fileVO.setFilePath("c:/java-lec/upload/");
					fileVO.setSysName(sysName);
					fileVO.setHospCode(hospCode);
					boardMapper.insertBoardFiles(fileVO);
			 }
		}
	}	
		
		@Override
		public List<BoardFileVo> selectBoardFileByNo(int no) {
			return boardMapper.selectBoardFileByNo(no);
		}
		
		
		
		
		/*
		//파일이 있을 때
		if(files != null) { 
			
			//Iterator 반복자
			Iterator<String> fileName = files.getFileNames(); //업로드된 파일의 이름목록을 구해서 배열형식으로 넣는다
			MultipartFile[] file = files.getFiles(fileName.next());//fileName에(반복) 해당하는 업로드파일정보목록을 구한다.
			
			for(MultipartFile f : file) {
				
				System.out.println(f.getName());
				System.out.println("들어왔니?:"+f.getOriginalFilename());
				
				String ext = "";
				int index = f.getOriginalFilename().lastIndexOf(".");
					if(index != -1) {
						ext = f.getOriginalFilename().substring(index);
					}
					String sysName = "final-"+UUID.randomUUID().toString()+ext;
					f.transferTo(new File("c:/java-lec/upload/"+sysName));
					
					boardMapper.insertBoardFiles(f);
			}
		}
		*/
	}

	

