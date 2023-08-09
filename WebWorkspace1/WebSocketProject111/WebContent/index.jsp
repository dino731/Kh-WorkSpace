<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input type=text" id="sender" size="10" placeholder="보내는사림이름">
<input type="text" id="receiver" size="10" placeholder="받는사람이름">
<input type="text" id="msg" placeholder="전송할메시지">
<button onclick="sendMsg();">전송</button>
<div id="msgcontainer">

</div>

<script>
	const socket = new WebSocket("ws://ip주소:8081/<%= request.getContextPath()%>/chatting.do");
	// socket 설정하기
	// 1. 소켓에 접속후 실행되는 이벤트 핸들러 등록
	socket.onopen = function(e){
		console.log("웹소켓 접속 성공");
		console.log(e);
	}
	
	// 2. 웹소켓 서버로 메세지를 전송하는 함수.
	const sendMsg = () => {
		// 발솔자, 수신자, 메세지내용
		//메세지 객체를 만든 후, JSON.stringify()함수를 이용하여 JSON오브젝트로 만들어준 후 전송할 것
		let msg = {
			sender : $("#sender").val(),
			receiver : $("#receiver").val(),
			msg : $("#msg").val()
		}
		socket.send(JSON.stringify());
	}
</script>












</body>
</html>