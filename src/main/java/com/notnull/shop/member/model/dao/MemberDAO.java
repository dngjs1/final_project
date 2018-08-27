package com.notnull.shop.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.member.model.vo.Answer;
import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;
import com.notnull.shop.member.model.vo.Question;
import com.notnull.shop.product.model.vo.BuyInfo;

public interface MemberDAO {
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	void createAuthKey(SqlSessionTemplate sqlSession, String email, String esc_status);
	
	Member loginCheck(SqlSessionTemplate sqlSession, String member_id);
	
	void userAuth(SqlSessionTemplate sqlSession, String email);
	
	String selectByEmail(SqlSessionTemplate sqlSession, String email);
	
	String findMemberId(SqlSessionTemplate sqlSession, String email);
	
	int tempPassword(SqlSessionTemplate sqlSession, String id, String tempPw);
	
	int idDuplicateCheck(SqlSessionTemplate sqlSession, String id);
	int emailDuplicateCheck(SqlSessionTemplate sqlSession, String email);
	
	int memberUpdate(SqlSessionTemplate sqlSession, Member m);
	
	String selectEncode(SqlSessionTemplate sqlSession, String id);
	
	int withdrawMember(SqlSessionTemplate sqlSession, String id);
	
	List<Member> memberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	
	List<Member> memberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String info);
	
	int selectMemberCount(SqlSessionTemplate sqlSession);
	int selectMemberCount(SqlSessionTemplate sqlSession,String info);
	
	Member selectMember(SqlSessionTemplate sqlSession, String id);
	
	int updateManagement(SqlSessionTemplate sqlSession, Member m);
	
	List<PointLog> selectPointList(SqlSessionTemplate sqlSession,String member_id, int cPage, int numPerPage);
	
	int totalPoint(SqlSessionTemplate sqlSession, String member_id);
	
	List<Map> selectOrderList(SqlSessionTemplate sqlSession,String member_id,int cPage, int numPerPage);
	
	int orderListCount(SqlSessionTemplate sqlSession,String member_id);
	
	List<Map> selectOrderList(SqlSessionTemplate sqlSession,String member_id);
	
	List<Map> selectOrderList(SqlSessionTemplate sqlSession,int cPage, int numPerPage);
	int OrderListCount_Admin(SqlSessionTemplate sqlSession);
	
	int updateBuyStatus(SqlSessionTemplate sqlSession,BuyInfo buyInfo);
	
	int insertQuestion(SqlSessionTemplate sqlSession, Question q);
	List<Question> selectQuestionList(SqlSessionTemplate sqlSession, String member_id);
	Question selectedQuestion(SqlSessionTemplate sqlSession, int question_code);
	Answer selectedAnswer(SqlSessionTemplate sqlSession, int question_code);
	
	List<Question> adminQuestionList(SqlSessionTemplate sqlSession);
	int insertAnswer(SqlSessionTemplate sqlSession, Answer answer);
	void updateQuestionStatus(SqlSessionTemplate sqlSession, int question_code);
	
	int myPagePointTotalCount(SqlSessionTemplate sqlSession, String member_id);
}
