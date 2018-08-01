package com.notnull.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	void createAuthKey(SqlSessionTemplate sqlSession, String email, String esc_status);
	
	Member loginCheck(SqlSessionTemplate sqlSession, String member_id);
	
	void userAuth(SqlSessionTemplate sqlSession, String email);
	
	String selectByEmail(SqlSessionTemplate sqlSession, String email);
	
	String findMemberId(SqlSessionTemplate sqlSession, String email);
	
	int tempPassword(SqlSessionTemplate sqlSession, String id, String tempPw);
	
	
}
