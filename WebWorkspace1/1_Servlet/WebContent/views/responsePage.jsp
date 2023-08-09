<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자바 주석
	// <% %\> 이 구문을 스클립틀릿 이라고 해서 HTML문서 내에 자바코드를 쓸 수 있는 영역
	// 현재 이 Jsp에서 필요로 하는 데이터들 => request의 attribute에 담겨있음(setAttribute("키",밸류))
	// request.getAttribute("키값") : Object(그에 해당하는 밸류값의 자료형)
	// Object형식에서 내가 받고자 하는 자료형으로 강제형변환해서 담아주면된다.
	String name = (String) request.getAttribute("name");
	int age = (int) request.getAttribute("age");
	String gender = (String) request.getAttribute("gender");
	String[] foods = (String[]) request.getAttribute("foods");
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		h2{color:red;}
		span{font-weight:bold;}
		#name{color:orange;}
		#age{color:yellow;}
		#gender{color:navy;}
		li{color:purple;}
</style>
</head>
<body>
	<h2> 개인정보 응답화면</h2>
	<!-- html 주석 -->
	<%-- JSP 주석 --%>
	<%-- <span id='name'><% out.print(name); %></span> --%>
	<span id='name'><%= name %></span>
	<span id='age'><%= age %></span>
	성별은
	<% if(gender == null){%>
		선택을 안했습니다. <br>
	<%}else{
		if(gender.equals("M")){
			out.print("<span id='gender'>남자</span>입니다.<br>");
		}else{
			out.print("<span id='gender'>여자</span>입니다.<br>");
		}
	}%>
	좋아하는 음식은
	<% if(foods == null){ %>
		없습니다.
		<%}else{ %>
			<ui>
			<% for(String food : foods) {%>
				<li><%= food %></li>
				<%} %>
			</ui>
	<% } %>
			

</body>
</html>