package com.notnull.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.notnull.shop.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {

		return sqlSession.insert("member.insertMember", m);
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

		sqlSession.update("member.userAuth", email);

	}

	@Override
	public String selectByEmail(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.selectOne("member.selectByEmail", email);
	}

	@Override
	public String findMemberId(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.selectOne("member.findMemberId", email);
	}

	@Override
	public int tempPassword(SqlSessionTemplate sqlSession, String id, String tempPw) {
		Member m = new Member();
		m.setMember_id(id);
		m.setMember_pw(tempPw);
		
		return sqlSession.update("member.tempPassword", m);
	}

	@Override
	public int idDuplicateCheck(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("member.duplicateIdCheck",id);
	}

	@Override
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("member.updateMember",m);
	}

}
