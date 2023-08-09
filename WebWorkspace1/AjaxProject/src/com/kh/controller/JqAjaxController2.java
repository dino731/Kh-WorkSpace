package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class JqAjaxController2
 */
@WebServlet("/jqAjax2.do")
public class JqAjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JqAjaxController2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
//		//ajax는 결과값을 딱 한개만 응답해줄 수 있음
//		// 이름따로, 나이따로 이렇게 보낼 수 없다..
//		// 요청 처리를 다 했다는 가정하에 하나의 문자열로 이어줘서 응답 데이터를 꾸며줄 예정.
//		
//		String responseData = "이름 : " + name + ", 나이 : " + age;
//		
//		response.getWriter().print(responseData);
		
		// 버전 2. 응답데이터를 여러개 반환해주고 싶다.=> JSON을 이용하면 된다.
		/*
		 * JSON(Javascript Object Notation) :  자바스크립트 객체 표기법
		 * - ajax 통신시 데이터 전송에 가장 많이 사용되는 포맷중에 하나
		 * 
		 * - JSON 처리시 사용되는 클래스 종류
		 * 
		 * 	json-simple-xxx.jar => 기본적으로 자바에서 제공하는 api가 아님.(외부 라이브러리 필요)
		 * 
		 * 	https://code.google.com/archive/p/json-simple/downloads
		 * 
		 * 1. JSONArray [vlaue, value, value} : 배열형태
		 * 2. JSONObject { key : value, key : value } : 객체형태
		 * 
		*/
		
		// 1. JSONArray
//		JSONArray jarr = new JSONArray(); // []
//		jarr.add(name); //["민경민"]
//		jarr.add(age); // ["민경민","35"]
//		
//		// 응답할 데이터의 COntentType 을 설정해주기. dafault => text/html -> 문자열
//		response.setContentType("application/json; charset=UTF-8");
//		response.getWriter().print(jarr); // 응답 결과가 result안에 담긴다.

		
		// 2. JSONObject
		JSONObject jobj = new JSONObject(); //{}
		jobj.put("name",name);
		jobj.put("age", age);
		
		response.setContentType("application/json; charset=UTF-8");
		
		response.getWriter().print(jobj);
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
