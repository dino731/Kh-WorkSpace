package com.kh.websocket;


// 일반 클래스를 웹소켓 서버로 등록하기 위한 방법.

@ServerEndpoint(value="/chatting.do")
public class ChattingServer {
	
	@OnOpen
	public void open(Session session, EndpointConfig config) {
		// 접속 요청한 클라이언트와 연결되면 실행되는 메소드
		System.out.println("클라이언트 접속함");
		System.out.println(session.getId());
	}

	@OnMessage
	public void message(Session session, String msg) {
		// session : 메세지를 보낸 클라이언트의 session객체
		// msg : jsp페이지에서 socket.send로 넘어온 데이터
		System.out.println(msg);
		
	}
}
