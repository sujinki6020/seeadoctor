package kr.co.seeadoctor.admin.statistics.service;

import java.util.Map;

public interface StatisticsService {

	Map<String, Object> getPieData(String dateStr, int hospitalSeq);

	Map<String, Object> getLineData(String thisYear, String thisMonth, int hospitalSeq);
	
	

}
