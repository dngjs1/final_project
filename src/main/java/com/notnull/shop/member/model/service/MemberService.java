package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.member.model.vo.Answer;
import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.member.model.vo.Question;
import com.notnull.shop.product.model.vo.BuyInfo;

public interface MemberService {

	int insertMember(Member m, String ip) throws MessagingException, UnsupportedEncodingException;
	
	Member loginCheck(String member_id);
	
	String userAuth(String email);
	
	String findMemberId(String email);
	
	int findMemberPassword(String id, String email ) throws MessagingException;
	
	int idDuplicateCheck(String id);
	
	int memberUpdate(Member m);
	
	String selectEncode(String id);
	
	int withdrawMember(String id);
	
	List<Member> memberList(int cPage, int numPerPage);
	
	List<Member> memberList(int cPage, int numPerPage,String info);
	
	int selectMemberCount();
	int selectMemberCount(String info);
	
	
	Member selectMember(String id);
	
	int updateManagement(Member m);
	
	List<PointLog> selectPointList(String member_id);
	
	int totalPoint(String member_id);
	
	List<Map> selectOrderList(String member_id);
	
	int updateBuyStatus(BuyInfo buyInfo);
	
	
	int insertQuestion(Question q);
	List<Question> selectQuestionList(String member_id);
	Question selectedQuestion(int question_code);
	Answer selectedAnswer(int question_code);
	
	List<Question> adminQuestionList();
	int insertAnswer(Answer answer);
	
}
