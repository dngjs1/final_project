package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

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
import com.notnull.shop.member.model.vo.Answer;
import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.member.model.vo.Question;
import com.notnull.shop.product.model.vo.BuyInfo;

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
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://"+ip+":9191/shop/emailConfirm.do?email=").append(m.getEmail()).append("&key=").append(key).append("' target='_self'>이메일 인증 확인</a>").toString());
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
		// 임시비밀번호 생성
		for (int i = 0; i < 12; i++) {
			tempPw += (char) ((Math.random() * 26) + 97);
		}
		
//		System.out.println(tempPw);
		
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

	@Override
	public int idDuplicateCheck(String id) {
		
		return memberDAO.idDuplicateCheck(sqlSession, id);
	}
	
	@Override
	public int emailDuplicateCheck(String email) {
		// TODO Auto-generated method stub
		return memberDAO.emailDuplicateCheck(sqlSession,email);
	}
	

	@Override
	public int memberUpdate(Member m) {
		
		return memberDAO.memberUpdate(sqlSession, m);
	}

	@Override
	public String selectEncode(String id) {
		
		return memberDAO.selectEncode(sqlSession, id);
	}

	@Override
	public int withdrawMember(String id) {
		
		return memberDAO.withdrawMember(sqlSession, id);
	}

	@Override
	public List<Member> memberList(int cPage, int numPerPage) {
		
		return memberDAO.memberList(sqlSession, cPage, numPerPage);
	}
	
	@Override
	public List<Member> memberList(int cPage, int numPerPage, String info) {
		
		return memberDAO.memberList(sqlSession, cPage, numPerPage, info);
	}
	
	
	@Override
	public Member selectMember(String id) {
		
		return memberDAO.selectMember(sqlSession, id);
	}

	@Override
	public int selectMemberCount() {
		
		return memberDAO.selectMemberCount(sqlSession);
	}
	
	@Override
	public int selectMemberCount(String info) {
		
		return memberDAO.selectMemberCount(sqlSession,info);
	}

	@Override
	public int updateManagement(Member m) {
		
		return memberDAO.updateManagement(sqlSession, m);
	}

	@Override
	public List<PointLog> selectPointList(String member_id, int cPage, int numPerPage) {
		return memberDAO.selectPointList(sqlSession,member_id,cPage,numPerPage);
	}

	@Override
	public int totalPoint(String member_id) {
		
		return memberDAO.totalPoint(sqlSession,member_id);
	}

	@Override
	public List<Map> selectOrderList(String member_id,int cPage,int numPerPage) {
		return memberDAO.selectOrderList(sqlSession,member_id,cPage,numPerPage);
	}
	
	@Override
	public int orderListCount(String member_id) {
		return memberDAO.orderListCount(sqlSession,member_id);
	}

	
	@Override
	public List<Map> selectOrderList(String member_id) {
		return memberDAO.selectOrderList(sqlSession,member_id);
	}
	
	@Override
	public List<Map> selectOrderList(int cPage, int numPerPage) {
		return memberDAO.selectOrderList(sqlSession,cPage,numPerPage);
	}
	@Override
	public int OrderListCount_Admin() {
		// TODO Auto-generated method stub
		return memberDAO.OrderListCount_Admin(sqlSession);
	}


	@Override
	public int updateBuyStatus(BuyInfo buyInfo) {
		return memberDAO.updateBuyStatus(sqlSession,buyInfo);
	}

	@Override
	public int insertQuestion(Question q) {
		
		return memberDAO.insertQuestion(sqlSession, q);
	}

	@Override
	public List<Question> selectQuestionList(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.selectQuestionList(sqlSession, member_id);
	}

	@Override
	public Question selectedQuestion(int question_code) {
		// TODO Auto-generated method stub
		return memberDAO.selectedQuestion(sqlSession, question_code);
	}

	@Override
	public List<Question> adminQuestionList() {
		// TODO Auto-generated method stub
		return memberDAO.adminQuestionList(sqlSession);
	}
	
	@Transactional
	@Override
	public int insertAnswer(Answer answer) {
		// TODO Auto-generated method stub
		int check= memberDAO.insertAnswer(sqlSession, answer);
			if(check==1) {
				memberDAO.updateQuestionStatus(sqlSession,answer.getQuestion_code());
			}
		
		return check;
	}

	@Override
	public Answer selectedAnswer(int question_code) {
		// TODO Auto-generated method stub
		return memberDAO.selectedAnswer(sqlSession, question_code);
	}

	@Override
	public int myPagePointTotalCount(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.myPagePointTotalCount(sqlSession,member_id);
	}

	@Override
	public List<Map> selectRefundList(String member_id, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return memberDAO.selectRefundList(sqlSession,member_id,cPage,numPerPage);
	}

	@Override
	public int RefundListCount(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.RefundListCount(sqlSession,member_id);
	}




	
}
