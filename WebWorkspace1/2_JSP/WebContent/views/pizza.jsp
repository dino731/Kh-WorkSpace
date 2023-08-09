<%@ page import="java.util.Date, java.text.SimpleDateFormat"  %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피나치공</title>
</head>
<body>
	 <%
	 Date date = new Date();
	 SimpleDateFormat sdf = new SimpleDateFormat("YYYY년 MM월 dd일");
	 String today = sdf.format(date);
	 
	 
	 %>

</body>
</html>