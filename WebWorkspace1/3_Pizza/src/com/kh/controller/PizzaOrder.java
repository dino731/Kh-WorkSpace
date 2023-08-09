package com.kh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PizzaOrder
 */
@WebServlet("/order")
public class PizzaOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PizzaOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 전달 값 중에 한글이 있을 경우 인코딩처리(POST방식일때만!)
		// request.setCharacterEncoding("UTF-8");
		
		// 2. 요청시 전달값 뽑기 및 데이터 가공처리 => 변수 및 객체 기록
		// request.getParameter("키값" : 밸류값(String)
		// request.getParameterValues("키값") : (String[])
		// => 만일 키값이 존재하지 않을 경우 : null 값 반환했음.
		
		String pizza = request.getParameter("pizza");
		String [] toppings = request.getParameterValues("topping");
		String [] sides = request.getParameterValues("side");
		
		// 3. 요청처리
		// 보통의 흐름 : DB에 SQL문 실행한 후 결과 값 돌려 받은 -> attribute영역에 데이터 셋팅
//					 -> jsp로 응답처리 위임(forward)
		int price = 0;
		
		switch(pizza) {
		case "콤비네이션피자" : price += 6000; break;
		case "치즈피자" : price += 5000; break;
		case "포테이토피자" : price += 5000; break;
		case "고구마피자" : price += 7000; break;
		case "불고기피자" : price += 8000; break;
		}
		
		for(String topping : toppings) {
			switch(topping ) {
			case "고구마무스" : price += 1000; break;
			case "콘크림무스" : price += 5000; break;
			case "파인애플토핑" : price += 5000; break;
			case "치즈크러스트" : price += 7000; break;
			case "불고기피자" : price += 2000; break;
			case "치즈바이트" : price += 3000; break;
			}
		}
		for(String side : sides) {
			switch(side) {
			case "오븐구이통닭" : price += 9000; break;
			case "치킨스틱&윙" : price += 4900; break;
			case "치즈오븐스파게티" : price += 4000; break;
			
			}
		}
		
		request.setAttribute("pizza", pizza);
		request.setAttribute("toppings", toppings);
		request.setAttribute("sides", sides);
		request.setAttribute("price", price);
		
		// 위임 시 필요한 객체 : RequestDispatcher객체
		// 1. 응답하고자하는 뷰 선택후 생성
		request.getRequestDispatcher("views/pizzaResponsePage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
