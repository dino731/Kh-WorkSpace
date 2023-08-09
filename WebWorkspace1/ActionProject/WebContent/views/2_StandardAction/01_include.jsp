<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>include</h3>
	<p>또 다른 페이지를 포함하고자 할 때 쓰이는 방식</p>
	<h4>1. 기존의 include 지시어를 이용한 방식(정적 include방식 == 컴파일 시 포함되는 형태)</h4>
	먕
<%-- 	<%@include file="footer.jsp" %> --%>
	<br><br>

	<%-- <% String contextPath = "/main"; %> --%>
<%-- 	특징 : include 하고 있는 페이지 상에 선언되어있는 변수를 현재페이지에서 사용이 가능한데,
			동일한 이름의 변수를 선언할 수가 없었다.
	현재 경로 :: <%= contextPath %><br> --%>
	
	<hr>
	<h4>2. JSP 표준 액션 태그를 이용한 방식 (동적 include 방식 == 실제 실행시 포함되는 형태)</h4>
	<jsp:include page="footer.jsp"/>
	<br><br>
	
	특징 1 : include 하고 있는 페이지에 존재하는 변수를 공유하지 않는다.
	(즉, 동일한 이름의 변수 선언 가능)
	<% String contextPath = request.getContextPath(); %>
	<%= contextPath %>
	
	<br>
	
	특징 2 : 포함 시 include하는 페이지로 값을 전달시킬 수도 있다.<br><br>
	<jsp:include page="footer.jsp">
	<jsp:param name="test" value="test!"/>
	</jsp:include>
	<jsp:include page="footer.jsp">
	<jsp:param name="test" value="ming!"/>
	</jsp:include>




</body>
</html>