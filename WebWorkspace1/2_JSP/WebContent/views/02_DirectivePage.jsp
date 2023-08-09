<%@ page import="java.util.ArrayList, java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> <%-- errorPage="error500.jsp"--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

 	<h1>page 지시어</h1>
 	<%
 		//ArrayList 사용
 		ArrayList<String> list = new ArrayList();
 		list.add("servlet");
 		list.add("jsp");
 		
 		// import하고자할 클래스들이 여러개일 경우 ,로 연이어서 작성
 		Date today = new Date();
 		
 	
 	%>
 	<p>
 		리스트의 길이는 ? <%= list.size() %> <br>
 		0번 인덱스의 값? <%= list.get(0) %> <br>
 		1번 인덱스의 값? <%= list.get(1) %> <br>
 		현재 날찌 및 시간 : <%= today %>
 	</p>
 	<%= list.get(10) %>


</body>
</html>