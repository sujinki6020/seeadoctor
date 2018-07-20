package kr.co.seeadoctor.admin.statistics.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seeadoctor.repository.mapper.ReservationMapper;
import kr.co.seeadoctor.repository.mapper.VisitCntMapper;
import kr.co.seeadoctor.repository.vo.Statistics;
import kr.co.seeadoctor.repository.vo.VisitCnt;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	
	@Autowired
	private ReservationMapper mapper;
	@Autowired
	private VisitCntMapper visitMapper;

	
	@Override
	public Map<String, Object> getPieData(String dateStr, int hospitalSeq) {
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("dateStr", dateStr);
		paramMap.put("hospitalSeq", hospitalSeq);
		
		/*성별통계*/
		Integer allCnt = mapper.selectReservationCntByMonth(paramMap);
		if(allCnt==null) allCnt=0;
		paramMap.put("sex", "f");
		Integer femaleCnt = mapper.selectReservationCntBySex(paramMap);
		if(femaleCnt==null) femaleCnt=0;
		paramMap.put("sex", "m");
		Integer maleCnt = mapper.selectReservationCntBySex(paramMap);
		if(maleCnt==null) maleCnt=0;
		double femalePer = ((double)femaleCnt/(double)allCnt)*100;
		double malePer = ((double)maleCnt/(double)allCnt)*100;
		double[] sexArr = new double[2];
		sexArr[0] = femalePer;
		sexArr[1] = malePer;
		
		/*나이대통계*/
		double[] ageArr = new double[7];
		for(int i=0; i<7; i++) {
			paramMap.put("start", 10*(i+1));
			paramMap.put("end", (10*(i+1))+9);
			if(i==6) paramMap.put("end", 150);
			Integer ageCnt = mapper.selectReservationCntByAge(paramMap);
			if(ageCnt==null) ageCnt = 0;
			
			double agePer = ((double)ageCnt/(double)allCnt)*100;
			
			ageArr[i] = agePer;
		}
		
		Map<String, Object> pieData = new HashMap<String, Object>();
		pieData.put("sexArr", sexArr);
		pieData.put("ageArr", ageArr);
		
		return pieData;

	}


	@Override
	public Integer[] getLineData(String thisYear, String thisMonth, int hospitalSeq) {
		
		int endArr = Integer.parseInt(thisMonth);
		Integer[] lineArr = new Integer[endArr];
		
		String startMonth = thisYear+"-01";
		String endMonth = thisYear+"-"+thisMonth;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("hospitalSeq", hospitalSeq);
		paramMap.put("startMonth", startMonth);
		paramMap.put("endMonth", endMonth);
		
		List<Statistics> statList = mapper.selectReservationCntAll(paramMap);
		
		for(int i=0; i<statList.size(); i++) {
			int month = Integer.parseInt(statList.get(i).getMonth().substring(5, 7));
			lineArr[month-1] = statList.get(i).getCnt();
		}
		
		return lineArr;
		
		
		/*
		if(Integer.parseInt(thisMonth) < 10) thisMonth = "0"+thisMonth;
		
		String startMonth = thisYear+"-01";
		String endMonth = thisYear+"-"+thisMonth;
		
		

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("hospitalSeq", hospitalSeq);
		paramMap.put("startMonth", startMonth);
		paramMap.put("endMonth", endMonth);
		
		List<Statistics> statList = mapper.selectReservationCntAll(paramMap);
		
		ArrayList<String> lineMonth = new ArrayList<String>();
		ArrayList<Integer> lineCnt = new ArrayList<Integer>();
		for(int i = 0; i < statList.size(); i++) {
			lineMonth.add(statList.get(i).getMonth().substring(5, 7));
			lineCnt.add(statList.get(i).getCnt());
		}
		
		Map<String, Object> lineData = new HashMap<String, Object>();
		lineData.put("lineMonth", lineMonth);
		lineData.put("lineCnt", lineCnt);
		return lineData;
         */
		
	}


	@Override
	public Integer[] getBarData(int hospitalSeq) {
		
		List<VisitCnt> visitList =  visitMapper.selectVisitCnt(hospitalSeq);
		
		Integer[] visitArr = new Integer[7];
		for(int i=0; i<visitList.size(); i++) {
			int day = visitList.get(i).getVisitDate().getDay();
			visitArr[day-1] = visitList.get(i).getVisitCnt();
		}
		
		for(int i=0; i<visitArr.length; i++) {
			if(visitArr[i]==null) {
				visitArr[i] = 0;
			}
		}
		
		return visitArr;
		
		
	}

}
