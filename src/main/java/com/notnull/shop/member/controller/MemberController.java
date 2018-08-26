package com.notnull.shop.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.notnull.shop.common.PageCreate;
import com.notnull.shop.member.model.service.MemberService;
import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.product.model.service.ProductService;
import com.notnull.shop.product.model.vo.BuyInfo;


@SessionAttributes(value= {"memberLoggedIn","totalPoint"})

@Controller
public class MemberController {

	
	@Autowired
	private MemberService service;
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;
	
	@RequestMapping("/memberLoginBefore.do")
	public String memberLogin2(HttpServletRequest request , Model model) {
		
		String path =request.getHeader("Referer");
		model.addAttribute("path",path);
		
		return "member/memberLoginPage";
	}
	
	@RequestMapping("/memberEnroll.do")
	public String memberEnroll() {
		
		return "member/memberEnroll";
	}
	
	@RequestMapping("/memberAgree.do")
	public String memberagree(HttpServletRequest request) {
		
		return "member/memberAgree";
	}
	
	
	
	@RequestMapping("/memberEnroll2.do")
	public String memberEnroll2() {
		
		return "member/memberEnroll2";
	}
	
	@RequestMapping("/memberEnrollEnd2.do")
	public String memberEnrollEnd2() {
		
		return "member/memberEnrollEnd2";
	}
	
	@RequestMapping("/memberPoint.do")
	public String memberPoint(String member_id,Model model) {
		List<PointLog> pointList=service.selectPointList(member_id);
		int sum=0;
		for(PointLog point:pointList) {
			sum+=point.getPoint_increase();
		}
		model.addAttribute("sum_point",sum);
		model.addAttribute("pointList",pointList);
		return "member/memberPoint";
	}
	
	@RequestMapping("/memberRefund.do")
	public String memberRefund(String member_id,Model model) {
		List<Map> orderList = service.selectOrderList(member_id);
		model.addAttribute("orderList",orderList);
		return "member/memberRefund";
	}
	
	@RequestMapping("/memberOrderTotal.do")
	public String memberOrderTotal(String member_id,Model model) {
		List<Map> orderList = service.selectOrderList(member_id);
		int totalPoint = service.totalPoint(member_id);
		model.addAttribute("totalPoint",totalPoint);
		model.addAttribute("orderList",orderList);
		return "member/memberOrderTotal";
	}
	
