package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import com.notnull.shop.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m, String ip) throws MessagingException, UnsupportedEncodingException;
	
	Member loginCheck(String member_id);
	
	String userAuth(String email);
	
}
