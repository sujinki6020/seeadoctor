package kr.co.seeadoctor.map.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/map")
public class AddressController {
	
	@RequestMapping(value="/address.do" ,produces="text/plain;charset=UTF-8")
	public @ResponseBody String getAddress(String q) {
		StringBuffer response = null;
		String clientId = "IutEeaTAqvux8P5IXvhG";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "eyMNJ6tSBj";//애플리케이션 클라이언트 시크릿값";
        try {
            String apiURL = "https://openapi.naver.com/v1/search/local.json?query=";
            String query = URLEncoder.encode(q, "utf-8");
            String resultCount = "&display=5";
            URL url = new URL(apiURL+query+resultCount);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return response.toString();
	}
	@RequestMapping(value="/position.do" ,produces="text/plain;charset=UTF-8")
	public @ResponseBody String getPosition(String latitude ,String longitude) {
		System.out.println("포지셔닝");
		StringBuffer response = null;
        String serviceKey = "xQForva6YupidhLn9gLiGhCigt00qdhYbUBx71%2B82rBdxRal%2BpeE5n4oNrC5mp9Nm01mF6SVAIZY8T8%2FmoFSQA%3D%3D";
            String apiURL = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?ServiceKey=";
            String page = "&page=1";
            String numOfRows = "&numOfRows=100";
            String lat = "&WGS84_LAT="+latitude;
            String lon = "&WGS84_LON="+longitude;
        try {
            URL url = new URL(apiURL + serviceKey + lat + lon + page + numOfRows);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            // post request
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("포지셔닝 끝남");
        System.out.println(response.toString());
        return response.toString();
	}
}
