package com.kh.opendata;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class APIController {
	
	public static final String serviceKey = "ImY01YJbNoulG2R25NIfXRX%2B8M6mWNMnM7%2FJj5wKi8%2BSmtYbmVxDJCgtVN2fsEgyeeI2hX2tdkhrpJPbRqdtVw%3D%3D";
	
	@RequestMapping(value="air.do", produces = "application/json; charset=UTF-8")
	public String airPollution(String location)throws IOException{
		// 요청주소
		String url = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
		url += "?serviceKey="+serviceKey;
		url += "&returnType=json";
		url += "&numOfRows=50"; // 반환받는 결과값 개수
		url += "&sidoName="+URLEncoder.encode(location,"UTF-8");
		
		URL requestUrl = new URL(url); //요청하고자 하는 url 주소를 매개변수로 전달하면서 객체를 생성한다
		
		// 2. 생성된 url 객체를 가지고 HttpURLConnection 객체 생성
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		// 3. 전송방식 설정
		urlConnection.setRequestMethod("GET");
		// 4. 요청 주소에 적힌 OpenAPI서버로 요청 보낸 후 "스트림"을 활용하여 응답데이터 읽어들이기
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		// 5. 반복적으로 응답데이터를 읽어들이기
		String responseTest = "";
		String line;
		
		while((line = br.readLine()) != null) {
			responseTest += line;
			
		}
		
		System.out.println(responseTest);
		
		// 다쓴 자원 반납
		br.close();
		urlConnection.disconnect();
		
		// 응답데이터를 보내주고자하면 문자열 값 그대로 넘겨주면 알아서 JSON형태로 응답된다.
		//{"response":{"body":{"totalCount":40,"items":[{"so2Grade":"1","coFlag":null,"khaiValue":"54","so2Value":"0.003","coValue":"0.5","pm10Flag":null,"o3Grade":"1","pm10Value":"34","khaiGrade":"2","sidoName":"서울","no2Flag":null,"no2Grade":"1","o3Flag":null,"so2Flag":null,"dataTime":"2023-08-17 10:00","coGrade":"1","no2Value":"0.023","stationName":"정릉로","pm10Grade":"1","o3Value":"0.025"}
		return responseTest;
	}

		@RequestMapping(value="air2.do", produces = "text/xml; charset=UTF-8")
		public String airPollution2(String location)throws IOException{
			// 요청주소
			String url = "http://apis.data.go.kr/B552584/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty";
			url += "?serviceKey="+serviceKey;
			url += "&returnType=xml";
			url += "&numOfRows=50"; // 반환받는 결과값 개수
			url += "&sidoName="+URLEncoder.encode(location,"UTF-8");
			
			URL requestUrl = new URL(url); //요청하고자 하는 url 주소를 매개변수로 전달하면서 객체를 생성한다
			
			// 2. 생성된 url 객체를 가지고 HttpURLConnection 객체 생성
			HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
			
			// 3. 전송방식 설정
			urlConnection.setRequestMethod("GET");
			// 4. 요청 주소에 적힌 OpenAPI서버로 요청 보낸 후 "스트림"을 활용하여 응답데이터 읽어들이기
			BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
			
			// 5. 반복적으로 응답데이터를 읽어들이기
			String responseTest = "";
			String line;
			
			while((line = br.readLine()) != null) {
				responseTest += line;
				
			}
			
			System.out.println(responseTest);
			
			// 다쓴 자원 반납
			br.close();
			urlConnection.disconnect();
			
			// 응답데이터를 보내주고자하면 문자열 값 그대로 넘겨주면 알아서 JSON형태로 응답된다.
			//{"response":{"body":{"totalCount":40,"items":[{"so2Grade":"1","coFlag":null,"khaiValue":"54","so2Value":"0.003","coValue":"0.5","pm10Flag":null,"o3Grade":"1","pm10Value":"34","khaiGrade":"2","sidoName":"서울","no2Flag":null,"no2Grade":"1","o3Flag":null,"so2Flag":null,"dataTime":"2023-08-17 10:00","coGrade":"1","no2Value":"0.023","stationName":"정릉로","pm10Grade":"1","o3Value":"0.025"}
			return responseTest;
		}
	

}
