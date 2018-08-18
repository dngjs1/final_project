package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import com.notnull.shop.member.model.vo.Member;

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
	
	Member selectMember(String id);
}
