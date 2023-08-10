package com.kh.spring.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.chat.model.service.ChatService;
import com.kh.spring.chat.model.vo.ChatRoom;
import com.kh.spring.chat.model.vo.ChatRoomJoin;
import com.kh.spring.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"loginUser","chatRoomNo"})
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@GetMapping("/chat/chatRoomList")
	public String selectChatRoomList(Model model) {
		
		// 업무로직 - DB에서 채팅방 목록 조회
		List<ChatRoom> crList = service.selectChatRoomList();
		log.info("채팅방 리스트 ==== {}",crList);
		model.addAttribute("chatRoomList", crList);
		return "chat/chatRoomList";
	}
	
	@PostMapping("/chat/openChatRoom")
	public String openChatRoom(
			@ModelAttribute("loginUser") Member loginUser,
			Model model,
			ChatRoom chatRoom,
			RedirectAttributes ra
			) {
		chatRoom.setUserNo(loginUser.getUserNo());
	 int chatRoomNo = service.openChatRoom(chatRoom);
	 
	 String path = "redirect:/chat/";
	 
	 if(chatRoomNo > 0) {
		 ra.addFlashAttribute("alertMsg","채팅방 생성 성공!");
		 path += "room/"+chatRoomNo;
	 }else {
		 ra.addFlashAttribute("alertMsg", "채팅방 만들기 실패");
		 path +="chatRoomList";
	 }
	 return path;
	 
	}
	
	// 채팅방 입장
	@GetMapping("/chat/room/{chatRoomNo}")
	public String joinChatRoom(
			@ModelAttribute("loginUser") Member loginUser,
			Model model,
			@PathVariable("chatRoomNo") int chatRoomNo,
			ChatRoomJoin join,
			RedirectAttributes ra
			) {
	join.setUserNo(loginUser.getUserNo());
	join.setChatRoomNo(chatRoomNo);
	
	// 업무로직- 채팅방의 채팅내용 불러오기. + 채팅방 입장기능
	return "chat/chatRoom";
	
	}
	
	
	

}
