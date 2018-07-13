package kr.co.seeadoctor.board.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.seeadoctor.repository.mapper.BoardMapper;
import kr.co.seeadoctor.repository.vo.Board;
import kr.co.seeadoctor.repository.vo.BoardFile;
import kr.co.seeadoctor.repository.vo.Comment;
import kr.co.seeadoctor.repository.vo.HospLike;
import kr.co.seeadoctor.repository.vo.PageResult;


@Service
public class BoardServiceExec implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Override
	public Map<String, Object> selectBoard (Board board) throws Exception {
		Map<String, Object> result = new HashMap<>();
		
		List<Board> list = boardMapper.selectBoard();

		int sPageNo = board.getPageNo(); //탭시작번호
		board.setPageNo(sPageNo == 0 ? 1 : sPageNo); //시작번호가0이면 1로, 그게아니면 그걸로

		int count = boardMapper.selectBoardCount(board); //총 게시글수
		
		result.put("list", list);
		result.put("count", count);
		result.put("pageResult", new PageResult(board.getPageNo(), count));
		return result;
	}

	@Override
	public void insertBoard(Board board)throws Exception {
		boardMapper.insertBoard(board);
		
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
					
					BoardFile fileVO = new BoardFile();
					fileVO.setNo(board.getNo());
					fileVO.setFilePath("c:/java-lec/upload/");
					fileVO.setSysName(sysName);
					fileVO.setHospCode(hospCode);
					boardMapper.insertBoardFiles(fileVO);
			 }
		}
	}
	
	@Override
	
	
	public Map<String, Object> detailBoard(int no) throws Exception{
		Map<String, Object> result = new HashMap<>();
		boardMapper.updateBoardViewCnt(no);
		
		Board board = boardMapper.detailBoard(no);
		result.put("board", board);
		
		return result;
	}
	
	
	
	
	@Override
	public void deleteBoard(int no) {
		boardMapper.deleteBoard(no);
	}
	@Override
	public Board selectBoardUpdate(int no) throws Exception{
		return boardMapper.selectBoardUpdate(no);
		 
	}
		
		@Override
		public List<BoardFile> selectBoardFileByNo(int no) {
			return boardMapper.selectBoardFileByNo(no);
		}

		//즐겨찾기
		@Override
		public int insertHospLike(HospLike hospLike) { //좋아요 등록하기
			int cnt = boardMapper.selectMyLikeCnt(hospLike); //자신의좋아요 개수 가져오기
			
			if(cnt == 0 && cnt < 6) {
				boardMapper.insertHospLike(hospLike);
			} else {
				boardMapper.deleteHospLike(hospLike);
			}
			return cnt;
		}

		//댓글리스트
		@Override
		public List<Comment> selectCommentByNo(int no){
			return boardMapper.selectCommentByNo(no);
		}
		
		//댓글 등록
		public void insertComment(Comment comment) {
			boardMapper.insertComment(comment);
		}

		// 아래의 정보를 가져오기 위한 서비스 필요한
		// 병원 정보 가져오기
		// 전체 좋아요 개수
		// 해당 병원에 좋아요 여부
		@Override
		public Map<String, Object> selectHospInfo(HospLike hospLike) {
			Map<String, Object> result = new HashMap<>();
			// 병원 자체 정보 추가해야 함...
			int myCnt = boardMapper.selectMyLikeCnt(hospLike);
			int cnt = boardMapper.selectHospLikeCnt(hospLike);
			result.put("cnt", cnt);
			result.put("myCnt", myCnt);
			return result;
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

	

