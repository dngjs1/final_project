package com.notnull.shop.member.model.service;

import com.notnull.shop.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member loginCheck(String member_id);
	
}
