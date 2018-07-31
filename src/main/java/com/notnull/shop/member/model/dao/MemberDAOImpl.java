package com.notnull.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.notnull.shop.member.model.vo.Member;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("member.insertMember",m);
	}

	@Override
	public Member loginCheck(SqlSessionTemplate sqlSession, String member_id) {
		
		return sqlSession.selectOne("member.loginCheck", member_id);
	}

	@Override
	public void createAuthKey(SqlSessionTemplate sqlSession, String email, String esc_status) {
		Member m = new Member();
		m.setEmail(email);
		m.setEsc_status(esc_status);
		
		sqlSession.update("member.createAuthKey", m);
	}

	@Override
	public void userAuth(SqlSessionTemplate sqlSession, String email) {
		
		sqlSession.update("member.userAuth",email);
	}

}
