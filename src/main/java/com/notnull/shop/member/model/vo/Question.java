package com.notnull.shop.member.model.vo;

import java.sql.Date;

public class Question {
	private int question_code;
	private String member_id;
	private String question_content;
	private Date question_date;
	private String status;
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	public Question(int question_code, String member_id, String question_content, Date question_date, String status) {
		super();
		this.question_code = question_code;
		this.member_id = member_id;
		this.question_content = question_content;
		this.question_date = question_date;
		this.status = status;
	}

	public int getQuestion_code() {
		return question_code;
	}

	public void setQuestion_code(int question_code) {
		this.question_code = question_code;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public Date getQuestion_date() {
		return question_date;
	}

	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Question [question_code=" + question_code + ", member_id=" + member_id + ", question_content="
				+ question_content + ", question_date=" + question_date + ", status=" + status + "]";
	}
	
	
}
