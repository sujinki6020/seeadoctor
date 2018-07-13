package kr.co.seeadoctor.map.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import kr.co.seeadoctor.repository.mapper.HospitalMapper;
import kr.co.seeadoctor.repository.vo.Hospital;
@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private HospitalMapper mapper;
	
	@Override
	public void parseDoc(Document doc,String dept) {
		System.out.println("문서 파싱중");
		int itemLength = doc.getElementsByTagName("item").getLength();
		Hospital hospital = new Hospital();
		hospital.setQd(dept);
		for(int i = 0 ; i < itemLength ; i++) {
			int childLength = doc.getElementsByTagName("item").item(i).getChildNodes().getLength();
			for(int k = 0 ; k < childLength ; k++) {
				String key = doc.getElementsByTagName("item").item(i).getChildNodes().item(k).getNodeName();
				String value = doc.getElementsByTagName("item").item(i).getChildNodes().item(k).getTextContent();
				switch (key) {
				case "rnum":
					hospital.setRnum(value);
					break;
				case "dutyAddr":
					hospital.setDutyAddr(value);
					break;
				case "dutyDiv":
					hospital.setDutyDiv(value);
					break;
				case "dutyDivNam":
					hospital.setDutyDivNam(value);
					break;
				case "dutyEmcls":
					hospital.setDutyEmcls(value);
					break;
				case "dutyEmclsName":
					hospital.setDutyEmclsName(value);
					break;
				case "dutyEryn":
					hospital.setDutyEryn(value);
					break;
				case "dutyEtc":
					hospital.setDutyEtc(value);
					break;
				case "dutyMapimg":
					hospital.setDutyMapimg(value);
					break;
				case "dutyName":
					hospital.setDutyName(value);
					break;
				case "dutyTel1":
					hospital.setDutyTel1(value);
					break;
				case "dutyTel3":
					hospital.setDutyTel3(value);
					break;
				case "dutyTime1c":
					hospital.setDutyTime1c(value);
					break;
				case "dutyTime2c":
					hospital.setDutyTime2c(value);
					break;
				case "dutyTime3c":
					hospital.setDutyTime3c(value);
					break;
				case "dutyTime4c":
					hospital.setDutyTime4c(value);
					break;
				case "dutyTime5c":
					hospital.setDutyTime5c(value);
					break;
				case "dutyTime6c":
					hospital.setDutyTime6c(value);
					break;
				case "dutyTime7c":
					hospital.setDutyTime7c(value);
					break;
				case "dutyTime8c":
					hospital.setDutyTime8c(value);
					break;
				case "dutyTime1s":
					hospital.setDutyTime1s(value);
					break;
				case "dutyTime2s":
					hospital.setDutyTime2s(value);
					break;
				case "dutyTime3s":
					hospital.setDutyTime3s(value);
					break;
				case "dutyTime4s":
					hospital.setDutyTime4s(value);
					break;
				case "dutyTime5s":
					hospital.setDutyTime5s(value);
					break;
				case "dutyTime6s":
					hospital.setDutyTime6s(value);
					break;
				case "dutyTime7s":
					hospital.setDutyTime7s(value);
					break;
				case "dutyTime8s":
					hospital.setDutyTime8s(value);
					break;
				case "hpid":
					hospital.setHpid(value);
					break;
				case "postCdn1":
					hospital.setPostCdn1(value);
					break;
				case "postCdn2":
					hospital.setPostCdn2(value);
					break;
				case "wgs84Lon":
					hospital.setWgs84Lon(value);
					break;
				case "wgs84Lat":
					hospital.setWgs84Lat(value);
					break;
				case "dutyInf":
					hospital.setDutyInf(value);
					break;
				}
			}
			System.out.println(hospital.toString());
			System.out.println("====================================================================================");
			mapper.insertHospital(hospital);
		}	
	}
	
	
	@Override
	public void start() {
		String[] kinds = {"A","B","C"};
		String[] depts = new String[29];
		for(int i = 1 ; i < 30 ; i++) {
			depts[i - 1] = "D0"+ (( 10 > i )? "0" + i : i); 
		}
		for(int i = 0 ; i < kinds.length ; i++) {
			for(int k = 0 ; k < depts.length ; k++) {
				System.out.println("종류" + kinds[i] + "부서" + depts[k]);
				int count = getTotalCount(kinds[i], depts[k],1);
				if(count > 500) {
					getTotalCount(kinds[i], depts[k],2);
				}
			}
		}
		
	}
	
	public int getTotalCount(String kind, String dept , int index) {
        String serviceKey = "xQForva6YupidhLn9gLiGhCigt00qdhYbUBx71%2B82rBdxRal%2BpeE5n4oNrC5mp9Nm01mF6SVAIZY8T8%2FmoFSQA%3D%3D";
        String apiURL = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncListInfoInqire?ServiceKey=";
        String QZ = "&QZ=" + kind ;
        String QD = "&QD=" + dept;
        String pageNo = "&pageNo="+ index;
        String numOfRows ="&numOfRows=500";
        int count = 0;
        try {
        	String Q0 = "&Q0=" +  URLEncoder.encode("서울특별시","UTF-8") ;
            String Q1 = "&Q1=" + URLEncoder.encode("강남구","UTF-8") ;
            URL url = new URL(apiURL + serviceKey + Q0 + Q1 + QZ + QD +  pageNo + numOfRows);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            // post request
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    			DocumentBuilder parser = factory.newDocumentBuilder();
    			Document doc = parser.parse(con.getInputStream());
    			NodeList totalCount = doc.getElementsByTagName("totalCount");
    			count = Integer.parseInt(totalCount.item(0).getTextContent());
    			System.out.println(" 총 개수  : " + count);
    			parseDoc(doc,dept);
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return count;
	}
}
