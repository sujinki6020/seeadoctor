package kr.co.seeadoctor.repository.mapper;

import kr.co.seeadoctor.repository.vo.Sample2;

public interface SampleMapper {
	public Sample2 selectSample();
	public void insertSample(Sample2 sample);
}
