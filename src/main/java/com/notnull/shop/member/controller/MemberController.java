package com.notnull.shop.member.controller;


import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;


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
	public String memberEnrollEnd(Member m,Model model, HttpServletRequest request) throws UnsupportedEncodingException, MessagingException {
		
		
		if(m.getEmail_alarm()==null) {
			m.setEmail_alarm("N");
		}
		
		String pw = m.getMember_pw();
		m.setMember_pw(bcyptPasswordEncoder.encode(pw));
		
		String ip = request.getLocalAddr();
		
		int result = service.insertMember(m, ip);
		System.out.println(result);
		
		String msg="";
		String loc="/";
		
		if(result>0) {
			msg="회원가입 완료, 가입시 이용한 이메일로 인증해주세요";
		}else {
			msg="회원가입 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
	}
	
	
	@RequestMapping("/memberLogin.do")
	public String memberLogin(String member_id, String member_pw, Model model, HttpServletRequest request) {
		
		System.out.println(member_id);
		System.out.println(member_pw);
		
		Member m = service.loginCheck(member_id);
		
		String msg="";
		String loc="/";
		String view = "/common/msg";
		
		if(m!=null && m.getEsc_status().equals("N")) {
			if(bcyptPasswordEncoder.matches(member_pw,m.getMember_pw())) {
				System.out.println("success LOGIN");
				model.addAttribute("memberLoggedIn",m);
				
				msg="SUCCESS LOGIN";
				
			}else {
				System.out.println("WRONG PASSWORD");
				msg ="WRONG PASSWORD";
			}
		}else if(m!=null && m.getEsc_status().equals("Y")) {
			System.out.println("이메일인증이 안된 아이디입니다.");
			msg ="이메일 인증을 해주세요.";
		}
		else {
			System.out.println("THERE'S NO ID");
			msg ="WRONG ID";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		
		System.out.println(request.getLocalAddr());
		
		return view;
	}
	
	@RequestMapping("/memberLogout.do")
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
	public String eamilAuth() {
		System.out.println("EAMIL AUTH");
		
		return "redirect:/";
	}
	
	@RequestMapping("/emailConfirm.do")
	public String emailConfirm(String email, Model model, HttpServletRequest request) {
		
		String name = service.userAuth(email);
	
		
		model.addAttribute("name",name);
		
		return "member/emailConfirm";
		
		
	}
	
	@RequestMapping("/findMember.do")
	public String findMember() {
		return "member/findMember";
	}
	
	
}
