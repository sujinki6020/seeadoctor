package kr.co.seeadoctor.admin.statistics.service;

import java.util.Map;

public interface StatisticsService {

	Map<String, Object> getPieData(String dateStr, int hospitalSeq);

	Integer[] getLineData(String thisYear, String thisMonth, int hospitalSeq);

	Integer[] getBarData(int hospitalSeq);
	
	

}
