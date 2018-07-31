package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
	
	@Inject
	private JavaMailSender mailSender;
	
	@Transactional
	@Override
	public int insertMember(Member m) throws MessagingException, UnsupportedEncodingException {
		
		int check = memberDAO.insertMember(sqlSession, m); // 회원가입 DAO

		String key = new TempKey().getKey(50, false); // 인증키 생성

		memberDAO.createAuthKey(sqlSession,m.getEmail(), key); // 인증키 DB저장

		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[SHOP 서비스 이메일 인증]");
		sendMail.setText(
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:9191/shop/emailConfirm.do?email=").append(m.getEmail()).append("&key=").append(key).append("' target='_blenk'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("euichan", "shop TEST");
		sendMail.setTo(m.getEmail());
		sendMail.send();
		
		
		return check;
	}

	@Override
	public Member loginCheck(String member_id) {
		
		return memberDAO.loginCheck(sqlSession, member_id);
	}

	@Override
	public void userAuth(String email) {
		
		memberDAO.userAuth(sqlSession, email);
		
	}

}
