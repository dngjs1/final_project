package com.notnull.shop.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;

public interface MemberDAO {
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	void createAuthKey(SqlSessionTemplate sqlSession, String email, String esc_status);
	
	Member loginCheck(SqlSessionTemplate sqlSession, String member_id);
	
	void userAuth(SqlSessionTemplate sqlSession, String email);
	
	String selectByEmail(SqlSessionTemplate sqlSession, String email);
	
	String findMemberId(SqlSessionTemplate sqlSession, String email);
	
	int tempPassword(SqlSessionTemplate sqlSession, String id, String tempPw);
	
	int idDuplicateCheck(SqlSessionTemplate sqlSession, String id);
	
	int memberUpdate(SqlSessionTemplate sqlSession, Member m);
	
	String selectEncode(SqlSessionTemplate sqlSession, String id);
	
	int withdrawMember(SqlSessionTemplate sqlSession, String id);
	
	List<Member> memberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	
	List<Member> memberList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String info);
	
	int selectMemberCount(SqlSessionTemplate sqlSession);
	int selectMemberCount(SqlSessionTemplate sqlSession,String info);
	
	Member selectMember(SqlSessionTemplate sqlSession, String id);
	
	int updateManagement(SqlSessionTemplate sqlSession, Member m);
	
	List<PointLog> selectPointList(SqlSessionTemplate sqlSession,String member_id);
}
