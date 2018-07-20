package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.VisitCnt;

public interface VisitCntMapper {
	
	/*통계*/
	List<VisitCnt> selectVisitCnt(int hospitalSeq);


	

}
