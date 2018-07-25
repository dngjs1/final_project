package com.notnull.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.notnull.shop.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(SqlSessionTemplate sqlSession, Member m);
	
	Member loginCheck(SqlSessionTemplate sqlSession, String member_id);
	
	
}
