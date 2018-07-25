package com.notnull.shop.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.notnull.shop.member.model.dao.MemberDAO;
import com.notnull.shop.member.model.vo.Member;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		
		return memberDAO.insertMember(sqlSession, m);
	}

	@Override
	public Member loginCheck(String member_id) {
		
		return memberDAO.loginCheck(sqlSession, member_id);
	}

}
