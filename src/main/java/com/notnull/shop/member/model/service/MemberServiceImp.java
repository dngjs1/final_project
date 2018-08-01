package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.notnull.shop.common.MailHandler;
import com.notnull.shop.common.TempKey;
import com.notnull.shop.member.model.dao.MemberDAO;
import com.notnull.shop.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder bcyptPasswordEncoder;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public int insertMember(Member m, String ip) throws MessagingException, UnsupportedEncodingException {
		
		
		if(ip.equals("0:0:0:0:0:0:0:1")) {
			ip ="localhost";
		}
		
		System.out.println("IP ADRESS : " +ip);
		
		int check = memberDAO.insertMember(sqlSession, m); // 회원가입 DAO

		String key = new TempKey().getKey(50, false); // 인증키 생성

		memberDAO.createAuthKey(sqlSession,m.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[SHOP 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://"+ip+":9191/shop/emailConfirm.do?email=").append(m.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("euichan", "shop TEST");
		sendMail.setTo(m.getEmail());
		sendMail.send();
		

		return check;
	}

	@Override
	public Member loginCheck(String member_id) {
		
		return memberDAO.loginCheck(sqlSession, member_id);
	}
	
	@Transactional
	@Override
	public String userAuth(String email) {
		
		memberDAO.userAuth(sqlSession, email);
		
		return memberDAO.selectByEmail(sqlSession,email);
	}

	@Override
	public String findMemberId(String email) {
		
		return memberDAO.findMemberId(sqlSession, email);
	}
	
	@Transactional
	@Override
	public int findMemberPassword(String id, String email) throws MessagingException {
		
		int check=0;
		String tempPw = ""; //암호화 이전 비밀번호
		for (int i = 0; i < 12; i++) {
			tempPw += (char) ((Math.random() * 26) + 97);
		}
		
		System.out.println(tempPw);
		
		String encodedPw =  bcyptPasswordEncoder.encode(tempPw); //암호화 이후 비밀번호
	
		if(id.equals(memberDAO.findMemberId(sqlSession, email))) {
			check = memberDAO.tempPassword(sqlSession, id, encodedPw);
	
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[SHOP 임시비밀번호 발급]");
			sendMail.setText(id+"님의 임시비밀번호는 "+tempPw+" 입니다");			
		//	sendMail.setFrom("euichan", "shop TEST");
			sendMail.setTo(email);
			sendMail.send();
		
		}
		
		
		
			
		return check;
	}

}