	@RequestMapping("/memberExit.do")
	public String memberExit() {
		
		return "member/memberExit";
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
		String loc="/memberEnrollEnd2.do";
		
		if(result>0) {
			msg="회원가입 완료, 가입시 이용한 이메일로 인증해주세요";
			PointLog pointLog = new PointLog(0,m.getMember_id(),3000,"회원가입 증정",null);
			int result2=productService.insertPoint(pointLog);
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
	public String memberLogin(String member_id, String member_pw, String path_, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		System.out.println(member_id);
		System.out.println(member_pw);
		System.out.println(path_);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		
		PrintWriter writer =response.getWriter();
		
		Member m = service.loginCheck(member_id);
		
		String msg="";
		String loc="/";
		String view = "/common/LoginMsg";
		String path="memberLoginPage.do";
		
		if(m!=null && m.getEsc_status().equals("N")) {
			if(bcyptPasswordEncoder.matches(member_pw,m.getMember_pw())) {
				
				
				
				System.out.println("success LOGIN");
				model.addAttribute("memberLoggedIn",m);
				
				System.out.println("페이지경로는 : " +path_);
				
				System.out.println(path_);
				model.addAttribute("loc",path_);
				msg="로그인 성공!!";
				
			}else {
				System.out.println("WRONG PASSWORD");
				msg ="잘못된 비밀번호입니다.";
				model.addAttribute("path",path_);
				
				 writer.println("<script>");
			     writer.println("alert('"+msg+"');");
			     writer.println("console.log('"+msg+"')");
			     writer.println("</script>");
			     writer.flush();
				
				
				return "/member/memberLoginPage";
			}
		}else if(m!=null && m.getEsc_status().equals("Y")) {
			System.out.println("이메일인증이 안된 아이디입니다.");
			msg ="이메일 인증을 해주세요.";
			model.addAttribute("path",path_);
			
			 writer.println("<script type='text/javascript'>");
		     writer.println("alert('"+msg+"');");
		     writer.println("history.back();");
		     writer.println("</script>");
		     writer.flush();
			
			return "/member/memberLoginPage";
		}
		else if(m!=null && m.getEsc_status().equals("E")) {
			msg="탈퇴한 회원입니다.";
			model.addAttribute("path",path_);
			
			 writer.println("<script type='text/javascript'>");
		     writer.println("alert('"+msg+"');");
		     writer.println("history.back();");
		     writer.println("</script>");
		     writer.flush();
			
			return "/member/memberLoginPage";
		}else {
			System.out.println("THERE'S NO ID");
			msg ="없는 아이디입니다.";
			model.addAttribute("loc",path);
			model.addAttribute("path",path_);
			
			 writer.println("<script type='text/javascript'>");
		     writer.println("alert('"+msg+"');");
		     writer.println("history.back();");
		     writer.println("</script>");
		     writer.flush();
			
			return "/member/memberLoginPage";
			
		}

		model.addAttribute("msg",msg);
		
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
		
		model.addAttribute("id","아이디는 "+id+" 입니다.");
		
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
	public String myPage(String memberId, Model model) {
		System.out.println(memberId);
		
		String member_id = memberId;
		
		int totalPoint = service.totalPoint(member_id);
		model.addAttribute("totalPoint",totalPoint);
		
		System.out.println(totalPoint);
		
		return "member/myPage";
	}
	
	@RequestMapping("/adminPage.do")
	public String adminPage(String memberId) {
		
		System.out.println(memberId);
		
		return "member/adminPage";
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
		String loc ="memberOrderTotal.do";
		
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
	
	 
	@RequestMapping("/checkUpdatePassword.do")
	public void checkUpdatePassword(HttpServletResponse response, String original_password,  String member_id) throws IOException{

		String encode = service.selectEncode(member_id);

		String flag = bcyptPasswordEncoder.matches(original_password,encode)?"true":"false";
		
		System.out.println("비밀번호 결과값은 "+flag);
		
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(flag);
		
	}
	
	
//	//ModelAndView 이용 , 왜 안되는지 모름 
//	@RequestMapping("/checkUpdatePassword.do")
//	public ModelAndView checkUpdatePassword(HttpServletResponse response, String original_password,  String member_id, ModelAndView mv) {
//
//		String encode = service.selectEncode(member_id);
//
//		String flag = bcyptPasswordEncoder.matches(original_password,encode)?"true":"false";
//		
//		System.out.println("비밀번호 결과값은 "+flag);
//		
//		mv.addObject("flag",flag);
//		mv.setViewName("JsonView");
//		
//		return mv;
//		
//	}
	
	@RequestMapping("membershipWithdraw.do")
	public String membershipWithdraw() {
		
		return"/member/membershipWithdraw";
	}
	
	@RequestMapping("membershipWithdrawEnd.do")
	public String membershipWithdrawEnd(String email, String pw,HttpServletRequest request, HttpServletResponse response, Model model,SessionStatus sessionStatus) {
		
		System.out.println(email);
		System.out.println(pw);
	
		Member m = (Member) request.getSession().getAttribute("memberLoggedIn");
		boolean pwCheck = bcyptPasswordEncoder.matches(pw, m.getMember_pw());
		
		if(email.equals(m.getEmail()) && pwCheck==true) {
			
			int i = service.withdrawMember(m.getMember_id());
			model.addAttribute("msg","탈퇴를 완료했습니다.");
			model.addAttribute("loc","/");
			sessionStatus.setComplete();
		} else {
			model.addAttribute("msg","회원정보가 올바르지 않습니다.");
			model.addAttribute("loc","membershipWithdraw.do");
		}
		
		
		
		return"/common/msg";
	}
	
	@RequestMapping("memberExitEnd.do")
	public String memberExit(HttpServletRequest request, SessionStatus sessionStatus, Model model) {
		Member m = (Member) request.getSession().getAttribute("memberLoggedIn");
		
		int i = service.withdrawMember(m.getMember_id());
		sessionStatus.setComplete();
		
		model.addAttribute("msg","회원탈퇴를 완료하였습니다.");
		model.addAttribute("loc","/");
		
		return"/common/msg";
	}
	
	@RequestMapping("memberManagement.do")
	public ModelAndView memberManagement(HttpServletRequest request, 
									HttpServletResponse response, 
									 @RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
									  ModelAndView mv) throws IOException {
		
		Member m = (Member) request.getSession().getAttribute("memberLoggedIn");
			
		if(!(m.getMember_id().equals("admin"))) {
			  response.setContentType("text/html; charset=UTF-8");

	            PrintWriter out = response.getWriter();

	            out.println("<script>alert('권한이 없습니다.'); </script>");

	            out.flush(); 
		}
		
		//페이지당 글 
		int numPerPage = 10; 
		
		List<Member> list = service.memberList(cPage,numPerPage);
		
		System.out.println(list);
		
		int totalCount = service.selectMemberCount();
		
		System.out.println(totalCount);
		
		String pageBar = new PageCreate().getPageBar(cPage,numPerPage,totalCount,"memberManagement.do");
		
		mv.addObject("pageBar", pageBar);
		mv.addObject("member",list);
		mv.addObject("cPage", cPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("/member/memberManagement");
		
		return mv;
	}
	
	@RequestMapping("management.do")
	public String management(String member_id, Model model) {
		
		Member m = service.selectMember(member_id);
		
		System.out.println(m);
		
		model.addAttribute("member",m);
		
		return "/member/management";
	}
	
	
//	ModelAndView 왜 또 안됨? 아나 ㅋㅋ 
//	@RequestMapping("managementEnd.do")
//	public ModelAndView managementEnd(Member m, ModelAndView mv) {
//	
//		int i = service.updateManagement(m);
//		
//		if(i>0) {
//			System.out.println("성공");
//		}else {
//			System.out.println("실패");
//		}
//		
//		mv.addObject("i", i);
//		mv.setViewName("JsonView");
//		
//		return mv;
//	}
	
	@RequestMapping("/managementEnd.do")
	public void managementEnd(HttpServletResponse response, Member m) throws IOException{

		int i = service.updateManagement(m);

		if(i>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		System.out.println(i);
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().print(i);	
	}
	
	@RequestMapping("/searchMember.do")
	public String searchMember(String info, 
								Model model,
								@RequestParam(value="cPage",required=false,defaultValue="1") int cPage) {
		
		System.out.println(info);
		
		
		int numPerPage = 10; 
		
		List<Member> list = service.memberList(cPage,numPerPage,info);
		
		System.out.println(list);
		
		//카운트도해줘야함 ㅋㅋ ㅅㅂ
		int totalCount = service.selectMemberCount(info);
		
		System.out.println(totalCount);
		
		String pageBar = new PageCreate().getPageBar(cPage,numPerPage,totalCount,"memberManagement.do");
		
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("member",list);
		model.addAttribute("cPage", cPage);
		model.addAttribute("totalCount", totalCount);
		
//		mv.addObject("pageBar", pageBar);
//		mv.addObject("member",list);
//		mv.addObject("cPage", cPage);
//		mv.addObject("totalCount", totalCount);
//		mv.setViewName("/member/memberManagement");
		
		return "/member/memberManagement";
		
	}
			
	@RequestMapping("/refundRequest.do")
	public void refundRequest(BuyInfo buyInfo,HttpServletResponse response) throws IOException{
		buyInfo.setBuy_status("R");
		int result = service.updateBuyStatus(buyInfo);
		response.getWriter().print(result);	
	}
	
<<<<<<< HEAD
	@RequestMapping("/cancelRequest.do")
	public void cancelRequest(BuyInfo buyInfo,HttpServletResponse response) throws IOException{
		buyInfo.setBuy_status("P");
		int result = service.updateBuyStatus(buyInfo);
		response.getWriter().print(result);
=======
	@RequestMapping("question.do")
	public String question() {
		//
		return "/member/myPage_question";
	}
	
	@RequestMapping("writeQuestion.do")
	public String writeQuestion() {
		return "/member/myPage_writeQuestion";
	}
	
	@RequestMapping("writeQuestionEnd.do")
	public String writeQuestionEnd(Model model,
									@RequestParam(value="member_id")String member_id,
										@RequestParam(value="question_content")String question_content) {
		
		System.out.println(member_id);
		System.out.println(question_content);
		
		
		return "/member/myPage_question";
>>>>>>> 94334802272727e5635a23d34b229bffe725b2af
	}
}
