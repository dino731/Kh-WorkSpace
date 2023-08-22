package com.ncs.test.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.ncs.test.member.model.service.MemberService;
import com.ncs.test.member.model.vo.Member;

@Controller
public class MemberController {
	
	private MemberService mService;
	
	@Autowired
	public MemberController(MemberService mService) {
		this.mService = mService;
	}
	
	@PostMapping("/login.me")
	public String memberLogin(
		@ModelAttribute Member m,
		HttpSession session,
		Model model,
		@SessionAttribute(required = false) String nextUrl
	) {

		Member loginMember = mService.memberLogin(m);
		String url = "";
		if (loginMember != null) {
			System.out.println("로그인성공"+loginMember);
			model.addAttribute("loginMember", loginMember);
			url = "redirect:/";
		} else {
			String msg = "실패여요";
			System.out.println("로그인 실패");
			model.addAttribute("로그인 실패", msg);
			url = "common/login";
		}
		
		return url;
	}
}
