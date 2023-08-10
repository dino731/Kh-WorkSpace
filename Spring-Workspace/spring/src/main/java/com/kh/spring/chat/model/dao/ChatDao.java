package com.kh.spring.chat.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.chat.model.vo.ChatMessage;
import com.kh.spring.chat.model.vo.ChatRoom;

@Repository
public class ChatDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int openChatRoom(ChatRoom chatRoom) {
		int result = sqlSession.insert("chattingMapper.openChatRoom", chatRoom);
		
		if(result >0) {
			result = chatRoom.getChatRoomNo();
		}
		return result;
		
	}
	
	public List<ChatRoom> selectChatRoomList(){
		return sqlSession.selectList("chattingMapper.selectChatRoomList" );
	}

	public int insertMessage(ChatMessage cm) {
		return sqlSession.insert("chattingMapper.insertMessage",cm);
	}
}
