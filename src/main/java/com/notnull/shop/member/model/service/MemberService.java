package com.notnull.shop.member.model.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import com.notnull.shop.member.model.vo.Member;
import com.notnull.shop.member.model.vo.PointLog;

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
	
	List<Member> memberList(int cPage, int numPerPage,String info);
	
	int selectMemberCount();
	int selectMemberCount(String info);
	
	
	Member selectMember(String id);
	
	int updateManagement(Member m);
	
	List<PointLog> selectPointList(String member_id);
	
	int totalPoint(String member_id);
}
