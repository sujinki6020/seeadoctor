package kr.co.seeadoctor.repository.mapper;

import java.util.List;

import kr.co.seeadoctor.repository.vo.HospLike;
import kr.co.seeadoctor.repository.vo.Hospital;

public interface HospitalLikeMapper {
	//상세정보 불러오기
	void insertHospital(Hospital hospital);
	
	//즐겨찾기
	//해당병원이 좋아요가 되었는지의 cnt
	int selectMyLikeCnt(HospLike hospLike); //나의 좋아요 개수세기( 0~6까지 )
	int selectHospLikeCnt(HospLike hospLike); //(중복막기)해당병원이 좋아요 되어있는지 여부 0 or 1
	void insertHospLike(HospLike hospLike); //좋아요시 병원코드와 id등록,이름, 대표진료항목
	void deleteHospLike(HospLike hospLike); //좋아요 취소시 병원코드와 id삭제
	
	List<HospLike> selectAllHospLike(String id); //내가 좋아요 한 병원의 모든 정보
	
}
