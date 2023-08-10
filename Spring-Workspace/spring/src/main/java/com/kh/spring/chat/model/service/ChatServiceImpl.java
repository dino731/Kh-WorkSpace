package com.kh.spring.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.chat.model.dao.ChatDao;
import com.kh.spring.chat.model.vo.ChatMessage;
import com.kh.spring.chat.model.vo.ChatRoom;
import com.kh.spring.common.Utils;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private ChatDao chatDao;
	
	@Override
	public int openChatRoom(ChatRoom chatRoom) {
		return chatDao.openChatRoom(chatRoom);
	}
	
	@Override
	public List<ChatRoom> selectChatRoomList(){
		return chatDao.selectChatRoomList();
	}
	
	@Override
	public int insertMessage(ChatMessage cm) {
		cm.setMessage(Utils.XSSHandling(cm.getMessage()));
		cm.setMessage(Utils.newLineHandling(cm.getMessage()));
		return chatDao.insertMessage(cm);
	}
	
	
	
	
	
	
	
	
	
	

}
