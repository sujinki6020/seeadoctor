package kr.co.seeadoctor.map.service;

import org.w3c.dom.Document;

public interface AddressService {
	public void parseDoc(Document doc,String dept);
	public void start();
	public int getTotalCount(String kind, String dept ,int index);
}
