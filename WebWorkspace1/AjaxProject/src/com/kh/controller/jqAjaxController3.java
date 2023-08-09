package com.kh.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class jqAjaxController3
 */
@WebServlet("/jqAjax3.do")
public class jqAjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jqAjaxController3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member m = new MemberService().loginMember(userId, userPwd);
		
//		response.getWriter().print(m); Member클래스의 toString()메소드가 호출된 값이 넘어감
//		JSONObject jobj = new JSONObject();
//		jobj.put("userNo", m.getUserNo());
//		jobj.put("userId",m.getUserId());
//		jobj.put("userPwd",m.getUserPwd());
		
		response.setContentType("application/json; charset=UTF-8");
		
		//response.getWriter().print(jobj);
		
		// GSON : Google JSON
		// GSON 라이브러리 연동
		// https://mvnrepository.com/artifact/com.google.code.gson/gson/2.8.2
		
//		Gson gson = new Gson();
//		gson.toJson(m);
		new Gson().toJson(m, response.getWriter());
		
		// toJson(응답할 객체 , 응답할 스트림) : 응답할 스트림으로 응답할 객체를 자동으로 JSON형태로 변환하여 전달시킴.
		// 응답할 객체가 일반 VO객체라면 JSONObject로 만들어져서 응답.
		// 응답할 객체가 ArrayList라면 JSONArray로 만들어져서 응답
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
