package com.notnull.shop.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.notnull.shop.member.model.service.MemberService;
import com.notnull.shop.member.model.vo.Member;


@SessionAttributes(value= {"memberLoggedIn"})

@Controller
public class MemberController {

	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;
	
	
	@RequestMapping("/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	@RequestMapping(value="/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m,Model model) {
		
		
		if(m.getEmail_alarm()==null) {
			m.setEmail_alarm("N");
		}
		
		String pw = m.getMember_pw();
		m.setMember_pw(bcyptPasswordEncoder.encode(pw));
			
		int result = service.insertMember(m);
		System.out.println(result);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="회원가입 완료";
		}else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
	}
	
	
	@RequestMapping("/memberLogin.do")
	public String memberLogin(String member_id, String member_pw, Model model) {
		
		System.out.println(member_id);
		System.out.println(member_pw);
		
		Member m = service.loginCheck(member_id);
		
		String msg="";
		String loc="/";
		String view = "/common/msg";
		
		if(m!=null) {
			if(bcyptPasswordEncoder.matches(member_pw,m.getMember_pw())) {
				System.out.println("success LOGIN");
				model.addAttribute("memberLoggedIn",m);
				
				msg="SUCCESS LOGIN";
				
			}else {
				System.out.println("WRONG PASSWORD");
				msg ="WRONG PASSWORD";
			}
		}else {
			System.out.println("THERE'S NO ID");
			msg ="WRONG ID";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return view;
	}
	
	@RequestMapping("memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		if(!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}
		return "redirect:/";
	}
	
	@RequestMapping("memberView.do")
	public String memberView() {
		
		return "member/memberView";
	}
	
	@RequestMapping("emailAuth.do")
	public void eamilAuth() {
		System.out.println("EAMIL AUTH");
	}
}
