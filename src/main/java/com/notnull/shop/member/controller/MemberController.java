package com.notnull.shop.member.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

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
	
	//ModelAndView 이용 
	@RequestMapping("/checkIdDuplicate.do" )
	public ModelAndView checkIdDuplicate(String member_Id, ModelAndView mv) {

		System.out.println(member_Id);
		
		System.out.println("!!!!!!!!!!!!!!!!!!!!!AJAX TEST!!!!!!!!!!!!!!!!!!!!!!");
		
		boolean check = service.idDuplicateCheck(member_Id)==0?true:false;
		
		
		mv.addObject("check",check);
		mv.setViewName("JsonView");
		
		return mv;
	}
	
	
	//Ajax 아이디 중복확인
//	@RequestMapping("/checkIdDuplicate.do")
//    public void duplicateIdCheck(String member_Id,HttpServletRequest req,HttpServletResponse res) throws IOException {
//	
//		System.out.println(member_Id);
//		System.out.println("!!!!!!!!!!!!!!!!!!!!!AJAX TEST!!!!!!!!!!!!!!!!!!!!!!");
//       
//       boolean check=service.idDuplicateCheck(member_Id)==0?true:false;
//       
//       System.out.println(check);
//       
//       res.getWriter().print(check);
//    }
	
	
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
	
	@RequestMapping("/findMemberId.do")
	public String findMemberId( String email, Model model) {
		
		String id = service.findMemberId(email);
		
		if(id==null) {
			id="존재하지 않는 이메일주소입니다.";
			
			String msg=id;
			String loc ="findMember.do";
			String view = "/common/msg";
			
			model.addAttribute("msg",msg);
			model.addAttribute("loc",loc);
			
			return view;
			
		}
		
		model.addAttribute("id",id);
		
		return "member/findMember";
	}
	
	@RequestMapping("/findMemberPassword.do")
	public String findMemberPassword(String id, String email, Model model) throws MessagingException {
		
		int check = service.findMemberPassword(id,email);
		
		String msg="";
		String loc="/";
		String view = "/common/msg";
		
		if(check==1) {
			msg="임시비밀번호가 이메일로 발송됬습니다.";
		}else {
			msg="존재하지않는 ID 또는 이메일주소 입니다.";
			loc="findMember.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return view;
	}
	
	@RequestMapping("/myPage.do")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("/memberUpdate.do")
	public String memberUpdate() {
		return "member/memberUpdate";
	}
	
	@RequestMapping("/memberUpdateEnd.do")
	public String memberUpdateEnd(Member m, Model model) {
		
		if(m.getEmail_alarm()==null) {
			m.setEmail_alarm("N");
		}
		
		System.out.println("1 : " +m.getMember_pw());
		
		if(!(m.getMember_pw().equals(""))) {
			m.setMember_pw(bcyptPasswordEncoder.encode(m.getMember_pw()));
		}
		
		System.out.println("2 : " +m.getMember_pw());

		String msg ="";
		String loc ="myPage.do";
		
		int result = service.memberUpdate(m);
		
		if(result>0) {
			msg="회원정보 수정을 완료했습니다.";
			model.addAttribute("memberLoggedIn",m);
			
		}
		else {
			msg="회원정보 수정을 실패했습니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		
		return "/common/msg";
	}
	
	//ModelAndView 이용 
	@RequestMapping("/checkUpdatePassword.do")
	public void checkUpdatePassword(HttpServletResponse response, String original_password, String encodedPw, ModelAndView mv) throws IOException{


		String flag = bcyptPasswordEncoder.matches(original_password,encodedPw)?"true":"false";
	
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(flag);
		
	}
	
	
	
}
