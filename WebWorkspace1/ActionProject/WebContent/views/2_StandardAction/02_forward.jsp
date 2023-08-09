<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	여기는 forward 페이지 
	<!-- 
		포워딩 되면 어떤 내용이 있던 노출되지 않음 (include와 다름) 
		-원하는 페이지를 보여주고자 할 때 사용 (주로 메인페이지로 데이터 넘길때)
	-->
	
	<!-- forward -->
	<jsp:forward page="footer.jsp"/>
</body>
</html>